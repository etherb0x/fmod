# Domain: Scripting Rules

## Critical (Tier 0 -- always loaded)

### SCRIPT-R01: Never JSON.stringify FMOD objects
- **Severity:** crash
- **Tags:** scripting, serialization, tcp-console
- **Summary:** FMOD Studio objects contain circular references and deep internal graphs. `JSON.stringify(event.banks)`, `JSON.stringify(event.relationships)`, or `JSON.stringify(event.automatableProperties)` hangs the TCP scripting console indefinitely, blocking ALL TCP connections and requiring a full FMOD restart.
- **Correct:** Access only the specific scalar properties you need. Construct a plain object with those values, then `JSON.stringify` the plain object.
  ```js
  // WRONG -- will hang FMOD (has caused repeated hangs in a single session)
  return JSON.stringify(event.banks);
  return JSON.stringify(event.relationships);

  // RIGHT -- access specific scalar properties
  var bankName = ev.banks.length > 0 ? ev.banks[0].name : null;
  var busName = ev.mixerInput.output ? ev.mixerInput.output.name : null;
  return JSON.stringify({ bankName: bankName, busName: busName });
  ```

### SCRIPT-R02: Never _nullify() MixerBusFader on a track
- **Severity:** data-loss
- **Tags:** scripting, effect-chain, return-track, mixer
- **Summary:** The `MixerBusFader` is the structural anchor of any track (group or return). Nullifying it invalidates the entire ReturnTrack/MixerReturn -- the track disappears from the FMOD UI and becomes `isValid: false`. Rebuilding the track requires recreating it from scratch and re-wiring all routing.
- **Correct:** When reordering effects on a return or group track, skip the `MixerBusFader`:
  ```js
  var effects = chain.effects;
  for (var i = effects.length - 1; i >= 0; i--) {
      if (effects[i].entity !== "MixerBusFader") {
          effects[i]._nullify();
      }
  }
  // Then re-add non-fader effects in desired order.
  // If you truly need to move the fader, recreate the track with addReturnTrack()/addGroupTrack().
  ```
  After any script that creates or destroys tracks/effects, verify no `isValid: false` ghost objects remain:
  ```js
  for (var i = ev.returnTracks.length - 1; i >= 0; i--) {
      if (!ev.returnTracks[i].isValid) ev.returnTracks[i]._nullify();
  }
  studio.project.save();
  ```

### SCRIPT-R03: Use event.mixerInput.output for event bus routing (not masterBus.output)
- **Severity:** incorrect
- **Tags:** scripting, bus-routing, mixer
- **Summary:** `event.mixer.masterBus` is the event's INTERNAL master track -- the top of the event-internal mixer hierarchy. Its `.output` is always null. The project-level bus routing (which bus the event feeds in the project mixer) is on a different property entirely. `query_fmod` `event_details` also shows `masterTrack.output` as null, reinforcing the wrong conclusion.
- **Correct:**
  ```js
  var ev = studio.project.lookup("event:/My/Event");
  var bus = ev.mixerInput.output;
  console.log(bus.name);    // "Skill"
  console.log(bus.getPath()); // "bus:/Stereo Output/SFX/..."
  ```

### SCRIPT-R04: Keep scripts minimal and output small
- **Severity:** crash
- **Tags:** scripting, performance, tcp-console
- **Summary:** Large scripts with heavy console output, many routing changes, or complex operations in one call can crash or hang FMOD's scripting console. The console is single-threaded.
- **Correct:** Run small steps with minimal output. Return structured JSON with only the data needed. Never log large arrays with `console.log` -- use `return JSON.stringify(result)` with a compact result object.

### SCRIPT-R05: Use effect._nullify() to remove effects, not splice
- **Severity:** data-loss
- **Tags:** scripting, effect-chain
- **Summary:** `effects` array manipulation with `splice` appears to work in memory but FMOD re-serializes from its internal model on save. Spliced changes are silently lost. Duplicate effects appear if you re-add without nullifying first.
- **Correct:** Use `effect._nullify()` to remove. This persists on save. Reorder pattern: snapshot values → `_nullify()` effects → `addEffect()` in desired order → restore values → save.
  ```js
  // Add (no preset)
  chain.addEffect("ThreeEQEffect");
  chain.addEffect("MixerSend");

  // Remove (persists)
  effect._nullify();

  // Reorder: snapshot -> _nullify all (skip fader) -> addEffect in order -> restore -> save
  ```

