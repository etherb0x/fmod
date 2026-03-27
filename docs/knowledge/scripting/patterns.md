# Domain: Scripting Patterns

## Critical (Tier 0 -- always loaded)

### SCRIPT-P01: Events -- list, get by path/GUID, create
- **Tags:** events, enumeration, creation

#### List all events
```js
studio.project.model.Event.findInstances()
```

#### Get event by path or GUID
```js
studio.project.lookup("event:/Path/To/Event")
studio.project.lookup("{guid-here}")
```

#### Create event
```js
var folder = studio.project.lookup("event:/");  // or "event:/MyFolder"
var ev = studio.project.create("Event");
ev.folder = folder;
ev.name = "MyEvent";
studio.project.save();
```

#### Walk folder tree (preferred for fresh/modified entities)
```js
function walkFolder(folder, callback) {
  folder.items.forEach(function(item) {
    if (item.entity === "EventFolder") walkFolder(item, callback);
    else if (item.entity === "Event") callback(item);
  });
}
walkFolder(studio.project.workspace.masterEventFolder, function(ev) {
  // process event
});
```

Note: After XML editing + restart, prefer tree walk over `findInstances()` -- the latter may return stale `isValid: false` objects.

---

### SCRIPT-P02: Tracks -- names and colors
- **Tags:** tracks, colors, groups

The visible **track name** and **track color** are on the track's **mixerGroup**, not on the GroupTrack itself.

- **Name:** `event.groupTracks[i].mixerGroup.name = "SFX 1"`
- **Color:** `event.groupTracks[i].mixerGroup.color = "Blue"`

```js
// Add group track
var track1 = event.addGroupTrack("SFX 1");

// Set color on all group tracks
for (var i = 0; i < event.groupTracks.length; i++)
  event.groupTracks[i].mixerGroup.color = "Blue";
```

---

### SCRIPT-P03: Effect chain -- add, remove, reorder
- **Tags:** effect-chain, nullify, reorder

**Add by type (no preset):**
```js
chain.addEffect("ThreeEQEffect");
chain.addEffect("MixerSend");
chain.addEffect("MixerBusFader");
```

**Remove (persists on save -- splice does NOT):**
```js
effect._nullify();
```

**Reorder pattern:**
```js
// 1. Snapshot current values
// 2. _nullify() all effects (skip MixerBusFader -- see SCRIPT-R02)
var effects = chain.effects;
for (var i = effects.length - 1; i >= 0; i--) {
    if (effects[i].entity !== "MixerBusFader") effects[i]._nullify();
}
// 3. addEffect in desired order
chain.addEffect("ThreeEQEffect");
chain.addEffect("MixerSend");
// 4. Restore values
// 5. Save
studio.project.save();
```

---

### SCRIPT-P04: Bulk processing -- minimize round-trips
- **Tags:** performance, batch, enumeration

**Principle:** Do all filtering and aggregation inside a single `execute_batch` `tcp.execute_script` call. Return one JSON result.

```js
(function() {
  var items = studio.project.model.Event.findInstances(); // or EventMixerReturn, MixerSend, etc.
  var results = [];
  items.forEach(function(item) {
    if (/* your condition */) results.push(item.name);
  });
  return JSON.stringify(results);
})();
```

Rules:
1. Single script, full result -- put entire query + filter + aggregate in one script.
2. Filter in FMOD, not in the LLM -- iterate inside the script, don't fetch batches.
3. Never call one execute_batch tcp.execute_script per event, per bus, or per return.

---

### SCRIPT-P05: Useful globals
- **Tags:** globals, utility

| Need | Code |
|------|------|
| Event path | `event.getPath()` |
| Current selection | `studio.window.browserCurrent()` |
| Save project | `studio.project.save()` |
| Inspect object | `obj.dump()` or `obj.properties`, `obj.relationships` |

---

### SCRIPT-P06: Performance gotchas
- **Tags:** performance, regex, single-threaded

**FMOD's scripting console is single-threaded.** If the user interacts with FMOD Studio UI while a script runs over TCP, the UI thread takes priority and the socket stalls. Avoid interacting with FMOD while scripts run.

**Regex is slow in FMOD's JS engine.** Use `indexOf` instead of `.match()` or `new RegExp()` when iterating large data sets. On large projects, regex on `getPath()` can time out; `indexOf` is significantly faster.

