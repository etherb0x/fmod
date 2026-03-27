# Domain: XML Pipeline Rules

## Critical (Tier 0 -- always loaded)

### XML-R01: apply_template sequence is strictly ordered
- **Severity:** incorrect
- **Tags:** xml-pipeline, apply_template, sequence
- **Summary:** The `apply_template` operation has a specific required sequence. Skipping steps or reordering them causes silent failures, missing routing, or validation errors. The sequence: create events → save → refresh entity cache → batch patch with skip_restart → single restart → bank assign → build.
- **Correct:** Complete sequence for apply_template batch:
  1. Create target events via `execute_batch` `tcp.execute_script` (batch, one call)
  2. Save via `execute_batch` `tcp.execute_script` (`studio.project.save()`)
  3. `execute_batch` `cache.load` (retry once if it times out)
  4. For each event: `execute_batch` `xml.execute_patch` with `operation: "apply_template"` + `skip_restart: true` (all except the last)
  5. Final `execute_batch` `xml.execute_patch` without `skip_restart` (triggers the single restart + validation)
  6. `execute_batch` `events.assign_bank` for each event (accepts `event_path` or `event_paths` + `bank_path`)
  7. `execute_batch` `process.build_banks`
- Source: Dry-run learning 8 (2026-03-18 pipeline dry run)

### XML-R02: LoopRegion DOES transfer via apply_template (fixed)
- **Severity:** informational (was data-loss, fixed 2026-03-18)
- **Tags:** xml-pipeline, apply_template, loop-region
- **Summary:** LoopRegion, TempoMarker, NamedMarker, and SustainPoint all transfer correctly via `apply_template` as of commit `ca877d9` (fix/260318-gf8). The `cloneRoutingStructure` function includes these in `CLONEABLE_CLASSES` and explicitly wires Timeline marker relationships. No separate patch step is needed.
- **Previous limitation:** Before the fix, LoopRegion did not transfer, making cloned loop events silently one-shot. This is no longer the case.
- Source: Dry-run learning 10 (2026-03-18 pipeline dry run), fix commit ca877d9

### XML-R15: Always use property-mappings.md for effect property names
- **Severity:** data-loss
- **Tags:** xml-pipeline, property-names, effects, mapping
- **Summary:** FMOD XML properties are camelCase and do NOT match GUI labels. Wrong property names (e.g., `LowGain` instead of `lowGain`, `HighFreq` instead of `highCrossover`) are silently accepted by the XML pipeline but ignored by FMOD on load, producing zero-value effects with no error.
- **Correct:** Before writing any effect property via `execute_batch` `xml.execute_patch`, look up the exact property name in `docs/knowledge/xml-pipeline/property-mappings.md`. Never derive property names from FMOD Studio GUI labels. Exception: `HFDecayRatio` and `HFReference` on SFXReverbEffect are PascalCase (the only exceptions to camelCase).
- Source: A/B experiment (2026-03-19) — LowGain/HighFreq/Threshold silent failures

### XML-R03: isValid is unreliable after XML edit + restart — use GUID lookup
- **Severity:** incorrect
- **Tags:** xml-pipeline, validation, isValid, verification
- **Summary:** After XML editing + FMOD restart, path-based lookups (`studio.project.lookup("event:/...")`) and `query_fmod event_details` with event paths can return "not found" for recently modified entities. The path→object resolution goes stale after restart, but GUID→object resolution remains reliable.
- **Correct:** After XML edits, always verify using the event's **GUID** (from entity cache or `query_fmod` `search`), not the event path:
  ```
  query_fmod({ action: "event_details", event_path: "{58fb4aae-bf32-447d-912d-72db18c476a8}" })  ← works
  query_fmod({ action: "event_details", event_path: "event:/Music/mus_Town_Old_LP" })            ← fails after XML edit
  ```
  Capture GUIDs during the discovery/search phase and use them for all post-edit verification. `query_fmod` `search` returns GUIDs in the `guid` field of each result.
- Source: Dry-run learning 1 and 15 (2026-03-18), A/B experiment (2026-03-19) — 3/3 path lookups failed, 3/3 GUID lookups succeeded on same events

### XML-R16: Python XML cloner supersedes TypeScript for template cloning
- **Severity:** informational
- **Tags:** xml-pipeline, apply_template, python, migration
- **Summary:** `scripts/fmod_xml.py` is now the authoritative template cloning implementation. It handles more object types than `src/xml/xml-clone.ts` (sound modules, action sheets, parameter pages, command self-references, Timeline.modules patching). The `execute_batch` `xml.execute_patch` `apply_template` operation still works but has gaps: missing Timeline.modules patching, smaller CLONEABLE_CLASSES set, no self-reference remapping for CommandSound/EventSound pointing to parent Event.
- **Correct:** For new event creation pipelines, use `scripts/create_fmod_events.py` which calls `fmod_xml.clone_routing_structure` directly. For existing Foxtail dispatch agents that use `execute_batch` `xml.execute_patch` `apply_template`, the TypeScript path still works for simple templates but may drop complex content (scatterers, command instruments, snapshots with Timeline.modules refs). Migration path: route XML executor agents through Python when Foxtail generalizes.
- Source: Live testing 2026-03-19 — Python cloner handled all novel FMOD XML types that TypeScript missed

## Important (Tier 1 -- loaded for domain agents)

