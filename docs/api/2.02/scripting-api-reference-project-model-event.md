---
title: "Scripting API Reference | Project.Model.Event"
source: "FMOD 2.02 Studio Scripting API"
downloaded: "2026-02-24"
---

# 26\. Scripting API Reference | Project.Model.Event

**Types:**

-   [model.Event](scripting-api-reference-project-model-event.html#modelevent "An arrangement of instruments that can be played by the game.") An arrangement of [instruments](glossary.html#instrument) that can be played by the game.
-   [model.Snapshot](scripting-api-reference-project-model-event.html#modelsnapshot "An instanceable unit of changes to the project mix.") An instanceable unit of changes to the project mix.

**Extension Methods:**

-   [Event.addGameParameter](scripting-api-reference-project-model-event.html#eventaddgameparameter "Adds a game parameter to the event.") Adds a [game parameter](glossary.html#parameter) to the event.
-   [Event.addGroupTrack](scripting-api-reference-project-model-event.html#eventaddgrouptrack "Adds an audio track with the given name to the event.") Adds an [audio track](glossary.html#audio-track) with the given name to the event.
-   [Event.addMarkerTrack](scripting-api-reference-project-model-event.html#eventaddmarkertrack "Adds a marker track to the event.") Adds a marker track to the event.
-   [Event.addReturnTrack](scripting-api-reference-project-model-event.html#eventaddreturntrack "Adds a return track with the given name to the event.") Adds a [return track](glossary.html#return-track) with the given name to the event.
-   [Event.get3DAttributes](scripting-api-reference-project-model-event.html#eventget3dattributes "Retrieves the 3D attributes of an event.") Retrieves the 3D attributes of an event.
-   [Event.getCursorPosition](scripting-api-reference-project-model-event.html#eventgetcursorposition "Retrieves the cursor position.") Retrieves the [cursor](glossary.html#cursor) position.
-   [Event.getParameterPresets](scripting-api-reference-project-model-event.html#eventgetparameterpresets "Retrieves an array of preset parameters referenced by the event.") Retrieves an array of [preset parameters](glossary.html#preset-parameter) referenced by the [event](glossary.html#event).
-   [Event.getPath](scripting-api-reference-project-model-event.html#eventgetpath "Retrieves the event's unique path identifier.") Retrieves the [event](glossary.html#event)'s unique path identifier.
-   [Event.getPlayheadPosition](scripting-api-reference-project-model-event.html#eventgetplayheadposition "Retrieves the playback position of a given parameter.") Retrieves the [playback position](glossary.html#playback-position) of a given [parameter](glossary.html#parameter).
-   [Event.is3D](scripting-api-reference-project-model-event.html#eventis3d "Reports whether an event is 3D.") Reports whether an [event](glossary.html#event) is [3D](glossary.html#3d-event).
-   [Event.isOneShot](scripting-api-reference-project-model-event.html#eventisoneshot "Reports whether an event is a one-shot.") Reports whether an [event](glossary.html#event) is a one-shot.
-   [Event.isPaused](scripting-api-reference-project-model-event.html#eventispaused "Reports whether an event instance is paused.") Reports whether an [event instance](glossary.html#event-instance) is paused.
-   [Event.isPlaying](scripting-api-reference-project-model-event.html#eventisplaying "Reports whether an event instance is playing.") Reports whether an [event instance](glossary.html#event-instance) is playing.
-   [Event.isRecording](scripting-api-reference-project-model-event.html#eventisrecording "Reports whether an event instance is being recorded in a profiler session.") Reports whether an [event instance](glossary.html#event-instance) is being recorded in a profiler session.
-   [Event.isStopping](scripting-api-reference-project-model-event.html#eventisstopping "Reports whether an event instance is stopping.") Reports whether an [event instance](glossary.html#event-instance) is stopping.
-   [Event.keyOff](scripting-api-reference-project-model-event.html#eventkeyoff "Sends the keyoff command to a currently playing event instance.") Sends the keyoff command to a currently playing [event instance](glossary.html#event-instance).
-   [Event.returnToStart](scripting-api-reference-project-model-event.html#eventreturntostart "Moves the playback position to the cursor position if called while the event instance is playing, stopping, or paused, or to the start of the timeline while the event instance is stopped.") Moves the [playback position](glossary.html#playback-position) to the [cursor position](glossary.html#cursor) if called while the [event instance](glossary.html#event-instance) is playing, stopping, or paused, or to the start of the [timeline](glossary.html#timeline) while the event instance is stopped.
-   [Event.set3DAttributes](scripting-api-reference-project-model-event.html#eventset3dattributes "Sets the 3D attributes of an event instance being auditioned based on a 3D attributes object.") Sets the [3D attributes](%api%core-api-common.html#fmod_3d_attributes) of an [event instance](glossary.html#event-instance) being [auditioned](glossary.html#audition) based on a 3D attributes object.
-   [Event.setCursorPosition](scripting-api-reference-project-model-event.html#eventsetcursorposition "Sets the cursor position to a number.") Sets the [cursor](glossary.html#cursor) position to a number.
-   [Event.stopImmediate](scripting-api-reference-project-model-event.html#eventstopimmediate "Stops an event instance immediately, skipping the stopping event state.") Stops an [event instance](glossary.html#event-instance) immediately, skipping the stopping [event state](glossary.html#event-state).
-   [Event.stopNonImmediate](scripting-api-reference-project-model-event.html#eventstopnonimmediate "Commands a playing event instance to enter the stopping event state.") Commands a playing [event instance](glossary.html#event-instance) to enter the stopping [event state](glossary.html#event-state).
-   [Event.togglePause](scripting-api-reference-project-model-event.html#eventtogglepause "Toggles the pause state of an event instance.") Toggles the pause [state](glossary.html#event-state) of an [event instance](glossary.html#event-instance).
-   [Event.toggleRecording](scripting-api-reference-project-model-event.html#eventtogglerecording "Toggles the recording state for a profiler session.") Toggles the recording state for a profiler session.

## [model.Event](#modelevent)

An arrangement of [instruments](glossary.html#instrument) that can be played by the game.

**See Also:** [Event](https://fmod.com/docs/2.02/studio/glossary.html#event)

## [model.Snapshot](#modelsnapshot)

An instanceable unit of changes to the project mix.

**See Also:** [Snapshots and the Tracks VIew](https://fmod.com/docs/2.02/studio/mixing.html#snapshots-and-the-tracks-view)

## [Event.addGameParameter](#eventaddgameparameter)

Adds a [game parameter](glossary.html#parameter) to the event.

```javascript
Event.addGameParameter(
    parameterDefinition
)
```

parameterDefinition

Either a [model.ParameterPreset](scripting-api-reference-project-model-parameter.html#modelparameterpreset), a [model.GameParameter](scripting-api-reference-project-model-parameter.html#modelgameparameter), or a [parameterDefinition](scripting-api-reference-project.html#parameterdefinition) object.

Returns the game parameter [ManagedObject](scripting-api-reference-project-managedobject.html#managedobject).

## [Event.addGroupTrack](#eventaddgrouptrack)

Adds an [audio track](glossary.html#audio-track) with the given name to the event.

```javascript
Event.addGroupTrack(
    name
)
```

name

The `string` value to assign the audio track when it is created.

Returns the newly created [model.GroupTrack](scripting-api-reference-project-model-track.html#modelgrouptrack).

## [Event.addMarkerTrack()](#eventaddmarkertrack)

Adds a marker track to the event.

```javascript
Event.addMarkerTrack()
```

Returns the newly created [model.MarkerTrack](scripting-api-reference-project-model-track.html#modelmarkertrack).

**See Also:** [Event](https://fmod.com/docs/2.02/studio/fmod-studio-concepts.html#event)

## [Event.addReturnTrack](#eventaddreturntrack)

Adds a [return track](glossary.html#return-track) with the given name to the event.

```javascript
Event.addReturnTrack(
    name
)
```

name

The `string` value to assign the return track when it is created.

Returns the newly created return track [ManagedObject](scripting-api-reference-project-managedobject.html#managedobject).

## [Event.get3DAttributes](#eventget3dattributes)

Retrieves the 3D attributes of an event.

```javascript
Event.get3DAttributes()
```

Returns an object representing the currently auditioned 3D attributes of the event instance:

-   `radialDistance`: Distance from the listener (`number`)
-   `azimuth`: Angle of event in relation to listener (`number`)
-   `height`: Vertical position of the event (`number`)
-   `rotation`: The horizontal rotation of the event (`number`)

## [Event.getCursorPosition](#eventgetcursorposition)

Retrieves the [cursor](glossary.html#cursor) position.

```javascript
Event.getCursorPosition(
    parameter
)
```

parameter

The [parameter](glossary.html#parameter) to get to cursor postion of. Must be the [event](glossary.html#event)'s [model.Timeline](scripting-api-reference-project-model-parameter.html#modeltimeline) or one of the event's [model.GameParameter](scripting-api-reference-project-model-parameter.html#modelgameparameter)s.

Returns the cursor position as a `number`.

## [Event.getParameterPresets](#eventgetparameterpresets)

Retrieves an array of [preset parameters](glossary.html#preset-parameter) referenced by the [event](glossary.html#event).

```javascript
Event.getParameterPresets()
```

Returns an array of all [model.GameParameter](scripting-api-reference-project-model-parameter.html#modelgameparameter) objects that the event has a corresponding [model.ParameterProxy](scripting-api-reference-project-model-parameter.html#modelparameterproxy) for. This includes both preset parameters that have a [parameter sheet](glossary.html#parameter-sheet) and those that do not. The order of the array matches the order displayed in the transport bar.

## [Event.getPath](#eventgetpath)

Retrieves the [event](glossary.html#event)'s unique path identifier.

```javascript
Event.getPath()
```

Returns the event's [path](https://fmod.com/docs/2.02/studio/advanced-topics.html#paths) as a `string`.

## [Event.getPlayheadPosition](#eventgetplayheadposition)

Retrieves the [playback position](glossary.html#playback-position) of a given [parameter](glossary.html#parameter).

```javascript
Event.getPlayheadPosition(
    parameter
)
```

parameter

The [model.Timeline](scripting-api-reference-project-model-parameter.html#modeltimeline) or [model.GameParameter](scripting-api-reference-project-model-parameter.html#modelgameparameter) to retrieve the playback position of.

Returns the playback position of a [model.Parameter](scripting-api-reference-project-model-parameter.html#modelparameter) as a `number`.

## [Event.is3D](#eventis3d)

Reports whether an [event](glossary.html#event) is [3D](glossary.html#3d-event).

```javascript
Event.is3D()
```

Returns `true` if an event is 3D. An event is considered 3D if any of these conditions are met:
\- The event has a Spatializer, 3D Object Spatializer, or a 3rd party spatializer.
\- The event contains a [built-in](parameters-reference.html#built-in-parameters) parameter.
\- The event contains or references any other events which are 3D.

This function performs calculations that require the event be fully loaded into memory. This can be slow if triggered on a large number of events.

**See Also:** [Spatializer Effect](glossary.html#spatializer-effect)

## [Event.isOneShot](#eventisoneshot)

Reports whether an [event](glossary.html#event) is a one-shot.

```javascript
Event.isOneShot()
```

Returns `true` if an event is one-shot. An event is considered one-shot if it is guaranteed to terminate without intervention in bounded time after being started.

This function performs calculations that require the event be fully loaded into memory. This can be slow if triggered on a large number of events.

## [Event.isPaused](#eventispaused)

Reports whether an [event instance](glossary.html#event-instance) is paused.

```javascript
Event.isPaused()
```

Returns `true` if an event instance is paused.

**See Also:** [Event State](https://fmod.com/docs/2.02/studio/advanced-topics.html#event-state)

## [Event.isPlaying](#eventisplaying)

Reports whether an [event instance](glossary.html#event-instance) is playing.

```javascript
Event.isPlaying()
```

Returns `true` if an event instance is playing.

**See Also:** [Event State](https://fmod.com/docs/2.02/studio/advanced-topics.html#event-state)

## [Event.isRecording](#eventisrecording)

Reports whether an [event instance](glossary.html#event-instance) is being recorded in a profiler session.

```javascript
Event.isRecording()
```

Returns `true` for profiler sessions with recording enabled.

Profiler sessions are event instances that record realtime data from the [FMOD Studio system](https://fmod.com/docs/2.02/api/studio-api-system.html), [buses](glossary.html#bus), and event instances for profiling purposes.

## [Event.isStopping](#eventisstopping)

Reports whether an [event instance](glossary.html#event-instance) is stopping.

```javascript
Event.isStopping()
```

Returns `true` if an event instance is stopping.

This call ignores the paused [event state](https://fmod.com/docs/2.02/studio/advanced-topics.html#event-state).

## [Event.keyOff](#eventkeyoff)

Sends the keyoff command to a currently playing [event instance](glossary.html#event-instance).

```javascript
Event.keyOff()
```

If a [sustain point](glossary.html#sustain-point) exists ahead of the [playback position](glossary.html#playback-position) this triggers the event instance's [keyoff](fmod-studio-concepts.html#key-off-commands) behavior.

## [Event.returnToStart](#eventreturntostart)

Moves the [playback position](glossary.html#playback-position) to the [cursor position](glossary.html#cursor) if called while the [event instance](glossary.html#event-instance) is playing, stopping, or paused, or to the start of the [timeline](glossary.html#timeline) while the event instance is stopped.

```javascript
Event.returnToStart()
```

Only the timeline playback position is affected by this particular function; the playback positions of other parameters are unaffected.

**See Also:** [Event State](https://fmod.com/docs/2.02/studio/advanced-topics.html#event-state), [Cursor](glossary.html#cursor)

## [Event.set3DAttributes](#eventset3dattributes)

Sets the [3D attributes](https://fmod.com/docs/2.02/api/core-api-common.html#fmod_3d_attributes) of an [event instance](glossary.html#event-instance) being [auditioned](glossary.html#audition) based on a 3D attributes object.

```javascript
Event.set3DAttributes(
    attributes
)
```

attributes

Object describing the 3D attributes to give to the event.

See [Event.get3DAttributes](scripting-api-reference-project-model-event.html#eventget3dattributes) for more information on the properties required for the `attributes` object.

## [Event.setCursorPosition](#eventsetcursorposition)

Sets the [cursor](glossary.html#cursor) position to a number.

```javascript
Event.setCursorPosition(
    parameter,
    position
)
```

parameter

The parameter to set the cursor postion of. Either a [model.Timeline](scripting-api-reference-project-model-parameter.html#modeltimeline) or a [model.GameParameter](scripting-api-reference-project-model-parameter.html#modelgameparameter).

position

The numerical value to set the cursor postion to.

## [Event.stopImmediate](#eventstopimmediate)

Stops an [event instance](glossary.html#event-instance) immediately, skipping the stopping [event state](glossary.html#event-state).

```javascript
Event.stopImmediate()
```

**See Also:** [Event State](https://fmod.com/docs/2.02/studio/advanced-topics.html#event-state)

## [Event.stopNonImmediate()](#eventstopnonimmediate)

Commands a playing [event instance](glossary.html#event-instance) to enter the stopping [event state](glossary.html#event-state).

```javascript
Event.stopNonImmediate()
```

**See Also:** [Event State](https://fmod.com/docs/2.02/studio/advanced-topics.html#event-state)

## [Event.togglePause](#eventtogglepause)

Toggles the pause [state](glossary.html#event-state) of an [event instance](glossary.html#event-instance).

```javascript
Event.togglePause()
```

The equivalent of pressing the pause button in the transport controls.

**See Also:** [Event State](https://fmod.com/docs/2.02/studio/advanced-topics.html#event-state)

## [Event.toggleRecording](#eventtogglerecording)

Toggles the recording state for a profiler session.

```javascript
Event.toggleRecording()
```

## [Event.play](#eventplay)

Plays the [event instance](glossary.html#event-instance).

```javascript
Event.play()
```

The equivalent of pressing the play button in the [transport controls](glossary.html#transport-controls).

**See Also:** [Event State](https://fmod.com/docs/2.02/studio/advanced-topics.html#event-state)