```js
// SLOW (times out on large projects)
events.filter(function(ev) { return ev.getPath().match(/\/_[^/]+\//); });

// FAST
events.filter(function(ev) { return ev.getPath().indexOf('/_') >= 0; });
```

**Avoid O(n²) patterns.** Pre-build a lookup map in one pass:
```js
// Build routing map once -- O(n)
var routeTargetIds = {};
events.forEach(function(ev) {
  (ev.groupTracks || []).forEach(function(t) {
    try { if (t.mixerGroup && t.mixerGroup.output) routeTargetIds[t.mixerGroup.output.id] = true; } catch(e) {}
  });
});
// Check in O(1)
var isRouteTarget = !!routeTargetIds[mg.id];
```

---

## Important (Tier 1 -- loaded for domain agents)

### SCRIPT-P10: Master track and effect presets
- **Tags:** master-track, effect-presets

```js
// Apply an effect preset to the event's master track
var preset = studio.project.lookup("{preset-guid}");
event.masterTrack.mixerGroup.effectChain.addEffect(preset);

// Find effect preset by name
var presets = studio.project.model.EffectPreset.findInstances();
for (var i = 0; i < presets.length; i++)
  if (presets[i].name === "General") { preset = presets[i]; break; }

// Full pattern: create event with 3 blue tracks and "General" on master
var folder = studio.project.lookup("event:/");
var generalPreset = studio.project.lookup("{preset-guid}"); // find GUID via name lookup above
var ev = studio.project.create("Event");
ev.folder = folder;
ev.name = "MyEvent";
ev.masterTrack.mixerGroup.effectChain.addEffect(generalPreset);
for (var j = 1; j <= 3; j++) {
  var track = ev.addGroupTrack("SFX " + j);
  track.mixerGroup.color = "Blue";
}
studio.project.save();
```

---

### SCRIPT-P11: Mixer -- effect chain order and effect type
- **Tags:** mixer, effect-chain, effect-type, sends

**Effect chain structure:** `effectChain.effects` is a single ordered array. Lower index = processed first. Contains both effects and sends.

**Effect type:** Use `effect.entity`, not `effect.constructor.name`. The latter often returns `"Object"`.

**Object IDs:** Use `obj.id` for MixerGroup and MixerReturn matching -- NOT `obj.guid` (often undefined).

**Check effects before a send:**
```js
var reverbReturn = studio.project.model.MixerReturn.findInstances().filter(function(r){return r.name==="Reverb";})[0];
var chain = someStrip.effectChain;
var sendIndex = -1;
for (var i = 0; i < chain.effects.length; i++) {
  if (chain.effects[i].mixerReturn && chain.effects[i].mixerReturn.id === reverbReturn.id) {
    sendIndex = i; break;
  }
}
var hasEffectBefore = sendIndex > 0 && chain.effects[0].entity !== "MixerSend";
```

**EQ types:** `ThreeEQEffect`, `ParamEqEffect`, `MultibandEqEffect`, `HighpassEffect`, `LowpassEffect`.

**Walk output chain for sends on ancestor buses:**
```js
function trackSendsToReverbNoEq(track, reverbReturnName, eqTypes) {
  var current = track.mixerGroup;
  var seen = {};
  while (current && !seen[current.id]) {
    seen[current.id] = true;
    var ec = current.effectChain;
    if (ec && ec.effects) {
      for (var i = 0; i < ec.effects.length; i++) {
        var e = ec.effects[i];
        if (e.mixerReturn && e.mixerReturn.name === reverbReturnName) {
          var check = track.mixerGroup;
          var seen2 = {};
          while (check && !seen2[check.id]) {
            seen2[check.id] = true;
            var cec = check.effectChain;
            if (cec && cec.effects) {
              var limit = (check === current) ? i : cec.effects.length;
              for (var j = 0; j < limit; j++)
                if (eqTypes.indexOf(cec.effects[j].entity) >= 0) return false;
            }
            if (check === current) break;
            check = check.output;
          }
          return true;
        }
      }
    }
    current = current.output;
  }
  return false;
}
var eqTypes = ["ThreeEQEffect","ParamEqEffect","MultibandEqEffect","HighpassEffect","LowpassEffect"];
```