### XML-R10: MixerInput and EventAutomatableProperties are cloneable (fixed)
- **Severity:** incorrect
- **Tags:** xml-pipeline, apply_template, cloning
- **Summary:** MixerInput and EventAutomatableProperties were not in CLONEABLE_CLASSES in the earlier codebase, causing them to not transfer during `apply_template`. This was fixed in quick task 260318-fnx. These classes now clone correctly.
- **Correct:** Expect MixerInput (bus routing) and EventAutomatableProperties (instance limits, voice stealing) to transfer correctly via apply_template. If they don't, verify the fix is deployed (commit f53750d).
- Source: Dry-run learning 9 (2026-03-18 pipeline dry run), Quick task 260318-fnx

### XML-R11: outputFormat does not transfer via apply_template
- **Severity:** incorrect
- **Tags:** xml-pipeline, apply_template, output-format
- **Summary:** `outputFormat` is an Event root property that is target-owned. It does not transfer from template to target via `apply_template`. Each created event retains its own default `outputFormat`.
- **Correct:** If specific outputFormat is required, set it explicitly on target events after apply_template via `execute_batch` `tcp.execute_script` or a separate `execute_batch` `xml.execute_patch` modify_properties operation.
- Source: Dry-run learning 11 (2026-03-18 pipeline dry run)

### XML-R12: Template bank relationship does not transfer (intentional)
- **Severity:** cosmetic
- **Tags:** xml-pipeline, apply_template, banks
- **Summary:** The template event's bank assignment does not transfer to created events. This is intentional -- newly created events should be assigned to their own target banks, not inherited from the template. Bank assignment is always a separate explicit step.
- **Correct:** Always follow apply_template with explicit `execute_batch` `events.assign_bank` calls for each new event. Do not rely on bank inheritance from the template.
- Source: Dry-run learning 12 (2026-03-18 pipeline dry run)

### XML-R13: ProxyEffect and AutomationCurve GUIDs are preserved correctly
- **Severity:** cosmetic
- **Tags:** xml-pipeline, apply_template, guids
- **Summary:** ProxyEffect preset GUIDs and AutomationCurve parameter GUIDs are external references. They are preserved as-is during `apply_template` (not remapped) because they point to shared project resources. This is correct behavior -- each cloned event correctly references the same presets and parameters.
- **Correct:** If ProxyEffect or AutomationCurve references appear in a cloned event, they are intentionally preserved (not bugs). They point to the same shared resources as the template.
- Source: Dry-run learning 13 (2026-03-18 pipeline dry run)

### XML-R14: XML effect properties use camelCase — reference fmod-xml-schema.json
- **Severity:** incorrect
- **Tags:** xml-pipeline, effect-properties, naming
- **Summary:** FMOD XML effect properties use camelCase naming (e.g., `lowGain`, `highCrossover`, `threshold`, `attackTime`), not PascalCase or FMOD GUI labels. Using wrong casing (e.g., `LowGain`, `HighFreq`) in `execute_batch` `xml.execute_patch` effect_properties silently creates non-functional properties — no error, but the values don't apply.
- **Correct:** Always reference `.planning/phases/32-xml-editing-pipeline/fmod-xml-schema.json` for canonical property names per effect class. Common ones:
  | Effect | Properties |
  |--------|-----------|
  | ThreeEQEffect | `lowGain`, `midGain`, `highGain`, `lowCrossover`, `highCrossover`, `crossoverSlope`, `bypass` |
  | CompressorEffect | `threshold`, `ratio`, `attackTime`, `releaseTime`, `gain`, `bypass` |
  | GainEffect | `gain`, `bypass` |
  | DelayEffect | `delay`, `feedback`, `level`, `dryLevel`, `bypass` |
  | SpatialiserEffect | `minimumDistance`, `maximumDistance`, `bypass` |

  The schema file was generated by corpus analysis of 3,507 events (Phase 32-01) and is authoritative.
- Source: A/B experiment (2026-03-19) — `LowGain`/`HighFreq` produced zero-value effects; `lowGain`/`highCrossover` are correct

### XML-R18: apply_template overwrites bus routing — set routing AFTER template application
- **Severity:** incorrect
- **Tags:** xml-pipeline, apply_template, bus-routing, sequence
- **Summary:** `clone_routing_structure` clones the entire MixerInput from the template, including its `output` relationship (bus routing). Any bus routing set on the target event *before* template application is silently overwritten with the template's bus routing. This means events created via TCP with correct bus routing will lose that routing when `apply_template` runs.
- **Correct:** In the event creation pipeline, set bus routing *after* template application, not before. The sequence is:
  1. Create event via TCP (folder, name, bank assignment)
  2. Save + refresh entity cache
  3. Apply template via `xml.execute_batch` (overwrites mixer structure including bus)
  4. Restart FMOD
  5. Set final bus routing via TCP: `ev.mixerInput.output = studio.project.lookup("{BUS_GUID}");`
  6. Save

  Alternatively, if the template's bus routing is correct for the target events (e.g., all boss events go to `SFX_Boss`), no post-template routing fix is needed. Only fix routing when the target bus differs from the template's bus.
- Source: Live event creation session (2026-03-23) — 7 tefframech Stage 4 events had bus set to `SFX_Boss/Grandpa/Mech` via TCP, then `apply_template` from `Boss_OneShot` overwrote to `SFX_Boss`

## Reference (Tier 2 -- loaded on demand)

_No Tier 2 rules yet._