### SCRIPT-R06: Always set bus routing after creating an event
- **Severity:** data-loss
- **Tags:** scripting, event-creation, bus-routing
- **Summary:** When creating events via `studio.project.create("Event")`, the default `mixerInput.output` is the project master bus (near "Stereo Output"/"Metering"). FMOD requires events to be routed to a proper game bus for bank builds. This error only surfaces when building banks.
- **Correct:** After creating any FMOD event, explicitly set its bus routing:
  ```js
  var ev = studio.project.create("Event");
  ev.folder = folder;
  ev.name = "MyEvent";
  // Always set routing -- default is master bus which blocks bank builds
  ev.mixerInput.output = studio.project.lookup("{TARGET_BUS_GUID}");
  studio.project.save();
  ```
  Check existing similar events to find the correct bus GUID for the event category.

### SCRIPT-R37: Use query_fmod search instead of execute_batch query for discovery
- **Severity:** incorrect
- **Tags:** tool-selection, discovery, context-overflow
- **Summary:** `execute_batch` with a broad `query` domain call returns the FULL JSON dump of every matching event (name, path, GUID). With 3,500+ events in the project, this easily produces 200K+ characters — exceeding MCP tool result size limits and overflowing LLM context windows. The output gets dumped to a temp file that requires bash/Python to read, breaking conversational workflows.
- **Correct:** Use `query_fmod` with action `search` for event discovery. It has `max_per_type` to cap output size and `types` to narrow scope:
  ```json
  { "action": "search", "query": "creature_LP", "types": ["events"], "max_per_type": 10 }
  ```
  Only use a full enumeration query when you genuinely need a complete list AND are writing results to a file for offline processing — never for conversational discovery.

## Important (Tier 1 -- loaded for domain agents)

### SCRIPT-R10: addEffect takes a type string, not a preset object
- **Severity:** incorrect
- **Tags:** scripting, effect-chain
- **Summary:** `chain.addEffect("ThreeEQEffect")` takes a type string to create a new non-preset effect. Passing a raw effect object causes "expects preset" error; only when passing an existing `EffectPreset` object does the non-string form work.
- **Correct:** Use type strings for non-preset effects: `addEffect("ThreeEQEffect")`, `addEffect("MixerSend")`, `addEffect("MixerBusFader")`. Only use the object form when you have an actual EffectPreset from `studio.project.lookup()`.

### SCRIPT-R11: EventMixerReturn is for return tracks, not group tracks
- **Severity:** incorrect
- **Tags:** scripting, return-track, mixer
- **Summary:** Return tracks (reverb sends, etc.) are created with `event.addReturnTrack("Name")` and accessed via `returnTracks[i].mixerReturn` (type: `EventMixerReturn`). They are NOT group tracks created with `addGroupTrack`. Checking `EventMixerReturn.findInstances()` finds return tracks.
- **Correct:**
  ```js
  var reverbReturn = event.addReturnTrack("Reverb");
  reverbReturn.mixerReturn.color = "Green Light 1"; // correct template color
  // Access: event.returnTracks[i].mixerReturn
  ```

### SCRIPT-R12: Stale and ghost objects after modifications
- **Severity:** incorrect
- **Tags:** scripting, verification, nullify, enumeration, folders
- **Summary:** Two related staleness problems:
  1. **After `_nullify()`:** Objects remain in `findInstances()` with `isValid: false`. Verification must filter by `isValid`, not count total instances. Ghost tracks in `returnTracks`/`groupTracks` trigger FMOD's "Issues Detected / Needs Validation" warning.
  2. **After XML editing + restart:** `findInstances()` may return stale `isValid: false` objects for recently created/modified entities. Path-based `studio.project.lookup()` can also fail (see XML-R03).
- **Correct:** After `_nullify()`, always filter `isValid` in verification and clean ghosts before saving:
  ```js
  var valid = findInstances().filter(function(o) { return o.isValid; });
  ```
  After XML editing + restart, prefer walking the folder tree over `findInstances()`:
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

