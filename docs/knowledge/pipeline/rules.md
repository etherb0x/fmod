# Domain: Pipeline Rules

## Critical (Tier 0 -- always loaded)

### PIPE-R01: Create events and folders in a single tcp.execute_script call
- **Severity:** incorrect
- **Tags:** pipeline, event-creation, folders, tool-gotcha
- **Summary:** There is no `events.create` command in the daemon. Event and folder creation is done via `execute_batch` `tcp.execute_script`. When creating both a folder and events in it, do so in a single script call — `studio.project.lookup()` resolves freshly created folders within the same script session. The `events` domain provides `run_pipeline` for full creation workflows (schema → script → execute → bank → build).
- **Correct:** Use `execute_batch` `tcp.execute_script` to create both the folder and the events in one script. See SCRIPT-R22 for the folder creation pattern, SCRIPT-R06 for bus routing, and SCRIPT-R21 for batching.
- Source: Dry-run learning 14 (2026-03-18 pipeline dry run)

### PIPE-R02: Always target FMOD Studio.exe (with space), not fmodstudio.exe
- **Severity:** incorrect
- **Tags:** pipeline, executable, launch
- **Summary:** The FMOD install folder contains TWO executables: `FMOD Studio.exe` (with space, GUI editor with scripting console) and `fmodstudio.exe` (no space, CLI build tool). The CLI tool prints usage help and exits immediately -- no GUI, no scripting console.
- **Correct:** Always target `FMOD Studio.exe` for the interactive editor. `fmodstudio.exe` is only for headless bank builds.
- Source: LEARNINGS.md section 2 (Launched wrong executable row) (legacy, deleted)

## Important (Tier 1 -- loaded for domain agents)

### PIPE-R10: Bank assignment works where query_fmod event_details fails
- **Severity:** incorrect
- **Tags:** pipeline, bank-assignment, tool-gotcha
- **Summary:** `execute_batch` `events.assign_bank` uses TCP scripting directly without the `isValid` filter that `query_fmod` `event_details` uses. This means `assign_bank` successfully targets events that `query_fmod event_details` reports as missing immediately after XML editing + restart, because `studio.project.lookup()` with a GUID resolves reliably post-edit (XML-R03).
- **Correct:** After XML pipeline operations, use `execute_batch` `events.assign_bank`:
  ```json
  {"domain": "events", "command": "assign_bank", "params": {"event_paths": ["event:/My/Event"], "bank_path": "bank:/MyBank"}}
  ```
  Accepts `event_path` (single) or `event_paths` (batch). Use GUIDs for post-XML-edit reliability.
- Source: Dry-run learning 16 (2026-03-18 pipeline dry run)

### PIPE-R11: Bank build may timeout on large projects (300s default)
- **Severity:** performance
- **Tags:** pipeline, bank-build, timeout
- **Summary:** `execute_batch` `process.build_banks` has a default timeout of 300s. Large FMOD projects may exceed this during a full project build. The CLI bank builder may also rebuild the full project regardless of the bank filter specified.
- **Correct:** For large projects, increase `timeout_ms` appropriately. If building a subset of banks, verify the build actually only built the specified banks -- the CLI tool may rebuild all banks regardless of the filter.
- Source: Dry-run learnings 17 and 20 (2026-03-18 pipeline dry run)

### PIPE-R12: Live Update scripting limitation
- **Severity:** incorrect
- **Tags:** pipeline, live-update, scripting
- **Summary:** Connecting FMOD Studio to the game via Live Update cannot be automated through the scripting API. `triggerAction(31)` opens a modal dialog that blocks ALL TCP connections. See SCRIPT-R19 for the complete failure mode list.
- **Correct:** Use `manage_profiler(action: "connect_to_game", enabled: true)` which waits for user to click Connect. Scripting API workarounds all fail.
- Source: LEARNINGS.md section 14 (legacy, deleted)

### PIPE-R13: Animation .fla paths follow a project-specific convention
- **Severity:** cosmetic
- **Tags:** pipeline, animation, project-specific
- **Summary:** Animation .fla files in this project follow the path pattern: `contentsrc/anim/{category}/bank/{entity}_bank.fla`. This is project-specific, not a general FMOD convention.
- **Correct:** When referencing animation files, use the `contentsrc/anim/{category}/bank/{entity}_bank.fla` pattern.
- Source: Dry-run learning 18 (2026-03-18 pipeline dry run)

## Reference (Tier 2 -- loaded on demand)

_No Tier 2 rules yet._
