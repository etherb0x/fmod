---
title: "FMOD - Scripting API Reference | Project.Model.AutomatableObject"
source: "FMOD 2.02 Studio Scripting API"
downloaded: "2026-02-24"
---

# 26\. Scripting API Reference | Project.Model.AutomatableObject

**Types:**

-   [model.AutomatableObject](scripting-api-reference-project-model-automatableobject.html#modelautomatableobject "The base class for objects that can be automated or modulated.") The base class for objects that can be automated or modulated.

**Extension Methods:**

-   [AutomatableObject.addAutomator](scripting-api-reference-project-model-automatableobject.html#automatableobjectaddautomator "Creates a model.Automator for a given property of the automatable object.") Creates a `model.Automator` for a given property of the automatable object.
-   [AutomatableObject.addModulator](scripting-api-reference-project-model-automatableobject.html#automatableobjectaddmodulator "Creates a model.Modulator for a given property of the automatable object.") Creates a `model.Modulator` for a given property of the automatable object.

## [model.AutomatableObject](#modelautomatableobject)

The base class for objects that can be automated or modulated.

## [AutomatableObject.addAutomator](#automatableobjectaddautomator)

Creates a [model.Automator](scripting-api-reference-project-model-automator.html#modelautomator) for a given property of the automatable object.

```javascript
AutomatableObject.addAutomator(
    propertyName
)
```

propertyName

The name of the automator to add.

Returns the automator [ManagedObject](scripting-api-reference-project-managedobject.html#managedobject).

Example:

```javascript
var automator1 = sound.addAutomator("volume"); // adds an automator for the volume property of the sound
var automator2 = sound.addAutomator(sound.pitch); // alternatively, the property can be used as an argument
```

## [AutomatableObject.addModulator](#automatableobjectaddmodulator)

Creates a [model.Modulator](scripting-api-reference-project-model-modulator.html#modelmodulator) for a given property of the automatable object.

```javascript
AutomatableObject.addModulator(
    modulatorType,
    propertyName
)
```

modulatorType

Type of [modulator](https://fmod.com/docs/2.02/studio/glossary.html#modulator) to add. Must be `RandomizerModulator`, `ADSRModulator`, `SidechainModulator` or `AutopitchModulator`.

propertyName

The name of the property to modulate with the newly create modulator.

Returns the modulator [ManagedObject](scripting-api-reference-project-managedobject.html#managedobject).

Example:

```javascript
var randModulator = sound.addModulator("RandomizerModulator", "volume"); // adds a randomizer modulator for the volume property of the sound
var ahdsrModulator = sound.addModulator("ADSRModulator", sound.pitch); // alternatively, the property can be used as an argument
```

**See Also:** [Automation](https://fmod.com/docs/2.02/studio/glossary.html#automation)
