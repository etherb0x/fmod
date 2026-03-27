# FMOD XML Effect Property Mappings

**Generated:** 2026-03-19
**Source:** `.planning/phases/32-xml-editing-pipeline/fmod-xml-schema.json` (corpus analysis of 3,502 events)
**Corpus coverage:** Classes observed in actual project files — rare or unused FMOD effects may not appear here.

This document is the **single source of truth** for all FMOD XML effect property names and `execute_batch` `xml.execute_patch` operation parameter names. It replaces guesswork and GUI-label-based assumptions. Wrong property names are silently accepted by the XML pipeline but ignored by FMOD on load, producing zero-value effects with no error (see XML-R15, XML-R14).

---

## Section 1: Effect Class XML Property Reference

All property names are **camelCase** exactly as they appear in FMOD XML files — with one exception: `SFXReverbEffect` has two PascalCase properties (`HFDecayRatio`, `HFReference`). These are genuine FMOD property names, not casing errors.

### Tier 1: High-Frequency Effects (count > 100 in corpus)

| Effect Class | XML Properties (exact names) | Count | Notes |
|---|---|---:|---|
| MixerBusFader | _(no patchable properties)_ | 17,974 | Structural anchor only — never patch properties. Nullifying it destroys the track (SCRIPT-R02). |
| ProxyEffect | `inputFormat` | 3,846 | Behavior via `preset` relationship (external GUID), not patchable via properties alone. Do NOT include in property-setting workflows. |
| ThreeEQEffect | `bypass`, `crossoverSlope`, `highCrossover`, `highGain`, `lowCrossover`, `lowGain`, `midGain` | 2,341 | |
| MixerSend | `bypass`, `inputFormat`, `level` | 1,803 | Also has `mixerReturn` relationship. |
| MultibandEqEffect | `bypass`, `filterTypeA`, `filterTypeB`, `filterTypeC`, `filterTypeD`, `filterTypeE`, `frequencyA`, `frequencyB`, `frequencyC`, `frequencyD`, `frequencyE`, `gainA`, `gainB`, `gainC`, `gainD`, `gainE`, `qualityA`, `qualityB`, `qualityC`, `qualityD`, `qualityE` | 1,614 | 21 properties total — 5 filter bands (A–E), each with type, frequency, gain, quality. |
| PannerEffect | `bypass`, `overridingOutputFormat`, `stereoPan` | 741 | |
| DelayEffect | `bypass`, `delay`, `dryLevel`, `feedback`, `level` | 602 | |
| GainEffect | `bypass`, `gain` | 512 | |
| SFXReverbEffect | `HFDecayRatio`, `HFReference`, `bypass`, `decayTime`, `density`, `diffusion`, `dryLevel`, `earlyDelay`, `earlyLateMix`, `highCut`, `lateDelay`, `lowShelfFrequency`, `lowShelfGain`, `wetLevel` | 426 | **EXCEPTION:** `HFDecayRatio` and `HFReference` are PascalCase — the ONLY known exceptions to the camelCase rule. All other 12 properties are camelCase. |
| PitchShifterEffect | `bypass`, `fftSize`, `maxChannels`, `overlap`, `pitch` | 364 | |
| CompressorEffect | `attackTime`, `bypass`, `gain`, `ratio`, `releaseTime`, `threshold` | 360 | |
| SpatialiserEffect | `distanceRolloffType`, `extentMode`, `maximumDistance`, `minimumDistance`, `minimumExtent`, `overrideRange`, `soundSize` | 74 | |

### Tier 2: Lower-Frequency Effects (count < 100 in corpus)

| Effect Class | XML Properties (exact names) | Count | Notes |
|---|---|---:|---|
| FlangerEffect | `bypass`, `delay`, `mix`, `rate` | 86 | |
| TremoloEffect | `bypass`, `depth`, `duty`, `frequency`, `phase`, `shape`, `skew`, `spread`, `square` | 86 | |
| DistortionEffect | `bypass`, `level` | 169 | |
| ChorusEffect | `depth`, `mix`, `rate` | 17 | No `bypass` property in corpus. |
| ConvolutionReverbEffect | `dryLevel`, `endFrame`, `linkChannels`, `wetLevel` | 12 | |
| ChannelMixEffect | `outputGrouping` | 4 | |
| LimiterEffect | `ceiling` | 3 | |
| LowpassSimpleEffect | `cutoff` | 1 | Thin coverage — only 1 instance in corpus. |