---

### SCRIPT-P12: EventMixerReturn (return tracks)
- **Tags:** return-track, reverb, mixer-return

`event.addReturnTrack("Reverb")` creates ReturnTrack + EventMixerReturn. Access via `returnTracks[i].mixerReturn`. Template color: `"Green Light 1"`.

```js
var reverbReturn = event.addReturnTrack("Reverb");
reverbReturn.mixerReturn.color = "Green Light 1";
// Access: event.returnTracks[i].mixerReturn
// Find via: EventMixerReturn.findInstances()
```

---

### SCRIPT-P13: Instance limiting (maxVoices)
- **Tags:** instance-limiting, maxVoices

Instance limit is on `event.automatableProperties.maxVoices`. Default/unlimited = **65** (not 0 or -1).

```js
var ev = studio.project.lookup("event:/My/Event");
var ap = ev.automatableProperties;
ap.maxVoices = 5;    // limit to 5 instances
studio.project.save();
```

**Find looping events with unlimited instances:**
```js
var events = studio.project.model.Event.findInstances();
var unlimited = [];
for (var i = 0; i < events.length; i++) {
    var ev = events[i];
    if (!ev.isValid) continue;
    if (!ev.isOneShot() && ev.automatableProperties.maxVoices === 65) {
        unlimited.push(ev.getPath());
    }
}
return JSON.stringify({ count: unlimited.length, events: unlimited });
```

---

### SCRIPT-P14: Duplicate / template an event via scripting
- **Tags:** event-creation, duplication, programmer-instruments

There is **no native "duplicate" function** in FMOD's scripting API. The browser right-click "Duplicate" is application-level -- not exposed to scripts.

```js
// Template approach: read source, create new, mirror structure
var src = studio.project.lookup("event:/Templates/MyTemplate");
var dst = studio.project.create("Event");
dst.folder = src.folder; // or a different folder
dst.name = "MyEvent_Copy";
// Manually recreate tracks, effects, instruments, parameters, routing
studio.project.save();
```

**Preferred alternative -- Programmer Instruments:** For "many identical events, each with a different audio file," use one event with a Programmer Instrument. Game code supplies the audio file at runtime.

| Scenario | Approach |
|----------|----------|
| Many events differing only by audio file | Programmer Instrument |
| Events differing in structure | Script-based template reconstruction |
| One-off duplication during authoring | FMOD Studio UI Duplicate |

---

### SCRIPT-P15: Intent → domain/command mapping table
- **Tags:** intent-mapping, reference, daemon, composability

Check this table before constructing any `execute_batch` payload. Match the user's intent to the right domain, command, and sequence. Rules and patterns referenced in the table contain code examples and gotchas.

#### Discovery & Querying

| User intent | Domain | Command / approach | Notes & refs |
|---|---|---|---|
| "find events matching X" | `query` | `search` via `query_fmod` | Cache-first. Use `types` to narrow scope. Never use `execute_batch` `query` for broad discovery (SCRIPT-R37). |
| "show me event details" | `query` | `event_details` via `query_fmod` | Requires fully qualified path or GUID (SCRIPT-R27). After XML edits, use GUID not path (XML-R03). |
| "list banks / bank assignments" | `query` | `banks` via `query_fmod` | Use `include_events: true` for event→bank mapping. |
| "list parameters" | `query` | `parameters` via `query_fmod` | Name is on `presetOwner.name`, not `.name` (SCRIPT-R15). |
| "show mixer hierarchy" | `query` | `mixer_state` via `query_fmod` | Use `include_effects: true` for full effect chains. |
| "events with reverb send" | `tcp` | `execute_script` | Walk output hierarchy from track's `mixerGroup`; find bus with `MixerSend` to the return (match by `mixerReturn.name` or path). |
| "no EQ before the send" | `tcp` | `execute_script` | Check `effect.entity` for EQ types on all buses in path from track's bus up to bus with send. |
| "main reverb under SFX" | `tcp` | `execute_script` | Target: `MixerReturn` with `name === "Reverb"` and `path` containing `"SFX"`. |
| "loops" / "looping events" | `tcp` | `execute_script` | `!event.isOneShot()` -- covers LoopRegion, looping SingleSound, looping MultiSound. See SCRIPT-P22. |
| "instance limits" / "no limit" | `tcp` | `execute_script` | `automatableProperties.maxVoices === 65` (GUI shows ∞, data stores 65). See SCRIPT-P13. |
| Match events to mixer groups | `tcp` | `execute_script` | Use `mixerGroup.id` (not `guid`) for lookup sets (SCRIPT-R15). |
| "events with [effect type]" | N/A | Grep XML on disk | Scripting API cannot traverse effect→event (SCRIPT-R32). Use SCRIPT-P23 workflow. |
| "preset" vs "non-preset" effect | N/A | Parse XML per-object | `<relationship name="preset">` within the `<object>` block. Parse per-object, not by proximity (SCRIPT-R31). |
| "is this used in game code?" | `code` | `search` | Pass `names` array + `search_root`. For FMOD-internal refs, check 5 relationship types (SCRIPT-R35). |
| "check entity cache for X" | `cache` | `match` | Pattern-based search against entity-cache.json. |