### SCRIPT-R13: Instance limiting and loop detection
- **Severity:** incorrect
- **Tags:** scripting, instance-limiting, looping, enumeration
- **Summary:** Two commonly misused APIs:
  - **Instance limiting:** There is no `event.maxInstances`. The property is `event.automatableProperties.maxVoices`. The unlimited/default value is **65** (not 0, not -1 — FMOD shows ∞ in the GUI but stores 65). When creating events, default to 5 unless unlimited is genuinely required.
  - **Loop detection:** Don't manually traverse `LoopRegion.findInstances()` + parent walk (fragile, different property chains per type). Use `event.isOneShot()` — it handles all cases internally.
- **Correct:** See SCRIPT-P13 (instance limiting patterns) and SCRIPT-P22 (looping event detection) for code examples.

### SCRIPT-R15: Misleading property names — wrong name silently returns wrong data
- **Severity:** incorrect
- **Tags:** scripting, snapshot, parameters, property-names
- **Summary:** Several FMOD properties have intuitive names that return the wrong thing:

  | Object | Wrong property | Correct property |
  |--------|---------------|-----------------|
  | `SnapshotModule` | `.snapshot` (returns `undefined`) | `.event` (returns the snapshot) |
  | `GameParameter` | `.name` (often blank) | `.presetOwner.name` |
  | Any effect | `.constructor.name` (returns `"Object"`) | `.entity` (returns e.g. `"ThreeEQEffect"`) |
  | `MixerGroup` / `MixerReturn` | `.guid` (often `undefined`) | `.id` (reliable identity) |

  No errors are raised — you get `undefined`, blank strings, or `"Object"` and silently build wrong results.
- **Correct:** Use the correct column above. For identity comparisons on mixer objects, always use `.id` not `.guid`.

### SCRIPT-R17: No event.duplicate() API -- reconstruct manually
- **Severity:** incorrect
- **Tags:** scripting, event-creation
- **Summary:** The "Duplicate" in the FMOD Studio UI is an application-level copy & paste, not exposed to the scripting API. There is no `event.duplicate()` or equivalent. Duplication via script requires manually reconstructing every property.
- **Correct:** Use `studio.project.create("Event")` and manually reconstruct tracks, effects, routing, parameters, etc. Or use Programmer Instruments when many events differ only by audio file.

### SCRIPT-R18: Replicate reference events by reading ALL properties first
- **Severity:** incorrect
- **Tags:** scripting, mixer, replication
- **Summary:** When copying a mixer setup from a reference event, copying only the structure (which tracks/effects to add) without reading property values results in wrong colors, default effect values, muted sends, and unconnected routing. Every property must be read before applying.
- **Correct:** Step 1: query the reference event, extracting every property -- colors, all effect parameter values, send targets (`.mixerReturn`), send levels. Step 2: apply those exact values. Step 3: verify by reading back and comparing.
  ```js
  // MixerSend defaults to -80 dB (muted) -- always set .level = 0 for unity sends
  submixSend.level = 0;
  // MixerSend.mixerReturn must be explicitly set -- defaults to null/unconnected
  submixSend.mixerReturn = reverbReturn.mixerReturn;
  ```

### SCRIPT-R19: Live Update connection cannot be automated via scripting API
- **Severity:** incorrect
- **Tags:** scripting, live-update, pipeline
- **Summary:** `studio.window.triggerAction(31)` (Connect to Game) opens a modal dialog that blocks ALL TCP connections. Multiple automation approaches fail (dialog handler only intercepts JS dialogs, not native C++ modals; button state change is visual only). Disconnecting works (no dialog), connecting does not.
- **Correct:** Use `manage_profiler(action: "connect_to_game", enabled: true)` which opens the dialog and waits for the user to click Connect manually. Disconnecting: call `triggerAction(31)` when already connected -- executes instantly.

### SCRIPT-R21: Batch event creation in single execute_batch tcp.execute_script call
- **Severity:** performance
- **Tags:** scripting, performance, batch
- **Summary:** Creating events one at a time via multiple `execute_batch` `tcp.execute_script` calls adds significant overhead (TCP round-trip per call, multiple FMOD save operations). Batch all creation logic into a single call.
- **Correct:** Build the entire creation loop in one script, return a summary JSON result.

