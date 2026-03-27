---
title: "Scripting API Reference | Project.Model.Sound"
source: "FMOD 2.02 Studio Scripting API"
downloaded: "2026-02-24"
---

# 26\. Scripting API Reference | Project.Model.Sound

**Types:**

-   [model.CommandSound](scripting-api-reference-project-model-sound.html#modelcommandsound "An instrument that triggers an API command.") An instrument that triggers an API command.
-   [model.EventSound](scripting-api-reference-project-model-sound.html#modeleventsound "An instrument that references a model.Event or snapshot to play.") An [instrument](glossary.html#instrument) that references a `model.Event` or [snapshot](glossary.html#snapshot) to play.
-   [model.MultiSound](scripting-api-reference-project-model-sound.html#modelmultisound "A container instrument that selects from a playlist of other model.Sounds.") A container [instrument](glossary.html#instrument) that selects from a [playlist](glossary.html#playlist) of other `model.Sound`s.
-   [model.PluginSound](scripting-api-reference-project-model-sound.html#modelpluginsound "An instrument that uses an external DSP to generate sound.") An instrument that uses an external DSP to generate sound.
-   [model.ProgrammerSound](scripting-api-reference-project-model-sound.html#modelprogrammersound "An instrument that can be assigned an asset at runtime.") An instrument that can be assigned an asset at runtime.
-   [model.SilenceSound](scripting-api-reference-project-model-sound.html#modelsilencesound "An instrument that plays nothing for a specified amount of time.") An instrument that plays nothing for a specified amount of time.
-   [model.SingleSound](scripting-api-reference-project-model-sound.html#modelsinglesound "An instrument that plays a single audio asset.") An [instrument](glossary.html#instrument) that plays a single [audio asset](glossary.html#audio-file).
-   [model.Sound](scripting-api-reference-project-model-sound.html#modelsound "The base class for all instrument types.") The base class for all instrument types.
-   [model.SoundScatterer](scripting-api-reference-project-model-sound.html#modelsoundscatterer "A container instrument that applies temporal and spatial randomization to a playlist of other instruments.") A container [instrument](glossary.html#instrument) that applies temporal and spatial randomization to a playlist of other instruments.

**Extension Methods:**

-   [Sound.setFadeInCurve](scripting-api-reference-project-model-sound.html#soundsetfadeincurve "Sets the fade-in curve of the instrument to the specified length and curve shape.") Sets the fade-in curve of the instrument to the specified length and curve shape.
-   [Sound.setFadeOutCurve](scripting-api-reference-project-model-sound.html#soundsetfadeoutcurve "Sets the fade-out curve of the instrument to the specified length and curve shape.") Sets the fade-out curve of the instrument to the specified length and curve shape.

## [model.CommandSound](#modelcommandsound)

An instrument that triggers an API command.

**See Also:** [Command Instrument](https://fmod.com/docs/2.02/studio/instrument-reference.html#command-instrument)

## [model.EventSound](#modeleventsound)

An [instrument](glossary.html#instrument) that references a [model.Event](scripting-api-reference-project-model-event.html#modelevent) or [snapshot](glossary.html#snapshot) to play.

**See Also:** [Event Instrument](https://fmod.com/docs/2.02/studio/instrument-reference.html#event-instrument), [Snapshot Instrument](instrument-reference.html#snapshot-instrument)

## [model.MultiSound](#modelmultisound)

A container [instrument](glossary.html#instrument) that selects from a [playlist](glossary.html#playlist) of other [model.Sound](scripting-api-reference-project-model-sound.html#modelsound)s.

**See Also:** [Multi Instrument](https://fmod.com/docs/2.02/studio/instrument-reference.html#multi-instrument)

## [model.PluginSound](#modelpluginsound)

An instrument that uses an external DSP to generate sound.

**See Also:** [Plug-in Reference](https://fmod.com/docs/2.02/studio/plugin-reference.html)

## [model.ProgrammerSound](#modelprogrammersound)

An instrument that can be assigned an asset at runtime.

**See Also:** [Programmer Instrument](https://fmod.com/docs/2.02/studio/instrument-reference.html#programmer-instrument)

## [model.SilenceSound](#modelsilencesound)

An instrument that plays nothing for a specified amount of time.

**See Also:** [Silence Instrument](https://fmod.com/docs/2.02/studio/instrument-reference.html#silence-instrument)

## [model.SingleSound](#modelsinglesound)

An [instrument](glossary.html#instrument) that plays a single [audio asset](glossary.html#audio-file).

**See Also:** [Single Instrument](https://fmod.com/docs/2.02/studio/instrument-reference.html#single-instrument)

## [model.Sound](#modelsound)

The base class for all instrument types.

[Instruments](glossary.html#instrument) can be placed on a track, or within a [model.MultiSound](scripting-api-reference-project-model-sound.html#modelmultisound) [playlist](glossary.html#playlist).

## [model.SoundScatterer](#modelsoundscatterer)

A container [instrument](glossary.html#instrument) that applies temporal and spatial randomization to a playlist of other instruments.

**See Also:** [Scatterer Instrument](https://fmod.com/docs/2.02/studio/instrument-reference.html#scatterer-instrument)

## [Sound.setFadeInCurve](#soundsetfadeincurve)

Sets the fade-in curve of the instrument to the specified length and curve shape.

```javascript
Sound.setFadeInCurve(
    length,
    curveShape
)
```

length

The numerical duration of the new fade-in curve.

curveShape

The numerical velocity of the curve. A value of 0 creates a linear fade-in, a positive value creates an accelerating fade-in, and a negative negative value creates a decelerating fade-in.

If no fade-in curve exists on the sound, one is created. If `length` is approaching zero, no curve is added. If the curve has an existing fade-in curve, it is removed. If no `curveShape` is provided, the default shape is used instead.

## [Sound.setFadeOutCurve](#soundsetfadeoutcurve)

Sets the fade-out curve of the instrument to the specified length and curve shape.

```javascript
Sound.setFadeInCurve(
    length,
    curveShape
)
```

length

The numerical duration of the new fade-out curve.

curveShape

The numerical velocity of the curve. A value of 0 creates a linear fade-out, a positive value creates an accelerating fade-out, and a negative negative value creates a decelerating fade-out.

If no fade-out curve exists on the sound, one is created. If `length` is approaching zero, no curve is added. If the curve has an existing fade-out curve, it is removed. If no `curveShape` is provided, the default shape is used instead.

**See Also:** [Instrument](https://fmod.com/docs/2.02/studio/glossary.html#instrument)
