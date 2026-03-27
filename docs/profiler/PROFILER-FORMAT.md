# FMOD Studio Profiler Capture Format

> Reverse-engineered from FMOD Studio 2.02.20 profiler session data.
> This document describes the file layout, data semantics, and correlation model for profiler captures.

---

## Session Structure

A profiler capture session is stored in a GUID-named folder (e.g. `{7193f45a-e4be-4153-b0ee-ffd197ceffd2}/`) containing four files:

| File | Format | Size (example) | Role |
|------|--------|-----------------|------|
| `session.xml` | FMOD Studio XML | ~25 KB | Session metadata: tracks, graphs, mixer topology, recording marker |
| `apicommands-0000.txt` | Plain text | ~940 KB | Complete FMOD API command replay log, grouped by frame |
| `capture-0000.wav` | PCM WAV | ~4.9 MB | Stereo audio capture of the output mix |
| `session.graphdata` | Binary | ~6.8 MB | Time-series metric data (CPU, voices, memory, etc.) |

The `-0000` suffix suggests FMOD supports splitting into numbered segments for longer captures.

---

## File Details

### 1. `session.xml` — Session Metadata

FMOD's standard XML serialization (`serializationModel="Studio.02.02.00"`). Key objects:

#### `ProfilerSession` (root)
- **`name`**: Session name (default: "New Session")
- **`outputFormat`**: Audio output format (0 = default)
- **`profilerTracks`**: List of `ProfilerTrack` GUIDs — one per bus/event being monitored
- **`profilerSystemTrack`**: Single `ProfilerSystemTrack` GUID — system-wide metrics

#### `ProfilerTrack`
Each track monitors one FMOD object (bus or event) identified by `objectBeingTracked` GUID.

#### `ProfilerSystemTrack`
System-wide metrics. Contains `automationTracks` — a list of `ProfilerGraph` entries, each with a `graphType` integer and an `objectBeingGraphed` GUID.

**Known `graphType` values** (from the XML, mapped to likely FMOD Studio profiler panel metrics):

| graphType | Likely Metric |
|-----------|--------------|
| 0 | CPU (DSP) % |
| 1 | CPU (Update) % |
| 2 | Channels |
| 3 | CPU (Total) % |
| 4 | Self Voices |
| 8 | Memory (FMOD) |
| 9 | Memory (Virtual) |
| 10 | Instances |
| 11 | Voices |
| 104 | File I/O (Reads) |
| 105 | File I/O (Bytes) |

> **Note**: These mappings are inferred from profiler UI labels and value ranges. They have not been confirmed by FMOD documentation.

#### `ProfilerRecordingMarker`
Placed at position 0 on the timeline, with a human-readable timestamp name (e.g. "04:47:22 PM") indicating when recording started.

#### Mixer Objects
The session also contains `EventMixer`, `EventMixerMaster`, `MasterTrack`, `MixerBusEffectChain`, `MixerBusFader`, and `MixerBusPanner` — representing the capture-time mixer state.

---

### 2. `apicommands-0000.txt` — API Command Log

**This is the highest-value file for analysis.** Plain text, line-oriented, fully parseable.

#### Header
```
Playback::frame, 0
Playback::version, 2, 131616
#
# FMOD v2.02.20 command capture
#   System::setSoftwareChannels(numsoftwarechannels: 64)
#   System::setDSPBufferSize(bufferlength: 1024, numbuffers: 4)
#   System::setSoftwareFormat(samplerate: 48000, speakermode: 3, numrawspeakers: 2)
#   ...
#   Studio::System::initialize(maxchannels: 256, studioflags: 0x00000001, flags: 0x00030000)
#
```

The comment block captures the initialization parameters: sample rate (48000 Hz), buffer size (1024 samples), max channels (256).

#### Frame Structure

Commands are grouped by `Playback::frame` markers:
```
Playback::frame, <sampleDelta>
<command>, <args...>
<command>, <args...>
Playback::frame, <sampleDelta>
...
```

The `sampleDelta` is the number of audio samples since the last frame. At 48000 Hz with buffer size 1024, each frame is typically 1024 samples = ~21.3ms. Accumulated sample deltas give the timeline position.

#### Command Vocabulary