### SCRIPT-R22: Event and folder creation uses tcp.execute_script
- **Severity:** incorrect
- **Tags:** scripting, folders, event-creation
- **Summary:** There is no `events.create` command in the daemon. Event and folder creation is done via `execute_batch` `tcp.execute_script`. The `events` domain only has `validate_schema`, `build_script`, and `run_pipeline` (which handles the full creation pipeline internally). Also check for existing folders before creating -- duplicates are silently created.
- **Correct:**
  ```js
  // Check first, then create
  var existing = studio.project.lookup("event:/MyFolder");
  if (!existing) {
      var folder = studio.project.create("EventFolder");
      folder.folder = studio.project.workspace.masterEventFolder;
      folder.name = "MyFolder";
      studio.project.save();
  }
  ```

### SCRIPT-R23: Retry execute_batch cache.load and first TCP call after restart
- **Severity:** incorrect
- **Tags:** scripting, tcp, entity-cache
- **Summary:** The first `execute_batch` `cache.load` call after an FMOD restart often times out. The first TCP call of any kind after restart may also timeout. Both are transient -- retry once before treating as an error.
- **Correct:** If `execute_batch` `cache.load` or any first TCP call returns a timeout/connection error immediately after restart, wait 2-3 seconds and retry once. If the retry also fails, then escalate.

### SCRIPT-R24: LoopRegion needs FOUR properties set to function
- **Severity:** incorrect
- **Tags:** scripting, looping, loop-region
- **Summary:** Creating a LoopRegion requires setting all four properties: `position`, `length`, `markerTrack`, and `timeline`. Missing `timeline` causes `isOneShot()` to silently remain true. Missing `length` creates a zero-duration loop. No error is raised for either omission.
- **Correct:**
  ```js
  var lr = studio.project.create("LoopRegion");
  lr.position = 0;
  lr.length = 2.0;                    // REQUIRED -- zero-duration loop without this
  lr.markerTrack = ev.markerTracks[0];
  lr.timeline = ev.timeline;           // REQUIRED -- isOneShot() stays true without this
  // Verify:
  // ev.isOneShot() === false
  ```
  Events with `_LP` suffix MUST have a LoopRegion — this is the project convention for looping sounds. Automated event creation should check for the suffix and add a LoopRegion automatically.

### SCRIPT-R27: query_fmod event_details requires fully qualified path or GUID
- **Severity:** incorrect
- **Tags:** scripting, entity-resolution, tool-gotcha
- **Summary:** `studio.project.lookup()` only accepts exact event paths (`event:/...`) or GUIDs (`{...}`). A bare name like `"Footstep"` returns null -- no fuzzy matching. `query_fmod` `event_details` inherits this limitation.
- **Correct:** Always pass a fully qualified path or GUID. If only a name fragment is available, call `query_fmod` with action `search` first to resolve it, then pass the resolved path.

### SCRIPT-R28: User language must be translated to FMOD data model terms
- **Severity:** incorrect
- **Tags:** scripting, terminology
- **Summary:** User language doesn't map 1:1 to FMOD data model. See SCRIPT-P15 in `patterns.md` for the full intent→pattern mapping table. Key non-obvious translations: "loops" = `!event.isOneShot()` (not just LoopRegion); "no limit" = `maxVoices === 65` (GUI shows ∞); "return" = `EventMixerReturn` via `addReturnTrack` (not group track); "effect preset" = `ProxyEffect` with `<relationship name="preset">`.
- **Correct:** Translate user intent before writing queries. Consult SCRIPT-P15 for the mapping.

### SCRIPT-R31: "Preset" vs "non-preset" effects in FMOD's object model
- **Severity:** incorrect
- **Tags:** scripting, preset, terminology, xml, effect-chain
- **Summary:** In FMOD, ANY effect on a track can be either preset-based or non-preset (inline/custom). The mechanism is the same regardless of effect type:
  - **Non-preset (inline):** The effect object in XML has its properties defined directly (e.g., `<property name="minimumDistance"><value>30</value></property>`). No `<relationship name="preset">` exists on the object.
  - **Preset-based:** The effect object has a `<relationship name="preset"><destination>{GUID}</destination></relationship>` pointing to a shared preset definition. The preset's settings override the inline values.
  - **ProxyEffect:** A special effect type that ALWAYS has a preset relationship — it exists solely to instantiate a shared effect chain preset (e.g., "EQ Based on Player ID"). ProxyEffects are separate objects from neighboring effects on the same chain.

  When a user asks about "non-preset" effects, they mean effects without `<relationship name="preset">` — effects with hand-tuned inline properties.

  Critical mistake: searching XML for `name="preset"` by proximity (e.g., within N characters of an effect) and matching a NEIGHBORING effect's preset reference. Effects on the same chain sit adjacent in XML. Always parse per-object — check for `<relationship name="preset">` within the specific `<object>...</object>` block.
