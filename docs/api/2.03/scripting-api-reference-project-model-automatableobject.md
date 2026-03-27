# Scripting API Reference | Project.Model.AutomatableObject

FMOD Studio User Manual 2.03.12

## Types

- **model.AutomatableObject** — The base class for objects that can be automated or modulated.

## Extension Methods

- **AutomatableObject.addAutomator** — Creates a `model.Automator` for a given property of the automatable object.
- **AutomatableObject.addModulator** — Creates a `model.Modulator` for a given property of the automatable object.

---

## model.AutomatableObject

The base class for objects that can be automated or modulated.

---

## AutomatableObject.addAutomator

Creates a `model.Automator` for a given property of the automatable object.

```js
AutomatableObject.addAutomator(
    propertyName
)
```

**Parameters:**

- **propertyName** — The name of the automator to add.

**Returns:** The automator `ManagedObject`.

**Example:**

```js
var automator1 = sound.addAutomator("volume"); // adds an automator for the volume property of the sound
var automator2 = sound.addAutomator(sound.pitch); // alternatively, the property can be used as an argument
```

---

## AutomatableObject.addModulator

Creates a `model.Modulator` for a given property of the automatable object.

```js
AutomatableObject.addModulator(
    modulatorType,
    propertyName
)
```

**Parameters:**

- **modulatorType** — Type of modulator to add. Must be `RandomizerModulator`, `ADSRModulator`, `SidechainModulator` or `AutopitchModulator`.
- **propertyName** — The name of the property to modulate with the newly created modulator.

**Returns:** The modulator `ManagedObject`.

**Example:**

```js
var randModulator = sound.addModulator("RandomizerModulator", "volume"); // adds a randomizer modulator for the volume property of the sound
var ahdsrModulator = sound.addModulator("ADSRModulator", sound.pitch); // alternatively, the property can be used as an argument
```

**See Also:** [Automation](https://fmod.com/docs/2.03/studio/glossary.html#automation)
