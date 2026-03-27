# Scripting API Reference | Project.Workspace

FMOD Studio User Manual 2.03.12

The root workspace ManagedObject of the project.

## workspace.addEvent

Adds an event with the given name to the project.

```js
workspace.addEvent(name, withSpatializer)
```

- **name** The `string` value to assign the new event.
- **withSpatializer** A `bool` value determining whether to add an FMOD spatializer to the new event's master track.

Returns the event's ManagedObject.

The `withSpatializer` argument should be `true` if a spatializer on the master track is desired and `false` otherwise.

## workspace.addGameParameter

Adds a parameter to the project.

```js
workspace.addGameParameter(parameterDefinition)
```

- **parameterDefinition** The object describing the parameter to add.

Returns the parameter ManagedObject.

The properties of the `parameterDefinition` object match those of the object given as an argument to the `Event.addGameParameter` function.

## workspace.addTag

Adds a tag with the given name to the project.

```js
workspace.addTag(name)
```

- **name** Name of tag to add.

Returns the tag ManagedObject.

If the tag already exists in the project, the existing tag is returned instead.

## workspace.createPlugin

Creates either a plug-in effect or a plug-in instrument.

```js
workspace.createPlugin(identifier)
```

- **identifier** The plug-in to use. Must match the name of an `FMOD_DSP_DESCRIPTION`.

Returns the plug-in effect or plug-in instrument ManagedObject.