- **Correct:**
  - "Non-preset effect" = an `<object class="{EffectType}">` block that does NOT contain `<relationship name="preset">`
  - "Preset effect" = an `<object class="{EffectType}">` block that DOES contain `<relationship name="preset">`
  - A ProxyEffect's preset is a separate object from other effect objects next to it — they are independent effects on the same chain
  - When classifying effects by preset status, parse per-object blocks in XML — never search by character proximity

### SCRIPT-R32: Scripting API cannot traverse from effects up to owning events
- **Severity:** incorrect
- **Tags:** scripting, effect-chain, traversal, xml
- **Summary:** `findInstances()` on any effect type (SpatialiserEffect, ThreeEQEffect, CompressorEffect, etc.) returns effect objects whose `.owner` chain terminates at `EffectChain` or `MixerBusEffectChain` — it does NOT continue up to MixerGroup → Track → Event. The scripting API provides no reliable path from an effect instance back to its owning event.
  - `EffectChain` (group tracks) → `.owner` is null/invalid
  - `MixerBusEffectChain` (master tracks) → `.owner` is null/invalid
  - `.document`, `.mixer`, `.mixerGroup`, `.event`, `.track` — all null/undefined on effect chain objects
- **Correct:** To find which events contain a specific effect type, grep the event XML files on disk:
  ```bash
  grep -rl "EffectClassName" "{FMOD_PROJECT}/Metadata/Event/"
  ```
  Then resolve the file GUIDs (filename minus `.xml`) to event paths via `studio.project.lookup("{GUID}")`.

  Do NOT use `findInstances()` + owner traversal for this purpose — it will silently return zero results.

### SCRIPT-R33: Query bank assignments via relationships.banks.destinations
- **Severity:** incorrect
- **Tags:** scripting, banks, enumeration
- **Summary:** There is no `event.bank` or `event.banks` property that returns assigned banks directly. Bank assignments are accessed through the relationships API: `event.relationships.banks.destinations` returns an array of Bank objects.
- **Correct:**
  ```js
  var ev = studio.project.lookup("event:/My/Event");
  var banks = ev.relationships.banks.destinations;
  for (var i = 0; i < banks.length; i++) {
      var b = banks[i];
      console.log(b.name + " " + b.getPath());
  }
  ```
  To assign a bank: `ev.relationships.banks.add(bank)` where `bank` is a Bank object from `studio.project.model.Bank.findInstances()`.

### SCRIPT-R34: ProxyEffect wraps preset-based effects -- traverse .preset.effect to find the real effect
- **Severity:** incorrect
- **Tags:** scripting, effect-chain, preset, traversal
- **Summary:** Effects on an effect chain can be either direct instances (e.g., `ThreeEQEffect`, `SpatialiserEffect`) or wrapped in a `ProxyEffect` that loads a shared preset. A `ProxyEffect`'s actual effect is at `.preset.effect` (an `EffectChain` with its own `.effects` array). Any enumeration or audit that only checks top-level `chain.effects[i].entity` will miss preset-wrapped effects entirely.
- **Correct:**
  ```js
  function walkEffectChain(chain, callback, isPreset) {
      if (!chain || !chain.effects) return;
      for (var i = 0; i < chain.effects.length; i++) {
          var e = chain.effects[i];
          if (!e || !e.isValid) continue;
          if (e.entity === "ProxyEffect" && e.preset && e.preset.effect)
              walkEffectChain(e.preset.effect, callback, true);
          else
              callback(e, isPreset);
      }
  }
  // Usage: walkEffectChain(mixerGroup.effectChain, function(effect, fromPreset) {
  //     console.log(effect.entity + (fromPreset ? " (preset)" : " (inline)"));
  // }, false);
  ```

### SCRIPT-R29: FMOD-only usage check is insufficient before deletion
- **Severity:** data-loss
- **Tags:** scripting, parameters, deletion
- **Summary:** Parameters/snapshots with zero FMOD-internal refs may still be driven from game code at runtime. Deleting based on FMOD refs alone can break live game behavior silently.
- **Correct:** Before deleting any objects with zero FMOD-internal refs, cross-reference against game scripts. Remind users of this requirement and help them do so if possible.