#### Creation & Mutation

| User intent | Domain | Command / approach | Notes & refs |
|---|---|---|---|
| "create events for X" | `events` | `run_pipeline` | Full pipeline: schema → script → execute → bank assign → build. Handles templates, bus routing, banks. |
| "create events" (manual) | `tcp` | `execute_script` | `studio.project.create("Event")`. Must set `folder`, `name`, `mixerInput.output` (SCRIPT-R06). Batch in one script (SCRIPT-R21). |
| "create a folder" | `tcp` | `execute_script` | `studio.project.create("EventFolder")`. Check for existing first (SCRIPT-R22). |
| "add tracks to event" | `tcp` | `execute_script` | `event.addGroupTrack("Name")`. Color is on `track.mixerGroup.color` (SCRIPT-P02). |
| "add return track / reverb" | `tcp` | `execute_script` | `event.addReturnTrack("Name")`. Access via `.mixerReturn` not `.mixerGroup` (SCRIPT-R11). |
| "add effects / plugins" | `tcp` | `execute_script` | `chain.addEffect("ThreeEQEffect")` — type string, not object (SCRIPT-R10). |
| "add effect preset" | `tcp` | `execute_script` | `chain.addEffect(presetObj)` where preset is from `studio.project.lookup("{guid}")` (SCRIPT-P10). |
| "remove effects" | `tcp` | `execute_script` | `effect._nullify()` — never splice (SCRIPT-R05). Never nullify MixerBusFader (SCRIPT-R02). |
| "reorder effects" | `tcp` | `execute_script` | Snapshot values → `_nullify()` all (skip fader) → `addEffect()` in order → restore → save (SCRIPT-P03). |
| "change bus routing" | `tcp` | `execute_script` | `ev.mixerInput.output = studio.project.lookup("{BUS_GUID}")` (SCRIPT-R03). |
| "set instance limit" | `tcp` | `execute_script` | `ev.automatableProperties.maxVoices = N` (SCRIPT-P13). Default unlimited = 65. |
| "make it loop" | `tcp` | `execute_script` | Create LoopRegion with all 4 properties: position, length, markerTrack, timeline (SCRIPT-R24). |
| "duplicate event" | `tcp` | `execute_script` | No `.duplicate()` API — reconstruct manually (SCRIPT-R17). Or use XML clone for structure (XML-R16). |
| "replicate mixer from reference" | `tcp` | `execute_script` | Read ALL properties first, then apply exact values (SCRIPT-R18, SCRIPT-P20). |
| "delete events / objects" | `tcp` | `execute_script` | `obj._nullify()` + `studio.project.save()`. Ghosts persist until reload (SCRIPT-R12). |
| "assign to bank" | `events` | `assign_bank` | Accepts `event_path` or `event_paths` + `bank_path`. Works via GUID even when `query_fmod` can't find the event post-XML-edit (PIPE-R10). |

#### XML Pipeline

