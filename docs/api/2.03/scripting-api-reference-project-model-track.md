# Scripting API Reference | Project.Model.Track

FMOD Studio User Manual 2.03.12

## Types

- **model.AudioTrack** — The base class for tracks that can contain instruments.
- **model.GroupTrack** — A track within an event that is associated with a mixer group.
- **model.MarkerTrack** — A logic track containing logic markers.

## Extension Methods

- **AudioTrack.addAutomationTrack** — Creates an automation track for a given property of an automatable object.
- **GroupTrack.addSound** — Adds an instrument to the track on the `model.Parameter` specified.
- **GroupBus.getItem** — Retrieves the mixer bus at the relative path specified.
- **MarkerTrack.addNamedMarker** — Adds a destination marker to the marker track at the given position.
- **MarkerTrack.addRegion** — Adds a destination region to the marker track at the given position with the given length.
- **MarkerTrack.addSustainPoint** — Adds a sustain point to the track at the given position.
- **MarkerTrack.addTransitionMarker** — Adds a transition marker to the track at the given position.
- **MarkerTrack.addTransitionRegion** — Adds a transition region to the track at the given position with the given length.

---

## model.AudioTrack

The base class for tracks that can contain instruments.

**See Also:** [model.Sound](https://www.fmod.com/docs/2.03/studio/scripting-api-reference-project-model-sound.html#modelsound)

---

## model.GroupTrack

A track within an event that is associated with a mixer group.

**See Also:** [model.Event](https://www.fmod.com/docs/2.03/studio/scripting-api-reference-project-model-event.html#modelevent), [model.MixerGroup](https://www.fmod.com/docs/2.03/studio/scripting-api-reference-project-model-mixerstrip.html#modelmixergroup)

---

## model.MarkerTrack

A logic track containing logic markers.

---

## AudioTrack.addAutomationTrack

Creates an automation track for a given property of an automatable object.

```js
AudioTrack.addAutomationTrack(
    automatableObject,
    propertyName
)
```

**Parameters:**

- **automatableObject** — Any `model.AutomatableObject` of the track such as a `model.Sound`, a `model.MixerEffect`, or the `model.MixerBus` of the track itself.
- **propertyName** — Any valid automatable property of the specified `model.AutomatableObject`.

**Returns:** The automation track `ManagedObject`.

Automation can be present even if the automation track is hidden.

**Example:**

```js
// adds an automation track for a master track's volume
var event = studio.project.workspace.addEvent("New Event", true);
var masterTrack = event.masterTrack;
var automationTrack = masterTrack.addAutomationTrack(masterTrack.mixerGroup, "volume");

// adds an automation track for a gain effect's gain
var gainEffect = masterTrack.mixerGroup.effectChain.addEffect("GainEffect");
var automationTrack2 = masterTrack.addAutomationTrack(gainEffect, "gain");
```

**See Also:** [Tracks](https://fmod.com/docs/2.03/studio/authoring-events.html#tracks)

---

## GroupTrack.addSound

Adds an instrument to the track on the `model.Parameter` specified.

```js
GroupTrack.addSound(
    parameter,
    soundType,
    start,
    length
)
```

**Parameters:**

- **parameter** — The parameter sheet to add the sound to.
- **soundType** — The type of the `model.Sound`. Must be `model.SingleSound`, `model.MultiSound`, or `model.ProgrammerSound`.
- **start** — The numerical position of the new `model.Sound`. The value must be within the parameter's range.
- **length** — The numerical length of the new `model.Sound`.

**Returns:** The `model.Sound` `ManagedObject`.

**See Also:** [Tracks](https://fmod.com/docs/2.03/studio/authoring-events.html#tracks)

---

## GroupBus.getItem

Retrieves the mixer bus at the relative path specified.

```js
GroupBus.getItem(
    path
)
```

**Parameters:**

- **path** — Relative path of the entity to get the `model.MixerBus` of.

**Returns:** The `model.MixerBus` at the relative `path` specified. Returns `undefined` if the bus cannot be found.

**Example:**

```js
var bus = studio.project.workspace.mixer.masterBus.getItem("sfx/player");
```

---

## MarkerTrack.addNamedMarker

Adds a destination marker to the marker track at the given position.

```js
MarkerTrack.addNamedMarker(
    name,
    position
)
```

**Parameters:**

- **name** — The `string` value to assign the marker when created.
- **position** — The numerical position to place the marker.

**Returns:** The named marker `ManagedObject`.

---

## MarkerTrack.addRegion

Adds a destination region to the marker track at the given position with the given length.

```js
MarkerTrack.addRegion(
    position,
    length,
    name,
    loopMode
)
```

**Parameters:**

- **position** — The numerical start position of the new region.
- **length** — The numerical length of the new region.
- **name** — The `string` value to assign the new region.
- **loopMode** — A number representing the region's loop mode. Defaults to `project.regionLoopMode.Looping` if `loopMode` is `undefined`. The loop mode can be set by passing in a valid `loopMode` argument, as described by the `Project.regionLoopMode` enum.

**Returns:** The newly created region's `ManagedObject`.

---

## MarkerTrack.addSustainPoint

Adds a sustain point to the track at the given position.

```js
MarkerTrack.addSustainPoint(
    position
)
```

**Parameters:**

- **position** — The numerical position to place the new sustain point at.

**Returns:** The `SustainPoint` `ManagedObject`.

---

## MarkerTrack.addTransitionMarker

Adds a transition marker to the track at the given position.

```js
MarkerTrack.addTransitionMarker(
    position,
    destination
)
```

**Parameters:**

- **position** — The numerical position to place the new transition marker at.
- **destination** — A `ManagedObject` of type `NamedMarker` or `LoopRegion`.

**Returns:** The newly created `TransitionMarker` `ManagedObject`.

---

## MarkerTrack.addTransitionRegion

Adds a transition region to the track at the given position with the given length.

```js
MarkerTrack.addTransitionRegion(
    position,
    length,
    destination
)
```

**Parameters:**

- **position** — The numerical position to place the new transition region at.
- **length** — The numerical length of the new transition region.
- **destination** — Either a `NamedMarker` or a `LoopRegion`.

**Returns:** The `TransitionRegion` `ManagedObject`.