### SCRIPT-R38: TCP scripts require explicit `return` — bare expressions produce empty data
- **Severity:** incorrect
- **Tags:** scripting, tcp-console, return-value, execute_batch
- **Summary:** `execute_batch` `tcp.execute_script` wraps user scripts in an outer IIFE via `fmod_tcp.wrap_script()`: `var __mcpResult = (function() { {script} })();`. The wrapper only captures a value if the script contains an explicit `return` statement at the top level. Bare expressions (`'hello world'`), self-invoking IIFEs (`(function() { return x; })();`), and variable assignments all produce `undefined` in the wrapper — the step succeeds with `data: ""` and no error. Side effects (event creation, saves) still execute, making it appear the script "worked" while silently discarding the return value. This leads to unnecessary diagnostic round-trips trying to figure out why data is empty.
- **Correct:** Always use an explicit `return` at the script's top level:
  ```js
  // WRONG — bare IIFE, return is consumed by inner scope
  (function() {
    var results = [];
    // ... build results ...
    return JSON.stringify(results);
  })();

  // WRONG — bare expression, not a return statement
  'hello world'

  // RIGHT — explicit return at top level of the wrapper IIFE
  var results = [];
  // ... build results ...
  return JSON.stringify(results);

  // ALSO RIGHT — return the inner IIFE's value explicitly
  return (function() {
    var results = [];
    // ... build results ...
    return JSON.stringify(results);
  })();
  ```
  Note: all patterns in `docs/knowledge/scripting/patterns.md` already use `return` correctly (e.g., SCRIPT-P04, SCRIPT-P21), but the reason — the wrapper IIFE mechanism — was not documented.
- Source: Live debugging session (2026-03-21) — 5 successive empty `data: ""` returns from valid scripts, all caused by missing top-level `return`

## Reference (Tier 2 -- loaded on demand)

### SCRIPT-R35: Unreferenced parameter detection requires checking 5 relationship types
- **Severity:** incorrect
- **Tags:** scripting, parameters, enumeration
- **Summary:** A `GameParameter` can be referenced from five different relationship types: `automationCurves`, `proxies`, `parameterConditions`, `snapshotProperties`, and `commandSounds`. Checking only automators or automation curves misses parameters used solely in snapshot property overrides, command sounds, or proxy parameters. All five must be zero for a parameter to be truly unreferenced within FMOD.
- **Correct:**
  ```js
  var totalRefs = (p.automationCurves ? p.automationCurves.length : 0)
      + (p.proxies ? p.proxies.length : 0)
      + (p.parameterConditions ? p.parameterConditions.length : 0)
      + (p.snapshotProperties ? p.snapshotProperties.length : 0)
      + (p.commandSounds ? p.commandSounds.length : 0);
  ```
  Even with zero FMOD-internal references, parameters may still be driven from game code at runtime (see SCRIPT-R29).

### SCRIPT-R36: Unused EffectPresets can only be found via ProxyEffect back-references
- **Severity:** incorrect
- **Tags:** scripting, effect-preset, enumeration
- **Summary:** `EffectPreset` objects have no built-in "references" or "usages" property. The only consumer of EffectPresets is `ProxyEffect` (via `.preset`). To find unused presets, scan all `ProxyEffect.findInstances()` and build a set of referenced preset IDs, then check which `EffectPreset` instances are missing from that set.
- **Correct:**
  ```js
  var proxies = studio.project.model.ProxyEffect.findInstances();
  var usedIds = {};
  for (var i = 0; i < proxies.length; i++) {
      if (proxies[i].isValid && proxies[i].preset)
          usedIds[proxies[i].preset.id] = true;
  }
  var presets = studio.project.model.EffectPreset.findInstances();
  var unused = presets.filter(function(p) {
      return p.isValid && !usedIds[p.id];
  });
  ```

### SCRIPT-R30: LoopRegion creation can crash if done in unstable session
- **Severity:** crash
- **Tags:** scripting, loop-region, crash
- **Summary:** `studio.project.create("LoopRegion")` called without all three required relationships (position, markerTrack, timeline) can crash FMOD Studio entirely. Always set all relationships immediately after creation.
- **Correct:** See SCRIPT-R24 for the complete safe creation sequence. If investigating FMOD data model structures that might crash the editor, read the project XML files on disk instead of executing scripts.
