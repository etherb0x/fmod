---
title: "Scripting API Reference | Project.Model.Folder"
source: "FMOD 2.02 Studio Scripting API"
downloaded: "2026-02-24"
---

# 26\. Scripting API Reference | Project.Model.Folder

**Types:**

-   [model.Folder](scripting-api-reference-project-model-folder.html#modelfolder "The base class for an item container visible in browsers.") The base class for an item container visible in browsers.
-   [model.MasterAssetFolder](scripting-api-reference-project-model-folder.html#modelmasterassetfolder "The root folder of a folder-structure containing assets.") The root folder of a folder-structure containing assets.

**Extension Methods:**

-   [Folder.getItem](scripting-api-reference-project-model-folder.html#foldergetitem "Retrieves the item at the relative path specified.") Retrieves the item at the relative path specified.
-   [MasterAssetFolder.getAsset](scripting-api-reference-project-model-folder.html#masterassetfoldergetasset "Retrieves the asset at the path specified.") Retrieves the [asset](glossary.html#audio-file) at the path specified.

## [model.Folder](#modelfolder)

The base class for an item container visible in browsers.

## [model.MasterAssetFolder](#modelmasterassetfolder)

The root folder of a folder-structure containing assets.

**See Also:** [model.Asset](scripting-api-reference-project-model-asset.html#modelasset)

## [Folder.getItem](#foldergetitem)

Retrieves the item at the relative path specified.

```javascript
Folder.getItem(
    path
)
```

path

Relative path of the item to retrieve.

Returns the item at the relative `path` specified. Returns `undefined` if the item cannot be found.

Example:

```javascript
var event = studio.project.workspace.masterEventFolder.getItem("sfx/explosion_event");
```

**See Also:** [Folders](https://fmod.com/docs/2.02/studio/managing-assets.html#folders)

## [MasterAssetFolder.getAsset](#masterassetfoldergetasset)

Retrieves the [asset](glossary.html#audio-file) at the path specified.

```javascript
MasterAssetFolder.getAsset(
    path
)
```

path

Relative path of the asset to retrieve.

Returns the [model.Asset](scripting-api-reference-project-model-asset.html#modelasset) at the relative path specified. Returns `undefined` if the item cannot be found.

Example:

```javascript
studio.project.workspace.masterAssetFolder.getAsset("music/level_01.wav");
```

**See Also:** [The Assets Folder](https://fmod.com/docs/2.02/studio/advanced-topics.html#the-assets-folder)
