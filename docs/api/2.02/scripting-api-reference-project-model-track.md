---
title: "Scripting API Reference | Project.Model.Track"
source: "FMOD 2.02 Studio Scripting API"
downloaded: "2026-02-24"
---

# 26\. Scripting API Reference | Project.Model.Track

**Types:**

-   [model.AudioTrack](scripting-api-reference-project-model-track.html#modelaudiotrack "The base class for tracks that can contain instruments.") The base class for tracks that can contain [instruments](glossary.html#instrument).
-   [model.GroupTrack](scripting-api-reference-project-model-track.html#modelgrouptrack "A track within an event that is associated with a mixer group.") A [track](glossary.html#track) within an event that is associated with a mixer group.
-   [model.MarkerTrack](scripting-api-reference-project-model-track.html#modelmarkertrack "A logic track containing logic markers.") A [logic track](glossary.html#logic-track) containing [logic markers](glossary.html#logic-marker).

**Extension Methods:**

-   [AudioTrack.addAutomationTrack](scripting-api-reference-project-model-track.html#audiotrackaddautomationtrack "Creates an automation track for a given property of an automatable object.") Creates an automation track for a given property of an automatable object.
-   [GroupTrack.addSound](scripting-api-reference-project-model-track.html#grouptrackaddsound "Adds an instrument to the track on the model.Parameter specified.") Adds an [instrument](glossary.html#instrument) to the track on the `model.Parameter` specified.
-   [GroupBus.getItem](scripting-api-reference-project-model-track.html#groupbusgetitem "Retrieves the mixer bus at the relative path specified.") Retrieves the mixer [bus](glossary.html#bus) at the relative path specified.
-   [MarkerTrack.addNamedMarker](scripting-api-reference-project-model-track.html#markertrackaddnamedmarker "Adds a destination marker to the marker track at the given position.") Adds a [destination marker](glossary.html#destination-marker) to the [marker track](glossary.html#logic-track) at the given position.
-   [MarkerTrack.addRegion](scripting-api-reference-project-model-track.html#markertrackaddregion "Adds a destination region to the marker track at the given position with the given length.") Adds a [destination region](glossary.html#destination-region) to the [marker track](glossary.html#logic-track) at the given position with the given length.
-   [MarkerTrack.addSustainPoint](scripting-api-reference-project-model-track.html#markertrackaddsustainpoint "Adds a sustain point to the track at the given position.") Adds a [sustain point](glossary.html#sustain-point) to the track at the given position.
-   [MarkerTrack.addTransitionMarker](scripting-api-reference-project-model-track.html#markertrackaddtransitionmarker "Adds a transition marker to the track at the given position.") Adds a [transition marker](glossary.html#transition-marker) to the track at the given position.
-   [MarkerTrack.addTransitionRegion](scripting-api-reference-project-model-track.html#markertrackaddtransitionregion "Adds a transition region to the track at the given position with the given length.") Adds a [transition region](glossary.html#transition-region) to the track at the given position with the given length.

## [model.AudioTrack](#modelaudiotrack)

The base class for tracks that can contain [instruments](glossary.html#instrument).

**See Also:** [model.Sound](scripting-api-reference-project-model-sound.html#modelsound)

## [model.GroupTrack](#modelgrouptrack)

A [track](glossary.html#track) within an event that is associated with a mixer group.

**See Also:** [model.Event](scripting-api-reference-project-model-event.html#modelevent), [model.MixerGroup](scripting-api-reference-project-model-mixerstrip.html#modelmixergroup)

## [model.MarkerTrack](#modelmarkertrack)

A [logic track](glossary.html#logic-track) containing [logic markers](glossary.html#logic-marker).

## [AudioTrack.addAutomationTrack](#audiotrackaddautomationtrack)

Creates an automation track for a given property of an automatable object.

```javascript
AudioTrack.addAutomationTrack(
    automatableObject,
    propertyName
)
```

automatableObject

Any [model.AutomatableObject](scripting-api-reference-project-model-automatableobject.html#modelautomatableobject) of the track such as a [model.Sound](scripting-api-reference-project-model-sound.html#modelsound), a [model.MixerEffect](scripting-api-reference-project-model-mixereffect.html#modelmixereffect), or the [model.MixerBus](scripting-api-reference-project-model-mixerstrip.html#modelmixerbus) of the track itself.

propertyName

Any valid automatable property of the specified [model.AutomatableObject](scripting-api-reference-project-model-automatableobject.html#modelautomatableobject).

Returns the automation track [ManagedObject](scripting-api-reference-project-managedobject.html#managedobject).

Automation can be present even if the automation track is hidden.

Example:

```javascript
// adds an automation track for a master track's volume
var event = studio.project.workspace.addEvent("New Event", true);
var masterTrack = event.masterTrack;
var automationTrack = masterTrack.addAutomationTrack(masterTrack.mixerGroup, "volume");

// adds an automation track for a gain effect's gain
var gainEffect = masterTrack.mixerGroup.effectChain.addEffect("GainEffect");
var automationTrack2 = masterTrack.addAutomationTrack(gainEffect, "gain");
```

**See Also:** [Tracks](https://fmod.com/docs/2.02/studio/authoring-events.html#tracks)

## [GroupTrack.addSound](#grouptrackaddsound)

Adds an [instrument](glossary.html#instrument) to the track on the [model.Parameter](scripting-api-reference-project-model-parameter.html#modelparameter) specified.

```javascript
GroupTrack.addSound(
    parameter,
    soundType,
    start,
    length
)
```

parameter

The [parameter sheet](https://fmod.com/docs/2.02/studio/glossary.html#parameter-sheet) to add the sound to.

soundType

The type of the [model.Sound](scripting-api-reference-project-model-sound.html#modelsound). Must be [model.SingleSound](scripting-api-reference-project-model-sound.html#modelsinglesound), [model.MultiSound](scripting-api-reference-project-model-sound.html#modelmultisound), or [model.ProgrammerSound](scripting-api-reference-project-model-sound.html#modelprogrammersound).

start

The numerical position of the new [model.Sound](scripting-api-reference-project-model-sound.html#modelsound). The value must be within the [parameter](glossary.html#parameter)'s range.

length

The numerical length of the new [model.Sound](scripting-api-reference-project-model-sound.html#modelsound).

Returns the [model.Sound](scripting-api-reference-project-model-sound.html#modelsound) [ManagedObject](scripting-api-reference-project-managedobject.html#managedobject).

**See Also:** [Tracks](https://fmod.com/docs/2.02/studio/authoring-events.html#tracks)

## [GroupBus.getItem](#groupbusgetitem)

Retrieves the mixer [bus](glossary.html#bus) at the relative path specified.

```javascript
GroupBus.getItem(
    path
)
```

path

Relative path of the entity to get the [model.MixerBus](scripting-api-reference-project-model-mixerstrip.html#modelmixerbus) of.

Returns the [model.MixerBus](scripting-api-reference-project-model-mixerstrip.html#modelmixerbus) at the relative `path` specified. Returns `undefined` if the bus cannot be found.

Example:

```javascript
var bus = studio.project.workspace.mixer.masterBus.getItem("sfx/player");
```

## [MarkerTrack.addNamedMarker](#markertrackaddnamedmarker)

Adds a [destination marker](glossary.html#destination-marker) to the [marker track](glossary.html#logic-track) at the given position.

```javascript
MarkerTrack.addNamedMarker(
    name,
    position
)
```

name

The `string` value to assign the marker when created.

position

The numerical position to place marker.

Returns the named marker [ManagedObject](scripting-api-reference-project-managedobject.html#managedobject).

## [MarkerTrack.addRegion](#markertrackaddregion)

Adds a [destination region](glossary.html#destination-region) to the [marker track](glossary.html#logic-track) at the given position with the given length.

```javascript
MarkerTrack.addRegion(
    position,
    length,
    name,
    loopMode
)
```

start

The numerical start position of the new region.

length

The numerical length of the new region.

name

The `string` value to assign the new region.

loopMode

A number representing the region's loop mode. Defaults to `project.regionLoopMode.Looping` if `loopMode` is `undefined`. The loop mode can be set by passing in a valid `loopMode` argument, as described by the [Project.regionLoopMode](scripting-api-reference-project.html#projectregionloopmode) enum.

Returns the newly created region's [ManagedObject](scripting-api-reference-project-managedobject.html#managedobject).

## [MarkerTrack.addSustainPoint](#markertrackaddsustainpoint)

Adds a [sustain point](glossary.html#sustain-point) to the track at the given position.

```javascript
MarkerTrack.addSustainPoint(
    position
)
```

position

The numerical position to place the new sustain point at.

Returns the `SustainPoint` [ManagedObject](scripting-api-reference-project-managedobject.html#managedobject).

## [MarkerTrack.addTransitionMarker](#markertrackaddtransitionmarker)

Adds a [transition marker](glossary.html#transition-marker) to the track at the given position.

```javascript
MarkerTrack.addTransitionMarker(
    position,
    destination
)
```

position

The numerical position to place the new transition marker at.

destination

A [ManagedObject](scripting-api-reference-project-managedobject.html#managedobject) of type `NamedMarker` or `LoopRegion`.

Returns the newly created `TransitionMarker` [ManagedObject](scripting-api-reference-project-managedobject.html#managedobject).

## [MarkerTrack.addTransitionRegion](#markertrackaddtransitionregion)

Adds a [transition region](glossary.html#transition-region) to the track at the given position with the given length.

```javascript
MarkerTrack.addTransitionRegion(
    position,
    length,
    destination
)
```

position

The numerical position to place the new transition region at.

length

The numerical length of the new transition region.

destination

Either a `NamedMarker` or a `LoopRegion`.

Returns the `TransitionRegion` [ManagedObject](scripting-api-reference-project-managedobject.html#managedobject).