| User intent | Domain | Command / approach | Notes & refs |
|---|---|---|---|
| "apply template to events" | `xml` | `execute_patch` with `apply_template` | Strict sequence: create → save → cache.load → batch patches with `skip_restart: true` → final patch without skip → assign bank → build (XML-R01). |
| "batch XML edits" | `xml` | `execute_batch` or `execute_multi` | Use `skip_restart: true` on all but the last op. Single restart at the end (XML-R17 in CLAUDE.md). |
| "modify effect properties via XML" | `xml` | `execute_patch` with `effect_properties` | Properties are camelCase — look up exact names in `property-mappings.md` (XML-R15). |
| "clone routing structure" | `xml` | Python `fmod_xml.clone_routing_structure` | Python cloner is authoritative, handles more types than TypeScript (XML-R16). |

#### Process & Infrastructure

| User intent | Domain | Command / approach | Notes & refs |
|---|---|---|---|
| "build banks" | `process` | `build_banks` | May timeout on large projects — increase timeout (PIPE-R11). Always follows event creation or XML edits. |
| "restart FMOD" | `process` | `restart` then `wait_for_ready` | Required after XML mutations. First TCP call after restart may timeout — retry once (SCRIPT-R23). |
| "is FMOD running?" | `process` | `is_running` | Returns boolean. Daemon auto-launches FMOD on ConnectionRefused if session config has `fmod_exe`. |
| "launch FMOD" | `process` | `launch` | Target `FMOD Studio.exe` (with space), not `fmodstudio.exe` (PIPE-R02). |
| "kill FMOD" | `process` | `kill` | Hard kill. Prefer `restart` for most workflows. |
| "record audio" | `audio` | `start_sox` → `stop_sox` | Returns pid. Stop with pid + output_path. |
| "transcribe audio" | `audio` | `transcribe` | Whisper-based. Use `probe_whisper` first to check availability. |
| "load entity cache" | `cache` | `load` | May timeout after restart — retry once (SCRIPT-R23). |
| "resolve GUID from path" | `cache` | `resolve_guid` | Entity cache must be loaded first. |

#### Composing Multi-Step Batches

When a workflow requires multiple steps, use a single `execute_batch` call with `$step[N]` references:

```json
[
  {"domain": "cache", "command": "resolve_guid", "params": {"cache_path": "...", "path": "event:/My/Event"}},
  {"domain": "tcp", "command": "execute_script", "params": {"script": "var ev = studio.project.lookup('$step[0].data'); ..."}}
]
```

Key composition rules:
- **Batch deterministic steps** into one `execute_batch` call — don't make N sequential tool calls (ARCH-01).
- **`$step[N].data.path`** references resolve at daemon execution time. The LLM builds the full payload upfront.
- **`skip_restart: true`** on intermediate XML ops — restart once at the end, not per-op.
- **Break on failure** — if any step fails, subsequent steps don't execute. Design for this.
- **Scripts must use explicit `return`** — bare expressions produce `data: ""` with no error (SCRIPT-R38).

---

### SCRIPT-P16: Filtering events by path substring
- **Tags:** enumeration, filtering

```js
var events = studio.project.model.Event.findInstances();
var creature = events.filter(function(e) {
  var path = (e.getPath ? e.getPath() : "").toLowerCase();
  return path.indexOf("creature") !== -1;
});
```

Use `indexOf` not regex -- see SCRIPT-P06 for performance reasons.

---

### SCRIPT-P17: Snapshot references -- entity type map
- **Tags:** snapshots, enumeration

Snapshots appear in events in three ways -- check all three for a complete audit:

| How it appears in FMOD | Entity type | Property holding the snapshot ref |
|------------------------|-------------|-----------------------------------|
| Snapshot module on timeline | `SnapshotModule` | `.event` (NOT `.snapshot`) |
| Event instrument pointing to snapshot | `EventSound` | `.event` |
| Command instrument targeting snapshot | `CommandSound` | `.commandTarget` |

`SnapshotModule` is by far the most common. `SnapshotModule.snapshot` returns `undefined` -- use `.event`.

```js
studio.project.model.SnapshotModule.findInstances().forEach(function(m) {
  try { var p = m.event.getPath(); /* ... */ } catch(e) {}
});
studio.project.model.EventSound.findInstances().forEach(function(e) {
  try { var p = e.event.getPath(); /* ... */ } catch(e) {}
});
studio.project.model.CommandSound.findInstances().forEach(function(c) {
  try { var p = c.commandTarget.getPath(); /* ... */ } catch(e) {}
});
```

---

### SCRIPT-P18: Deletion and verification with _nullify()
- **Tags:** deletion, nullify, verification

