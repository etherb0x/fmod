# Scripting API Reference | Project.Model.Event

FMOD Studio User Manual 2.03.12

## Types

### model.Event
An arrangement of instruments that can be played by the game.

### model.Snapshot
An instanceable unit of changes to the project mix.

## Extension Methods

### Event.addGameParameter(parameterDefinition)
Adds a game parameter to the event. `parameterDefinition` can be a model.ParameterPreset, model.GameParameter, or a parameterDefinition object. Returns the game parameter ManagedObject.

### Event.addGroupTrack(name)
Adds an audio track with the given name. Returns the newly created model.GroupTrack.

### Event.addMarkerTrack()
Adds a marker track to the event. Returns the newly created model.MarkerTrack.

### Event.addReturnTrack(name)
Adds a return track with the given name. Returns the newly created return track ManagedObject.

### Event.get3DAttributes()
Retrieves the 3D attributes of an event. Returns an object:
- `radialDistance`: Distance from the listener (number)
- `azimuth`: Angle of event in relation to listener (number)
- `height`: Vertical position of the event (number)
- `rotation`: The horizontal rotation of the event (number)

### Event.getCursorPosition(parameter)
Retrieves the cursor position. `parameter` must be the event's model.Timeline or one of its model.GameParameters. Returns the position as a number.

### Event.getParameterPresets()
Returns an array of all model.GameParameter objects that the event references. Includes both parameters with and without parameter sheets. Order matches the transport bar display.

### Event.getPath()
Returns the event's unique path identifier as a string.

### Event.getPlayheadPosition(parameter)
Returns the playback position of a model.Parameter as a number.

### Event.is3D()
Returns `true` if an event is 3D. An event is 3D if it has a Spatializer/3D Object Spatializer, contains a built-in parameter, or contains/references other 3D events. Can be slow on many events.

### Event.isOneShot()
Returns `true` if an event is guaranteed to terminate without intervention in bounded time after being started. Can be slow on many events.

### Event.isPaused()
Returns `true` if an event instance is paused.

### Event.isPlaying()
Returns `true` if an event instance is playing.

### Event.isRecording()
Returns `true` for profiler sessions with recording enabled.

### Event.isStopping()
Returns `true` if an event instance is stopping. Ignores the paused event state.

### Event.keyOff()
Sends the keyoff command to a currently playing event instance.

### Event.play()
Plays the event instance. Equivalent of pressing the play button in transport controls.

### Event.returnToStart()
Moves playback position to cursor position if playing/stopping/paused, or to start of timeline while stopped. Only affects timeline playback position.

### Event.set3DAttributes(attributes)
Sets the 3D attributes of an event instance being auditioned. See `Event.get3DAttributes` for the attributes object format.

### Event.setCursorPosition(parameter, position)
Sets the cursor position to a number. `parameter` is a model.Timeline or model.GameParameter.

### Event.stopImmediate()
Stops an event instance immediately, skipping the stopping state.

### Event.stopNonImmediate()
Commands a playing event instance to enter the stopping state.

### Event.togglePause()
Toggles the pause state of an event instance. Equivalent of pressing the pause button.

### Event.toggleRecording()
Toggles the recording state for a profiler session.