---

## Section 2: query_fmod event_details Coverage Map

`query_fmod` `event_details` calls `serializeEffect()` which probes a **hardcoded property list** (in `scripts/fmod_query.py`):

```javascript
var props = ["bypass", "wetLevel", "dryLevel", "gain", "lowGain", "midGain", "highGain"];
```

This covers only a small subset of most effects. Properties NOT in this list are invisible to `query_fmod event_details` even when correctly written to XML. For verification of unlisted properties, use `execute_batch` `tcp.execute_script` with targeted FMOD API reads.

| Effect Class | Properties Readable via `query_fmod event_details` | Properties Requiring `execute_batch tcp.execute_script` | Coverage |
|---|---|---|---|
| GainEffect | `bypass`, `gain` | — | 2/2 (full) |
| DistortionEffect | `bypass`, `level` | — | 2/2 (full) |
| ThreeEQEffect | `bypass`, `lowGain`, `midGain`, `highGain` | `crossoverSlope`, `highCrossover`, `lowCrossover` | 4/7 |
| DelayEffect | `bypass`, `dryLevel`, `level` | `delay`, `feedback` | 3/5 |
| MixerSend | `bypass`, `level` | `inputFormat` | 2/3 |
| CompressorEffect | `bypass`, `gain` | `attackTime`, `ratio`, `releaseTime`, `threshold` | 2/6 |
| SFXReverbEffect | `bypass`, `dryLevel`, `wetLevel` | 11 other properties | 3/14 |
| PannerEffect | `bypass` | `overridingOutputFormat`, `stereoPan` | 1/3 |
| PitchShifterEffect | `bypass` | `fftSize`, `maxChannels`, `overlap`, `pitch` | 1/5 |
| MultibandEqEffect | `bypass` | 20 other properties | 1/21 |
| FlangerEffect | `bypass` | `delay`, `mix`, `rate` | 1/4 |
| TremoloEffect | `bypass` | `depth`, `duty`, `frequency`, `phase`, `shape`, `skew`, `spread`, `square` | 1/9 |
| SpatialiserEffect | _(none)_ | all 7 properties | 0/7 |
| ChorusEffect | _(none — no bypass in corpus)_ | `depth`, `mix`, `rate` | 0/3 |
| ConvolutionReverbEffect | `dryLevel`, `wetLevel` | `endFrame`, `linkChannels` | 2/4 |
| LimiterEffect | _(none)_ | `ceiling` | 0/1 |
| LowpassSimpleEffect | _(none)_ | `cutoff` | 0/1 |
| ChannelMixEffect | _(none)_ | `outputGrouping` | 0/1 |

**Implication for test strategy:** The test suite CANNOT rely solely on `query_fmod event_details` to verify property application. For most effects, use `execute_batch` `tcp.execute_script` with direct property reads (e.g., `effect.threshold`, `effect.attackTime`) for full verification.

---

## Section 3: GUI Label to XML Property Name Divergences

FMOD Studio's GUI labels do NOT match XML property names. This is the root cause of the A/B experiment silent failures (2026-03-19).

### Known Divergences on ThreeEQEffect

| FMOD Studio GUI Label | XML Property Name | Match? |
|---|---|---|
| "High Freq" | `highCrossover` | **MISMATCH** — never use `HighFreq` or `highFreq` |
| "Low Freq" | `lowCrossover` | **MISMATCH** — never use `LowFreq` or `lowFreq` |
| "High Gain" | `highGain` | Matches (camelCase) |
| "Low Gain" | `lowGain` | Matches (camelCase) |
| "Mid Gain" | `midGain` | Matches (camelCase) |

### Casing Trap (affects all effects)

FMOD GUI labels use Title Case. XML property names use camelCase. Never copy a GUI label as a property name:

| Wrong (from GUI label) | Correct (XML property) | Effect |
|---|---|---|
| `LowGain` | `lowGain` | ThreeEQEffect |
| `HighGain` | `highGain` | ThreeEQEffect |
| `Threshold` | `threshold` | CompressorEffect |
| `AttackTime` | `attackTime` | CompressorEffect |
| `ReleaseTime` | `releaseTime` | CompressorEffect |
| `WetLevel` | `wetLevel` | SFXReverbEffect, ConvolutionReverbEffect |
| `DryLevel` | `dryLevel` | DelayEffect, SFXReverbEffect, ConvolutionReverbEffect |