`_nullify()` works for Snapshots, ParameterPresets, effects, and most model objects. Nullified objects remain in `findInstances()` with `isValid: false` until project reload.

**Verification -- always filter by isValid, not count:**
```js
var presets = studio.project.model.ParameterPreset.findInstances();
var valid = 0, invalid = 0;
for (var i = 0; i < presets.length; i++) {
  if (presets[i].isValid) valid++;
  else invalid++;
}
return JSON.stringify({ valid: valid, invalid: invalid });
```

**Batch deletion pattern:**
```js
var names = ["param1", "param2"];
var presets = studio.project.model.ParameterPreset.findInstances();
var deleted = [];
for (var i = 0; i < presets.length; i++) {
  if (!presets[i].isValid) continue;
  if (names.indexOf(presets[i].name) >= 0) {
    presets[i]._nullify();
    deleted.push(presets[i].name);
  }
}
studio.project.save();
return JSON.stringify({ deleted: deleted });
```

---

### SCRIPT-P19: AudioFile properties
- **Tags:** audio-files

`AudioFile` has **no `.name` property**. Use `.assetPath` for the file path.

Key properties: `assetPath`, `channelCount`, `frequencyInKHz`, `length`, `isStreaming`, `entity` (`"AudioFile"`).

```js
var assets = studio.project.model.AudioFile.findInstances();
assets.forEach(function(a) {
  var path = a.assetPath;       // "sweetners/cracking_ice.wav"
  var channels = a.channelCount; // 1 or 2
  var freq = a.frequencyInKHz;   // 48
});
```

---

## Reference (Tier 2 -- loaded on demand)

### SCRIPT-P20: Replicate mixer setup from a reference event
- **Tags:** mixer, replication, template, return-track

When copying a submix/command/snapshot/reverb setup, **always read ALL properties first** (colors, effect values, send targets, send levels), then apply exact values to the target.

```js
var ref = studio.project.lookup("event:/Reference/Boss/Event");
var target = studio.project.lookup("event:/Target/Event");

// 1. Read reference return track details
var refMR = ref.returnTracks[0].mixerReturn;
var refEffectValues = [];
for (var i = 0; i < refMR.effectChain.effects.length; i++) {
    var eff = refMR.effectChain.effects[i];
    var props = { entity: eff.entity };
    for (var key in eff) {
        var val = eff[key];
        if (typeof val !== 'function' && typeof val !== 'object') props[key] = val;
        if (typeof val === 'object' && val && val.entity) props[key + '_ref'] = val.name || val.id;
    }
    refEffectValues.push(props);
}

// 2. Add Submix (Blue), Command (Purple), Snapshot (Red) group tracks
var submixTrack = target.addGroupTrack("Submix");
submixTrack.mixerGroup.color = "Blue";
var cmdTrack = target.addGroupTrack("Command");
cmdTrack.mixerGroup.color = "Purple";
var snapTrack = target.addGroupTrack("Snapshot");
snapTrack.mixerGroup.color = "Red";

// 3. Add Reverb return with correct color
var reverbReturn = target.addReturnTrack("Reverb");
reverbReturn.mixerReturn.color = refMR.color; // e.g. "Green Light 1"

// 4. Add effects with values from reference (skip MixerBusFader -- auto-created)
for (var i = 0; i < refEffectValues.length; i++) {
    var ref_eff = refEffectValues[i];
    if (ref_eff.entity === "MixerBusFader") continue;
    var newEff = reverbReturn.mixerReturn.effectChain.addEffect(ref_eff.entity);
    for (var key in ref_eff) {
        if (key === 'entity' || key === 'id' || key === 'isValid' || key.indexOf('_') === 0) continue;
        try { if (typeof ref_eff[key] === 'number' || typeof ref_eff[key] === 'boolean') newEff[key] = ref_eff[key]; } catch(e) {}
    }
}

// 5. Add MixerSend on Submix, targeting new reverb return, level 0 dB
var submixSend = submixTrack.mixerGroup.effectChain.addEffect("MixerSend");
submixSend.mixerReturn = reverbReturn.mixerReturn;
submixSend.level = 0; // 0 dB -- unity (default is -80 dB / muted)

// 6. Route existing audio tracks into Submix
for (var i = 0; i < target.groupTracks.length; i++) {
    var name = target.groupTracks[i].mixerGroup.name;
    if (name !== "Submix" && name !== "Command" && name !== "Snapshot") {
        target.groupTracks[i].mixerGroup.output = submixTrack.mixerGroup;
    }
}

studio.project.save();
```

