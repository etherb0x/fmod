# FMOD 2.02 Scripting API Reference

Index of the FMOD Studio 2.02 JavaScript scripting API docs. Start with the main reference, then drill into the domain you need.

## Entry Points

- [scripting-api-reference.md](scripting-api-reference.md) — Top-level overview of all API modules (start here)
- [scripting-api-reference-globals.md](scripting-api-reference-globals.md) — Global functions: console.log, console.warn, system aliases
- [scripting-api-reference-system.md](scripting-api-reference-system.md) — System module: require(), print, warn
- [scripting-api-reference-menu.md](scripting-api-reference-menu.md) — Menu module: register menu items, execute scripts
- [scripting-api-reference-window.md](scripting-api-reference-window.md) — Window module: open/navigate/control windows
- [scripting-api-reference-ui.md](scripting-api-reference-ui.md) — UI module: dialogs, modeless windows, widgets

## Project Module

- [scripting-api-reference-project.md](scripting-api-reference-project.md) — Project module: build banks, create/delete objects, import audio, lookup by path/GUID
- [scripting-api-reference-project-workspace.md](scripting-api-reference-project-workspace.md) — Workspace: root managed object, add events/parameters/tags
- [scripting-api-reference-project-entity.md](scripting-api-reference-project-entity.md) — Entity: type descriptors for ManagedObjects
- [scripting-api-reference-project-managedobject.md](scripting-api-reference-project-managedobject.md) — ManagedObject: base unit of project data (GUID, properties, relationships)
- [scripting-api-reference-project-model.md](scripting-api-reference-project-model.md) — Project.Model: access Entity classes by name

## Project Model Types

- [scripting-api-reference-project-model-event.md](scripting-api-reference-project-model-event.md) — Event/Snapshot: tracks, parameters, 3D attributes
- [scripting-api-reference-project-model-sound.md](scripting-api-reference-project-model-sound.md) — Sound types: Single, Multi, Command, Programmer, Plugin, Scatterer, Silence
- [scripting-api-reference-project-model-track.md](scripting-api-reference-project-model-track.md) — Track types: Audio, Group, Marker — add sounds, automation, named markers
- [scripting-api-reference-project-model-parameter.md](scripting-api-reference-project-model-parameter.md) — Parameter types: GameParameter, Timeline, ActionSheet, Preset, Proxy
- [scripting-api-reference-project-model-bank.md](scripting-api-reference-project-model-bank.md) — Bank: event collections for binary builds
- [scripting-api-reference-project-model-folder.md](scripting-api-reference-project-model-folder.md) — Folder types: Folder, MasterAssetFolder — path-based retrieval
- [scripting-api-reference-project-model-asset.md](scripting-api-reference-project-model-asset.md) — Asset types: Asset, AudioFile — absolute/relative path handling

## Mixer & Effects

- [scripting-api-reference-project-model-mixerstrip.md](scripting-api-reference-project-model-mixerstrip.md) — Mixer strips: Bus, Group, Master, Return, Port, EventMixer variants
- [scripting-api-reference-project-model-mixereffect.md](scripting-api-reference-project-model-mixereffect.md) — Mixer effects: Compressor, Reverb, Delay, Chorus, Flanger, Gain, EQ, etc.

## Automation & Modulation

- [scripting-api-reference-project-model-automationcurve.md](scripting-api-reference-project-model-automationcurve.md) — AutomationCurve: maps values to Parameters
- [scripting-api-reference-project-model-automatableobject.md](scripting-api-reference-project-model-automatableobject.md) — AutomatableObject: base for automatable/modulatable objects
- [scripting-api-reference-project-model-automator.md](scripting-api-reference-project-model-automator.md) — Automator: binds properties to AutomationCurves
- [scripting-api-reference-project-model-modulator.md](scripting-api-reference-project-model-modulator.md) — Modulator: runtime modulation bindings
- [scripting-api-reference-project-model-triggerable.md](scripting-api-reference-project-model-triggerable.md) — Triggerable: base for trigger-capable entities, parameter conditions
