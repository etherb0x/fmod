---
title: "Scripting API Reference | Project.Workspace"
source: "FMOD 2.02 Studio Scripting API"
downloaded: "2026-02-24"
---

# 26\. Scripting API Reference | Project.Workspace

The root workspace [ManagedObject](scripting-api-reference-project-managedobject.html#managedobject) of the project.

**Methods:**

-   [workspace.addEvent](scripting-api-reference-project-workspace.html#workspaceaddevent "Adds an event with the given name to the project.") Adds an [event](glossary.html#event) with the given name to the project.
-   [workspace.addGameParameter](scripting-api-reference-project-workspace.html#workspaceaddgameparameter "Adds a preset parameter to the project.") Adds a [preset parameter](glossary.html#preset-parameter) to the project.
-   [workspace.addTag](scripting-api-reference-project-workspace.html#workspaceaddtag "Adds a tag with the given name to the project.") Adds a [tag](glossary.html#tag) with the given name to the project.
-   [workspace.createPlugin](scripting-api-reference-project-workspace.html#workspacecreateplugin "Creates either a plug-in effect or a plug-in instrument.") Creates either a plug-in [effect](glossary.html#effect) or a plug-in [instrument](glossary.html#instrument).

## [workspace.addEvent](#workspaceaddevent)

Adds an [event](glossary.html#event) with the given name to the project.

```javascript
workspace.addEvent(
    name,
    withSpatializer
)
```

name

The `string` value to assign the new event.

withSpatializer

A `bool` value determining whether to add an [FMOD spatializer](glossary.html#spatializer-effect) to the new event's [master track](glossary.html#master-track).

Returns the event's [ManagedObject](scripting-api-reference-project-managedobject.html#managedobject).

The `withSpatializer` argument should be `true` if a spatializer on the master track is desired and `false` otherwise.

## [workspace.addGameParameter](#workspaceaddgameparameter)

Adds a [preset parameter](glossary.html#preset-parameter) to the project.

```javascript
workspace.addGameParameter(
    parameterDefinition
)
```

parameterDefinition

The object describing the parameter to add.

Returns the preset parameter [ManagedObject](scripting-api-reference-project-managedobject.html#managedobject).

The properties of the `parameterDefinition` object match those of the object given as an argument to the [Event.addGameParameter](scripting-api-reference-project-model-event.html#eventaddgameparameter) function.

## [workspace.addTag](#workspaceaddtag)

Adds a [tag](glossary.html#tag) with the given name to the project.

```javascript
workspace.addTag(
    name
)
```

name

name of tag to add.

Returns the tag [ManagedObject](scripting-api-reference-project-managedobject.html#managedobject).

If the tag already exists in the project, the existing tag is returned instead.

## [workspace.createPlugin](#workspacecreateplugin)

Creates either a plug-in [effect](glossary.html#effect) or a plug-in [instrument](glossary.html#instrument).

```javascript
workspace.createPlugin(
    identfier
)
```

identifier

The plug-in to use for the creation. This must match the name of an [FMOD\_DSP\_DESCRIPTION](https://fmod.com/docs/2.02/api/plugin-api-dsp.html#fmod_dsp_description).

Returns the plug-in effect or plug-in instrument [ManagedObject](scripting-api-reference-project-managedobject.html#managedobject).