---

### SCRIPT-P21: Project audit patterns (validated)
- **Tags:** audit, project-wide, validated

These scripts are validated against large projects.

#### Find events with compressor gain above 0 dB
```js
(function() {
  var events = studio.project.model.Event.findInstances();
  var results = [];
  events.forEach(function(ev) {
    [ev.masterTrack].concat(ev.groupTracks || []).forEach(function(track) {
      if (!track || !track.mixerGroup || !track.mixerGroup.effectChain) return;
      track.mixerGroup.effectChain.effects.forEach(function(effect) {
        if (effect.entity === 'CompressorEffect') {
          var mg = effect.makeupGain, og = effect.outputGain;
          if ((mg > 0) || (og > 0)) results.push({ event: ev.name, track: track.mixerGroup.name || '(master)' });
        }
      });
    });
  });
  return JSON.stringify({ count: results.length, events: results });
})()
```

#### Find empty events (no content, nothing routed in)
```js
(function() {
  var events = studio.project.model.Event.findInstances();
  var routeTargetIds = {};
  events.forEach(function(ev) {
    (ev.groupTracks || []).forEach(function(t) {
      try { if (t.mixerGroup && t.mixerGroup.output) routeTargetIds[t.mixerGroup.output.id] = true; } catch(e) {}
    });
  });
  var empty = [];
  events.forEach(function(ev) {
    var hasContent = false;
    [ev.masterTrack].concat(ev.groupTracks || []).concat(ev.returnTracks || []).forEach(function(track) {
      if (!track) return;
      try {
        (track.modules || []).forEach(function(mod) {
          if ((mod.sounds && mod.sounds.length > 0) || (mod.markers && mod.markers.length > 0)) hasContent = true;
        });
      } catch(e) {}
    });
    if (hasContent) return;
    var mg = ev.masterTrack ? ev.masterTrack.mixerGroup : null;
    if (!mg || !routeTargetIds[mg.id]) empty.push({ name: ev.name, path: ev.getPath() });
  });
  return JSON.stringify({ count: empty.length, events: empty });
})()
```

#### Find unused parameters (zero FMOD-internal references)

`GameParameter.name` is often blank -- use `param.presetOwner.name`. A parameter is "unused in FMOD" when ALL five relationship arrays are empty.

```js
(function() {
  var params = studio.project.model.GameParameter.findInstances();
  var unused = [];
  for (var i = 0; i < params.length; i++) {
    var p = params[i];
    if (!p.isValid) continue;
    var refs = (p.automationCurves ? p.automationCurves.length : 0)
             + (p.proxies ? p.proxies.length : 0)
             + (p.parameterConditions ? p.parameterConditions.length : 0)
             + (p.snapshotProperties ? p.snapshotProperties.length : 0)
             + (p.commandSounds ? p.commandSounds.length : 0);
    if (refs === 0) {
      unused.push({ name: p.presetOwner ? p.presetOwner.name : p.name, isGlobal: p.isGlobal });
    }
  }
  unused.sort(function(a,b) { return a.name < b.name ? -1 : 1; });
  return JSON.stringify({ total: params.length, unusedCount: unused.length, unused: unused });
})();
```

**Important:** Parameters with zero FMOD refs may still be driven from game code at runtime. Cross-reference against game scripts before deleting.

#### Find events without spatializer
```js
(function() {
  var events = studio.project.model.Event.findInstances();
  var spatTypes = ['SpatialiserEffect', 'ObjectSpatialiserEffect', 'ThreeDPannerEffect'];
  var results = [];
  events.forEach(function(ev) {
    var hasSpatializer = false;
    [ev.masterTrack].concat(ev.groupTracks || []).concat(ev.returnTracks || []).forEach(function(track) {
      if (!track) return;
      try {
        var mg = track.mixerGroup || track.mixerReturn;
        if (mg && mg.effectChain) mg.effectChain.effects.forEach(function(e) {
          if (spatTypes.indexOf(e.entity) >= 0) hasSpatializer = true;
        });
      } catch(e) {}
    });
    if (!hasSpatializer) results.push({ name: ev.name, path: ev.getPath() });
  });
  return JSON.stringify({ count: results.length, events: results });
})()
```