| Command | Arguments | Meaning |
|---------|-----------|---------|
| `Playback::frame` | sampleDelta | Frame boundary, advances timeline |
| `Playback::version` | major, build | FMOD version identifier |
| `Playback::loadBankFinished` | guid, handle, result | Bank finished loading |
| `System::loadBankFile` | path, flags, handle | Load a bank file |
| `System::getEvent` | path, handle | Get event description by path |
| `System::setListenerAttributes` | index, {{pos},{vel},{fwd},{up}}, {attenuationPos}, isOverride | Listener 3D position |
| `System::setParameterByName` | name, value, ignoreSeek | Set global parameter |
| `Bank::getBusListItem` | bankHandle, index, guid, handle | Enumerate buses in bank |
| `Bank::getEventListItem` | bankHandle, index, guid, handle | Enumerate events in bank |
| `EventDescription::createInstance` | descHandle, instanceHandle | Create event instance |
| `EventInstance::start` | handle | Start playing |
| `EventInstance::stop` | handle, mode | Stop (0=allow fadeout, 1=immediate) |
| `EventInstance::release` | handle | Release instance |
| `EventInstance::set3DAttributes` | handle, {{pos},{vel},{fwd},{up}} | Set 3D position |
| `EventInstance::setVolume` | handle, volume | Set volume (1.0 = unity) |
| `EventInstance::setPitch` | handle, pitch | Set pitch (1.0 = normal) |
| `EventInstance::setParameterByName` | handle, name, value, ignoreSeek | Set local parameter |
| `EventInstance::setTimelinePosition` | handle, position | Set playback position |
| `EventInstance::getChannelGroup` | handle, channelGroupHandle | Get underlying channel group |

#### Handle Resolution

Event instances are identified by numeric handles (e.g. `2187008`). To resolve what event an instance represents:

1. Find the `EventDescription::createInstance, <descHandle>, <instanceHandle>` line
2. The `descHandle` maps back to a `Bank::getEventListItem` or `System::getEvent` line that provides the GUID or path
3. The GUID matches an event in the FMOD project

---

### 3. `capture-0000.wav` — Audio Capture

Standard PCM WAV file:
- **Sample Rate**: 48000 Hz (matches `System::setSoftwareFormat`)
- **Channels**: 2 (stereo)
- **Bit Depth**: 16-bit PCM
- **Duration**: Matches the accumulated apicommands frame samples

#### Time Correlation with API Commands

Given a timestamp `t` seconds:
- **WAV byte offset** = 44 (header) + floor(t × 48000) × 2 channels × 2 bytes
- **API frame** = find frame where accumulated sample count brackets `t × 48000`

---

### 4. `session.graphdata` — Binary Metric Data

**Partially decoded.** Contains time-series data for the `ProfilerGraph` entries defined in the XML.

#### File Structure (Big-Endian)

```
[Header]
  int32   version_or_flags     (observed: 15)
  double  sessionDurationSec   (25.6426... matches WAV + apicommands)

[Track Records — repeated per tracked object]
  int32   recordCount          (observed: 59 for first record set)
  bytes16 objectGUID           (raw bytes, big-endian, matches objectBeingTracked)
  int32   unknown1             (observed: 20 — possibly field count)
  int32   unknown2             (observed: 1 — possibly series index)
  ... variable-length data ...

[System Track Section — at end of per-track data]
  bytes16 systemObjectGUID     (28889e88-e58b-440c-9687-8879e4f60424)
  ... 16 bytes padding ...
  int32   graphType            (observed: 3 = likely "CPU Total %")
  int32   dataPointCount       (observed: 992)
  [Data Points — repeated dataPointCount times]
    double  timestampSec       (monotonically increasing, 0 to sessionDuration)
    double  value              (metric value at this timestamp, e.g. 0.0-1.0 for %)

[Section Separator — after each data block]
  double  timeStep             (0.1066... = 5120/48000 = 5 buffers)
  double  sessionDurationSec   (repeated)
  ... next section ...

[Footer]
  ... references to companion filenames as UTF-16LE strings:
  "capture-0000.wav"
  "apicommands-0000.txt"
```

#### What's Decoded
- **Session duration** is at offset 0x04 as a big-endian double
- **System track metric data** (graph type 3) is confirmed as time-value double pairs: timestamps span 0 to sessionDuration, values are fractional (consistent with CPU % in the 0.1-0.8 range)
- **Section separators** use a recurring double pattern (the time step between samples: 5120/48000 ≈ 0.1067 seconds)
- **Footer** contains UTF-16LE companion filenames

#### What's Not Yet Decoded
- The per-bus/event track data (between the first GUID at 0x10 and the system track GUID at 0x2B0DE8 — ~2.8 MB of data)
- The exact meaning of the header fields beyond version/duration
- How the 11 graph types are laid out (they may be sequential sections after the system track GUID)
- Whether there's a separate section for each `ProfilerTrack` or if they're interleaved

#### Stretch Goal: Full Decode
The binary data contains ~1800 occurrences of the time-step separator double, suggesting roughly that many data sections. With 11 graph types × ~62 tracks × some having data = ~680+ sections with data. A full decode would require:
1. Writing a binary parser that walks the file sequentially
2. Matching section GUIDs to `ProfilerTrack.objectBeingTracked` from the XML
3. Inferring graph type from value ranges and section ordering

---

## Timeline Correlation Model