### SFXReverbEffect PascalCase Exception

`HFDecayRatio` and `HFReference` use PascalCase intentionally. These are **the ONLY exceptions** to the camelCase rule. Writing `hfDecayRatio` or `hfReference` (lowercase) will silently fail.

---

## Section 4: Value Types and Formats

All XML property values are strings (`Record<string, string>` in `FmodXmlObject.properties`). Numeric values are stored as string representations without quotes.

| Value Category | Typical Range | Example |
|---|---|---|
| Gain (dB) | `-80` to `+10` | `"lowGain": "-6"` |
| Frequency (Hz) | `10` to `22050` | `"highCrossover": "8000"` |
| Time (ms) | `0` to max | `"attackTime": "10"` |
| Ratio | `1` to max | `"ratio": "4"` |
| Boolean (`bypass`) | `"true"` / `"false"` | `"bypass": "false"` — exact format TBD (flag for live test verification) |
| Slope | numeric step | `"crossoverSlope": "1"` |

**Note:** The exact string format for boolean properties (`bypass`) has not been live-verified. The live test suite (Phase 44 Plan 02) will confirm whether FMOD expects `"true"`/`"false"` or `"1"`/`"0"`.

---

## Section 5: execute_batch xml.execute_patch Operation Parameter Reference

All parameter names use `snake_case` (MCP tool convention). These are the exact parameter names callers must use.

For `add_effect`, always look up property names in Section 1 above — never guess from GUI labels.

| Operation | Required Parameters | Optional Parameters | Notes |
|---|---|---|---|
| `add_track` | `name` | `color`, `output_guid` | Creates a GroupTrack. Set `output_guid` for bus routing (required to avoid master bus default — see SCRIPT-R06). |
| `add_return_track` | `name` | `color` | Creates a ReturnTrack. |
| `add_effect` | `track_name`, `effect_class` | `effect_properties`, `position` | `effect_properties` is `Record<string, string>` — use Section 1 for valid property names. `position` is `"append"` or `"prepend"`. |
| `reroute_output` | `track_name`, `output_guid` | — | Changes the bus routing of an existing track. |
| `apply_template` | `template_path` | — | **Destructive:** replaces entire event structure from the template event. See XML-R01 for required sequence. |
| `copy_routing` | `template_path` | — | **Additive:** merges routing tracks from template into target alongside existing structure. |
| `patch` | _(varies)_ | — | Low-level raw XML patch object. Prefer the specific operations above. Accepts `add_objects`, `modify_properties`, `add_relationships`. |

### Additional Common Parameters

All operations also accept:

| Parameter | Type | Description |
|---|---|---|
| `event_path` | `string` | Target FMOD event path (e.g., `event:/Creatures/Fly`) — required for all operations |
| `skip_restart` | `boolean` | Skip the FMOD restart step (for batch chaining — restart manually on the last call) |
| `batch_targets` | `string[]` | Additional event paths to apply the same operation to before a single restart |

### Cross-Reference

- `effect_class` values: see Section 1 class names (e.g., `"ThreeEQEffect"`, `"CompressorEffect"`)
- `effect_properties` keys: see Section 1 property columns (e.g., `"lowGain"`, `"threshold"`, `"HFDecayRatio"`)
- `output_guid` / `template_path`: look up via `query_fmod` `search` or entity cache GUIDs

---

## Quick Reference: Common Mistakes

| Mistake | Symptom | Fix |
|---|---|---|
| Using `LowGain` instead of `lowGain` | Effect applies, all values are defaults, no error | Use exact property name from Section 1 |
| Using `HighFreq` instead of `highCrossover` | Same — silent failure | `highCrossover` is the XML name; "High Freq" is the GUI label |
| Assuming `query_fmod event_details` covers all properties | Test passes vacuously — threshold/attackTime etc. not probed | Use `execute_batch tcp.execute_script` for non-hardcoded properties (see Section 2) |
| Using lowercase `hfDecayRatio` on SFXReverbEffect | Silent failure | Only `HFDecayRatio` and `HFReference` are PascalCase — use them exactly |
| Setting properties on ProxyEffect | No effect — ProxyEffect is a reference/wrapper | ProxyEffect behavior requires `preset` relationship GUID, not `effect_properties` |