---

### SCRIPT-P22: Find looping events with unlimited instances
- **Tags:** looping, instance-limiting, audit

```js
var events = studio.project.model.Event.findInstances();
var results = [];
for (var i = 0; i < events.length; i++) {
    var ev = events[i];
    if (!ev.isValid) continue;
    if (!ev.isOneShot() && ev.automatableProperties.maxVoices === 65) {
        results.push(ev.getPath());
    }
}
return JSON.stringify({ count: results.length, events: results });
```

Alternatively, using file path set for larger projects:
```js
var loopFilePaths = {};
studio.project.model.LoopRegion.findInstances().forEach(function(lr) {
    if (lr.isValid) loopFilePaths[lr._filePath] = true;
});
studio.project.model.SingleSound.findInstances().forEach(function(ss) {
    if (ss.isValid && ss.looping) loopFilePaths[ss._filePath] = true;
});

var events = studio.project.model.Event.findInstances();
var unlimited = [];
for (var i = 0; i < events.length; i++) {
    var ev = events[i];
    if (!ev.isValid || !loopFilePaths[ev._filePath]) continue;
    if (ev.automatableProperties.maxVoices >= 65) {
        unlimited.push(ev.getPath());
    }
}
return JSON.stringify({ count: unlimited.length, events: unlimited.sort() });
```

---

### SCRIPT-P23: Find events containing a specific effect type (via XML grep)
- **Tags:** effects, audit, xml-grep, project-wide, preset

The scripting API cannot traverse from effect instances up to owning events (see SCRIPT-R32). Use XML grep on Metadata/Event/ instead. Works for any effect type: SpatialiserEffect, ThreeEQEffect, CompressorEffect, DistortionEffect, etc.

**Step 1: Find event XMLs containing the effect**
```bash
grep -rl "{EffectClassName}" "{FMOD_PROJECT}/Metadata/Event/" | wc -l
```

**Step 2: Classify preset vs non-preset (if needed)**

An effect is "non-preset" when its `<object class="{EffectClassName}">` block does NOT contain `<relationship name="preset">`. Parse per-object — do NOT search by proximity, as neighboring effects (especially ProxyEffect) commonly have preset refs. See SCRIPT-R31.

```python
import os, re

event_dir = '{FMOD_PROJECT}/Metadata/Event/'
effect_class = 'SpatialiserEffect'  # or ThreeEQEffect, CompressorEffect, etc.
non_preset_events = set()

for fname in os.listdir(event_dir):
    if not fname.endswith('.xml'):
        continue
    try:
        content = open(os.path.join(event_dir, fname), 'r', encoding='utf-8-sig').read()
    except:
        content = open(os.path.join(event_dir, fname), 'r', encoding='utf-16').read()
    if effect_class not in content:
        continue

    # Parse each effect's own object block — not by proximity
    for match in re.finditer(
        r'<object class="' + effect_class + r'" id="([^"]+)">(.*?)</object>',
        content, re.DOTALL
    ):
        effect_block = match.group(2)
        if 'name="preset"' not in effect_block:
            non_preset_events.add(fname.replace('.xml', ''))

print(f'{len(non_preset_events)} events with non-preset {effect_class}')
```

**Step 3: Resolve GUIDs to event paths and optionally color them**
```js
var guids = [/* GUIDs from step 2 */];
var results = [];
for (var i = 0; i < guids.length; i++) {
  var ev = studio.project.lookup(guids[i]);
  if (ev && ev.isValid) {
    results.push({ name: ev.name, path: ev.getPath() });
    ev.color = "Magenta";  // optional — set desired color
  }
}
studio.project.save();
return { colored: results.length, events: results };
```

---

## Where to look next

- Full API: `documentation/scripting-api-reference-project-model-*.md` (Event, Track, MixerStrip, MixerEffect).
- Rules for gotchas and mistakes: `docs/knowledge/scripting/rules.md`
- XML pipeline patterns: `docs/knowledge/xml-pipeline/rules.md`
- Verification workflow: `docs/knowledge/verification/rules.md`