All four files share a common timeline anchored by **accumulated audio samples at 48000 Hz**:

```
Timeline:     t=0.0s          t=0.5s          t=1.0s          t=25.6s
              |                |                |                |
WAV:          [sample 0]      [sample 24000]   [sample 48000]   [sample 1229248]
              byte 44         byte 96044       byte 192044      byte ~4.9MB

apicommands:  frame 0         ~frame 23        ~frame 47        frame 668
              (bank loads)    (gameplay cmds)  (gameplay cmds)  (last cmds)

graphdata:    datapoint[0]    datapoint[~5]    datapoint[~9]    datapoint[991]
              t=0.107s        t=0.533s         t=1.067s         t=25.643s
```

The graphdata samples at ~5-buffer intervals (~0.107s), while apicommands frames fire at 1-buffer intervals (~0.021s). The WAV is continuous.

---

## Scripting API Surface

The FMOD Studio scripting API (2.02/2.03) provides full programmatic control of profiler sessions.
ProfilerSession is a subtype of Event — it inherits all Event methods (play, stop, pause, etc.)
plus profiler-specific methods.

### Confirmed API (tested in FMOD Studio 2.02.28)

| API | What it does |
|-----|-------------|
| `project.model.ProfilerSession.findInstances()` | List all profiler sessions |
| `project.lookup("profilersession:/name")` | Find a profiler session by path |
| `project.create("ProfilerSession")` | Create a new profiler session |
| `project.deleteObject(session)` | Delete a profiler session |
| `session.name` | Get/set session name |
| `session.id` | Session GUID |
| `session._filePath` | Full disk path to session XML (reveals capture file directory) |
| `session.isRecording()` | Check if currently recording (capturing data) |
| `session.isPlaying()` | Check if playback is active |
| `session.isPaused()` | Check if paused |
| `session.isStopping()` | Check if in stopping state |
| `session.toggleRecording()` | Start/stop recording. First call starts, second stops capture (but playback continues!) |
| `session.stopImmediate()` | Stop playback. Call after `toggleRecording()` to fully stop. |
| `session.play()` | Start playback of a recorded session |
| `session.togglePause()` | Toggle pause on playback |
| `session.returnToStart()` | Return playback to start |
| `session.keyOff()` | Key off |
| `window.navigateTo(session)` | Navigate UI to profiler session (REQUIRED before toggleRecording) |
| `project.save()` | Flush capture files to disk (REQUIRED after stopping recording) |
| `window.triggerAction("ToggleConnectToGame")` | Toggle Live Update connection (action 31). No API to query state. |

### Profiler-specific properties

| Property | Type | Description |
|----------|------|-------------|
| `session.profilerTracks` | Array | Per-object tracking entries. Auto-populated during recording based on active events/snapshots. |
| `session.profilerSystemTrack` | Object | System-wide metrics track (ProfilerSystemTrack entity) |
| `session.profilerTrackers` | Array | Internal tracker objects |
| `session.profilerGraphs` | Array | Time-series graph definitions |

### ProfilerTrack properties (per-track)

| Property | Description |
|----------|-------------|
| `track.entity` | Type name (e.g. "ProfilerTrack") |
| `track.objectBeingTracked` | Reference to the FMOD object being tracked (Event, Snapshot, etc.) |
| `track.objectBeingTracked.entity` | Type of tracked object (e.g. "Event", "Snapshot") |
| `track.objectBeingTracked.name` | Name of tracked object |
| `track.objectBeingTracked.id` | GUID of tracked object |

### Recording lifecycle

```
create → name → save → navigateTo → toggleRecording (start)
→ ... (capture running) ...
→ toggleRecording (stop capture — isPlaying stays true!)
→ stopImmediate (stop playback)
→ project.save() (flush capture files to disk)
→ query_profiler_session (parse from disk)
```

**Key gotcha:** `toggleRecording()` stops recording but does NOT stop playback.
Must call `stopImmediate()` separately, then `project.save()` to flush files to disk.

### Multi-segment WAV

Long recordings produce multiple capture WAV files: `capture-0000.wav`, `capture-0001.wav`, etc.
Confirmed in testing — a session produced 57.6MB + 7.9MB split WAVs.

### Internal model types (accessible via findInstances)

These types are accessible via `studio.project.model.<Type>.findInstances()`:
- `ProfilerTrack` — per-object tracking entry
- `ProfilerSystemTrack` — system-wide metrics track
- `ProfilerGraph` — time-series graph with `graphType`
- `ProfilerRecordingMarker` — recording start timestamp

---

## Open Questions

1. Is the `session.graphdata` binary format stable across FMOD versions?
2. What do graphType values 104/105 actually measure (assumed File I/O)?
3. Is there a way to correlate apicommands handles with the per-track GUIDs in graphdata?
4. Does FMOD support exporting profiler data in any text/JSON format?
