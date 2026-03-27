---
title: "Scripting API Reference | Project"
source: "FMOD 2.02 Studio Scripting API"
downloaded: "2026-02-24"
---

# 26\. Scripting API Reference | Project

The `studio.project` module provides access to objects within the project model.

**Methods:**

-   [project.build](scripting-api-reference-project.html#projectbuild "Builds all the banks to all the platforms listed in the build tab of the preferences dialog.") Builds all the banks to all the platforms listed in the build tab of the preferences dialog.
-   [project.create](scripting-api-reference-project.html#projectcreate "Returns a new instance of a ManagedObject of the given entity name.") Returns a new instance of a `ManagedObject` of the given entity name.
-   [project.deleteObject](scripting-api-reference-project.html#projectdeleteobject "Deletes the ManagedObject and its references, if any, from the project.") Deletes the `ManagedObject` and its references, if any, from the project.
-   [project.exportGUIDs](scripting-api-reference-project.html#projectexportguids "Exports project \"guids.txt\".") Exports project "guids.txt".
-   [project.findAvailablePlugins](scripting-api-reference-project.html#projectfindavailableplugins "Returns an array of strings that lists all available plugins.") Returns an array of strings that lists all available plugins.
-   [project.importAudioFile](scripting-api-reference-project.html#projectimportaudiofile "Imports an audio asset into the project.") Imports an audio asset into the project.
-   [project.lookup](scripting-api-reference-project.html#projectlookup "Lookup a ManagedObject by path or GUID.") Lookup a `ManagedObject` by path or GUID.
-   [project.save](scripting-api-reference-project.html#projectsave "Saves the project.") Saves the project.

**Callbacks:**

-   [project.audioFileImported](scripting-api-reference-project.html#projectaudiofileimported "Callback triggered when an audio file has finished being imported.") Callback triggered when an audio file has finished being imported.
-   [project.buildEnded](scripting-api-reference-project.html#projectbuildended "A callback that will be fired when a build has completed.") A callback that will be fired when a build has completed.
-   [project.buildStarted](scripting-api-reference-project.html#projectbuildstarted "A callback that will be fired when a build has commenced.") A callback that will be fired when a build has commenced.

**Properties:**

-   [project.filepath](scripting-api-reference-project.html#projectfilepath "The absolute path to the project's \".fspro` file on disk.") The absolute path to the project's ".fspro\` file on disk.

**Types:**

-   [project.distanceRolloffType](scripting-api-reference-project.html#projectdistancerollofftype "An enum corresponding to different distance attenuation roll-off types available to spatial effects.") An enum corresponding to different distance attenuation roll-off types available to spatial effects.
-   [project.parameterType](scripting-api-reference-project.html#projectparametertype "An enum corresponding to different model.Parameter types available.") An enum corresponding to different `model.Parameter` types available.
-   [project.regionLoopMode](scripting-api-reference-project.html#projectregionloopmode "An enum corresponding to different loop modes of a loop region.") An enum corresponding to different loop modes of a loop region.
-   [parameterDefinition](scripting-api-reference-project.html#parameterdefinition "Describes a model.Parameter.") Describes a `model.Parameter`.

## [project.build](#projectbuild)

Builds all the banks to all the platforms listed in the build tab of the preferences dialog.

```javascript
project.build();

project.build(
    build_options
)
```

build\_options

Builds the project with options object `{ banks, platforms }`.

Returns `true` if the operation succeeds, or `false` otherwise. Building individual banks also builds and updates your project's [master banks](glossary.html#master-bank) and master bank strings files.

Example:

```javascript
// Single banks
    studio.project.build({ banks: 'Weapons' }); // Build the "Weapons" bank to all platforms
    studio.project.build({ banks: 'Music', platforms: ['Desktop', 'PlayStation 4'] }); // Build the "Music" bank for only the "Desktop" and "PlayStation 4" platforms

// Multiple banks
    studio.project.build({ banks: ['Weapons', 'Characters'], platforms: 'Desktop' }); // Build the "Weapons" and "Characters" banks only for the "Desktop" platform
    studio.project.build({ banks: ['Weapons', 'Music'], platforms: ['Desktop', 'PlayStation 4'] }); // Build the "Weapons" and "Music" banks to the "Desktop" and "PlayStation 4" platforms

// Platforms
    studio.project.build({ platforms: 'Desktop' }); // Builds all banks for the "Desktop" platform
    studio.project.build({ platforms: ['Desktop', 'PlayStation 4'] }); // Builds all banks for the "Desktop" and "PlayStation 4" platforms
```

## [project.create](#projectcreate)

Returns a new instance of a [ManagedObject](scripting-api-reference-project-managedobject.html#managedobject) of the given entity name.

```javascript
project.create(
    entityName
)
```

entityName

The name of the entity to create.

This will create any required child objects for the object (e.g. creating an `Event` will create and attach its `EventMixer`).

## [project.deleteObject](#projectdeleteobject)

Deletes the [ManagedObject](scripting-api-reference-project-managedobject.html#managedobject) and its references, if any, from the project.

```javascript
project.deleteObject(
    managedObject
)
```

managedObject

The managed object to delete.

Returns `true` if the operation succeeds, or `false` otherwise.
This is the equivalent to deleting an item in the user interface.

## [project.exportGUIDs](#projectexportguids)

Exports project "guids.txt".

```javascript
project.exportGUIDs()
```

Returns `true` if the operation succeeds, or `false` otherwise.

## [project.findAvailablePlugins](#projectfindavailableplugins)

Returns an array of strings that lists all available plugins.

```javascript
project.findAvailablePlugins()
```

## [project.importAudioFile](#projectimportaudiofile)

Imports an audio asset into the project.

```javascript
project.importAudioFile(
    filePath
)
```

filePath

The absolute path to the file's location.

Returns an [model.AudioFile](scripting-api-reference-project-model-asset.html#modelaudiofile), [ManagedObject](scripting-api-reference-project-managedobject.html#managedobject), or `null` if importing failed. The file is always imported into the root audio bin folder. Use the `AudioFile.container` relationship to reassign it to another folder.

## [project.lookup](#projectlookup)

Lookup a [ManagedObject](scripting-api-reference-project-managedobject.html#managedobject) by path or GUID.

```javascript
project.lookup(
    idOrPath
)
```

idOrPath

GUID or path of the ManageObject.

Returns a [ManagedObject](scripting-api-reference-project-managedobject.html#managedobject) found by GUID or path.

Example:

```javascript
var item = project.lookup("{3a731ab3-ce6d-453d-862e-32050cecf68a}");
var event = project.lookup("event:/path/to/eventname");
var eventFolder = project.lookup("event:/path/to/foldername");
var bank = project.lookup("bank:/path/to/bank");
var snapshot = project.lookup("snapshot:/snapshotname");
var vca = project.lookup("vca:/vcaname");
```

Paths are formatted using the pattern `type:/path/to/item`, where `type` is one of:

-   `event`
-   `snapshot`
-   `bank`
-   `bus`
-   `vca`
-   `asset`
-   `parameter`
-   `effect`
-   `tag`
-   `profilersession`

Paths can also be used to find container items, such as finding a folder in the event hierarchy.

## [project.save](#projectsave)

Saves the project.

```javascript
project.save()
```

Returns `true` if the operation succeeds, or `false` otherwise.

## [project.audioFileImported](#projectaudiofileimported)

Callback triggered when an audio file has finished being imported.

## [project.audioFileImported.connect](#projectaudiofileimportedconnect)

Sets a function to be called when an audio file is imported, with the signature `function(audioFile)`.

```javascript
project.audioFileImported.connect(
    callback
)
```

callback

A callback function that will be called when an audio file import has completed.

## [project.audioFileImported.disconnect](#projectaudiofileimporteddisconnect)

Disconnects the `connectFunction` once it is no longer needed. It is important to disconnect the connected signals when they are no longer needed, otherwise they can accumulate and cause unexpected behavior.

```javascript
project.audioFileImported.disconnect(
    connectFunction
)
```

connectionFunction

The callback to unsubscribe from audio file imported notification.

## [project.buildEnded](#projectbuildended)

A callback that will be fired when a build has completed.

## [project.buildEnded.connect](#projectbuildendedconnect)

Sets a function to be called after banks are built, with the signature `function(success)`. The `success` argument will be `false` if a build error occurs or the build is cancelled by the user, and `true` otherwise. For example:

```javascript
project.buildEnded.connect(callback)
```

callback

A callback function that will be called when the build has ended.

Example:

```javascript
studio.project.buildEnded.connect(function(success) {
    alert(success ? "Build has ended well" : "Build has ended badly");
});
```

## [project.buildEnded.disconnect](#projectbuildendeddisconnect)

Disconnects the `connectFunction` once it is no longer needed. It is important to disconnect the connected signals when they are no longer needed, otherwise they can accumulate and cause unexpected behavior.

connectionFunction

The callback to unsubscribe from build ended notification.

Example:

```javascript
function connectToBuildEnd() {
    alert("Build about to end");
}

studio.project.buildEnded.connect(connectToBuildEnd);

studio.project.buildEnded.disconnect(connectToBuildEnd);
```

## [project.buildStarted](#projectbuildstarted)

A callback that will be fired when a build has commenced.

## [project.buildStarted.connect](#projectbuildstartedconnect)

Sets a function to be called before banks are built, with the signature `function()`. For example:

```javascript
project.buildStarted.connect(
    callback
)
```

callback

A callback function that will be called when the build has started.

Example:

```javascript
studio.project.buildStarted.connect(function() {
    alert("Build about to start");
});
```

## [project.buildStarted.disconnect](#projectbuildstarteddisconnect)

Disconnects the `connectFunction` once it is no longer needed. It is important to disconnect the connected signals when they are no longer needed, otherwise they can accumulate and cause unexpected behavior.

```javascript
project.buildStarted.disconnect(
    connectFunction
)
```

connectionFunction

The callback to unsubscribe from build started notification.

Example:

```javascript
function connectToBuildStart() {
    alert("Build about to start");
};

studio.project.buildStarted.connect(connectToBuildStart);

studio.project.buildStarted.disconnect(connectToBuildStart);
```

## [project.filePath](#projectfilepath)

The absolute path to the project's ".fspro\` file on disk.

## [project.distanceRolloffType](#projectdistancerollofftype)

An enum corresponding to different distance attenuation roll-off types available to spatial effects.

```javascript
distanceRolloffType: {
    LinearSquared: 0,
    Linear: 1,
    Inverse: 2,
    InverseTapered: 3,
    Custom: 4,
}
```

## [project.parameterType](#projectparametertype)

An enum corresponding to different [model.Parameter](scripting-api-reference-project-model-parameter.html#modelparameter) types available.

```javascript
parameterType: {
    Invalid: -1,
    User: 0,
    UserDiscrete: 1,
    UserEnumeration: 2,
    Distance: 3,
    Direction: 4,
    Elevation: 5,
    EventConeAngle: 6,
    EventOrientation: 7,
    Speed: 8,
    SpeedAbsolute: 9,
    DistanceNormalized: 10
}
```

## [project.regionLoopMode](#projectregionloopmode)

An enum corresponding to different loop modes of a loop region.

```javascript
regionLoopMode: {
    None: 0,
    Looping: 1,
    Magnet: 2
}
```

## [parameterDefinition](#parameterdefinition)

Describes a [model.Parameter](scripting-api-reference-project-model-parameter.html#modelparameter).

```javascript
    name: [string],
    type: [number],
    min: [number],
    max: [number],
    enumerationLabels: [array]
```

name

The name of the parameter.

type

The [project.parameterType](scripting-api-reference-project.html#projectparametertype) of the parameter.

min

The minimum value of the parameter range.

max

The maximum value of the parameter range.

enumerationLabels

A string array of labels to apply to each index of the parameter. (Type UserEnumeration only).

**See Also:** [Event.addGameParamater](https://fmod.com/docs/2.02/studio/scripting-api-reference-project-model-event.html#eventaddgameparameter), [workspace.addGameParameter](https://fmod.com/docs/2.02/studio/scripting-api-reference-project-workspace.html#workspaceaddgameparameter)
