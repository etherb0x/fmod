# Domain: Profiler Rules

## Critical (Tier 0 -- always loaded)

### PROF-R01: set3DAttributes noise is filtered by default
- **Severity:** incorrect
- **Tags:** profiler, positioning, noise-filtering
- **Summary:** The profiler captures `set3DAttributes` API calls (3D spatial positioning updates) which are extremely high-frequency in games -- every moving object emits them continuously. Including them in time_range queries produces massive noise that buries actual audio-relevant commands. The `POSITIONING_NOISE` denylist is applied by default.
- **Correct:** The `time_range` action in `query_profiler_session` applies the `POSITIONING_NOISE` denylist by default. To include 3D positioning data (for spatial debugging), opt in explicitly with `include_positioning: true`. Do not disable noise filtering without a specific diagnostic reason.
- Source: Phase 33 decision (2026-03-17), STATE.md decisions section

### PROF-R02: Write session artifacts into the FMOD profiler session directory
- **Severity:** incorrect
- **Tags:** profiler, session-storage, artifacts
- **Summary:** Annotation artifacts (annotations.json, guid-map.json) must be co-located with FMOD profiler session data in `Metadata/ProfilerSession/{guid}/`. Writing them to a separate top-level directory (e.g., `Profiler/<sessionName>/`) makes co-location impossible and breaks the assumption that annotations belong with their session.
- **Correct:** Resolve the guid-based directory at session start via the GUID resolver, then write all artifacts to `Metadata/ProfilerSession/{guid}/`.
- Source: MISTAKES.jsonl record 15 (2026-03-09) (legacy, deleted)

## Important (Tier 1 -- loaded for domain agents)

### PROF-R10: Exclude correlated_context from annotations.json
- **Severity:** performance
- **Tags:** profiler, session-storage, artifacts
- **Summary:** The `correlated_context` field contains the entire correlated evidence package. Persisting it into every annotation entry inflates annotations.json to 55MB+ for a single session. The subset of data to retain has not been finalized.
- **Correct:** Exclude `correlated_context` from annotations.json entirely until the retention schema is decided. Use a summary or index reference if needed.
- Source: MISTAKES.jsonl record 16 (2026-03-09) (legacy, deleted)

### PROF-R11: Verify transcription completion before reading annotations
- **Severity:** incorrect
- **Tags:** profiler, transcription, race-condition
- **Summary:** Real playtest sessions have produced annotation entries with no `words` arrays. Transcription may not resolve before `readAnnotations()` is called at session close. This is a known race condition in the stop flow.
- **Correct:** The stop flow must confirm transcription resolves before `readAnnotations()` is called. Surface transcription errors explicitly rather than swallowing them. Verify `words` arrays are non-empty after stop; treat empty arrays as a warning requiring investigation.
- Source: MISTAKES.jsonl record 17 (2026-03-09) (legacy, deleted)

### PROF-R12: Profiler recording requires two-step stop + save to flush capture data
- **Severity:** incorrect
- **Tags:** profiler, recording, scripting, lifecycle
- **Summary:** Stopping a profiler recording session requires a non-obvious two-step sequence. `toggleRecording()` stops recording but leaves playback running (`isPlaying` remains `true`). A separate `stopImmediate()` call is needed to fully stop playback. Finally, `studio.project.save()` is required to flush capture data files to disk. Missing any step results in incomplete or missing capture data. Additionally, the session must be navigated to (`studio.window.navigateTo(session)`) before `toggleRecording()` will start recording.
- **Correct:**
  ```js
  // Start recording (must navigate first)
  studio.window.navigateTo(session);
  session.toggleRecording(); // starts recording

  // ... capture period ...

  // Stop recording (two steps + save)
  session.toggleRecording(); // stops recording, but isPlaying stays true
  session.stopImmediate();   // stops playback
  studio.project.save();     // flushes capture files to disk
  ```
- Source: Promoted from auto-patterns [PAT-20260227-006, PAT-20260227-007, PAT-20260227-009]

## Reference (Tier 2 -- loaded on demand)

_No Tier 2 rules yet._
