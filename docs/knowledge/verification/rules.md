# Domain: Verification Rules

## Critical (Tier 0 -- always loaded)

### VERIFY-R01: Verify first event, confirm with user, then bulk apply
- **Severity:** incorrect
- **Tags:** verification, bulk-operations, workflow
- **Summary:** When a task modifies event structure (routing, effects, returns, chain order) across multiple events, applying to all events without verification risks propagating a bad pattern to many events. Manual verification of mixer chains is difficult to undo at scale. The verify-first-then-confirm workflow catches errors before they compound.
- **Correct:** Mandatory workflow for bulk event-modifying operations:
  1. **First event only** -- Apply the full pattern to one event (first in list or user-specified).
  2. **Verify** -- Run a script that confirms: chain order (indices and entity types), effect values (lowGain, level, mixerReturn), routing (track outputs, sends), no duplicates or orphaned effects.
  3. **Confirm with user** -- Report the verified state in a clear table; ask: "Does this look correct before I apply to the remaining N events?"
  4. **Then continue** -- If user confirms, apply to remaining events.
  Explicitly pause after step 2 and present the verification result before proceeding.
- Source: LEARNINGS.md section 3 (legacy, deleted)

### VERIFY-R02: Filter by isValid when verifying _nullify() results
- **Severity:** incorrect
- **Tags:** verification, nullify, isValid
- **Summary:** After `_nullify()`, objects remain in `findInstances()` with `isValid: false` until the project is reloaded. Counting total instances (not filtering by isValid) will make deletions appear to have failed when they actually succeeded.
- **Correct:** Always filter by `isValid` in verification scripts:
  ```js
  var valid = studio.project.model.ParameterPreset.findInstances()
      .filter(function(p) { return p.isValid; });
  return JSON.stringify({ validCount: valid.length });
  // Do NOT use: findInstances().length -- includes ghost objects
  ```
- Source: LEARNINGS.md section 2 (_nullify() ghost objects row), PATTERNS.md (Deletion and verification) (legacy, deleted)

## Important (Tier 1 -- loaded for domain agents)

### VERIFY-R10: Check for isValid: false ghost objects after structural changes
- **Severity:** incorrect
- **Tags:** verification, ghost-objects, tracks
- **Summary:** Ghost `isValid: false` objects in `returnTracks`/`groupTracks` arrays trigger FMOD Studio's "Issues Detected / Needs Validation" warning and serialize into XML. The event appears broken in the UI even if functionally working.
- **Correct:** After any script that creates or destroys tracks/effects, check for and clean ghost objects before saving:
  ```js
  // Clean ghost return tracks
  for (var i = ev.returnTracks.length - 1; i >= 0; i--) {
      if (!ev.returnTracks[i].isValid) ev.returnTracks[i]._nullify();
  }
  // Clean ghost group tracks
  for (var i = ev.groupTracks.length - 1; i >= 0; i--) {
      if (!ev.groupTracks[i].isValid) ev.groupTracks[i]._nullify();
  }
  studio.project.save();
  ```
- Source: LEARNINGS.md section 6, MISTAKES.jsonl record 4 (2026-02-26) (legacy, deleted)

### VERIFY-R11: query_fmod event_details isValid filter may hide post-XML-edit events
- **Severity:** incorrect
- **Tags:** verification, tool-gotcha, xml-pipeline
- **Summary:** `query_fmod` `event_details` internally filters on `isValid` (via `fmod_query.py`). After XML editing + restart, this filter may incorrectly exclude recently modified events, making them appear missing. Direct TCP `studio.project.lookup()` with a GUID does not have this limitation.
- **Correct:** After XML pipeline operations, use `execute_batch` `tcp.execute_script` with direct `studio.project.lookup()` to verify event existence rather than `query_fmod event_details`. If `query_fmod event_details` reports "not found" post-XML-edit, try the direct lookup before concluding the event is missing.
- Source: Dry-run learning 15 (2026-03-18 pipeline dry run)

## Reference (Tier 2 -- loaded on demand)

_No Tier 2 rules yet._
