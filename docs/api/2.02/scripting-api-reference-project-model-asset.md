---
title: "Scripting API Reference | Project.Model.Asset"
source: "FMOD 2.02 Studio Scripting API"
downloaded: "2026-02-24"
---

# 26\. Scripting API Reference | Project.Model.Asset

**Types:**

-   [model.Asset](scripting-api-reference-project-model-asset.html#modelasset "The base class representation for a file asset's metadata.") The base class representation for a file asset's metadata.
-   [model.AudioFile](scripting-api-reference-project-model-asset.html#modelaudiofile "An audio file asset containing sound data.") An audio file asset containing sound data.

**Extension Methods:**

-   [Asset.getAbsoluteAssetPath](scripting-api-reference-project-model-asset.html#assetgetabsoluteassetpath "Retrieves the absolute path of the file the asset refers to.") Retrieves the absolute path of the file the asset refers to.
-   [Asset.getAssetPath](scripting-api-reference-project-model-asset.html#assetgetassetpath "Retrieves the path of the file the asset refers to, relative to the project assets directory.") Retrieves the path of the file the asset refers to, relative to the project assets directory.
-   [Asset.setAssetPath](scripting-api-reference-project-model-asset.html#assetsetassetpath "Sets the path of the file the asset refers to, relative to the project assets directory.") Sets the path of the file the asset refers to, relative to the project assets directory.

## [model.Asset](#modelasset)

The base class representation for a file asset's metadata.

## [model.AudioFile](#modelaudiofile)

An audio file asset containing sound data.

**See Also:** [Audio File](https://fmod.com/docs/2.02/studio/glossary.html#audio-file), [studio.project.importAudioFile](https://fmod.com/docs/2.02/studio/scripting-api-reference-project.html#projectimportaudiofilefilepath).

## [Asset.getAbsoluteAssetPath](#assetgetabsoluteassetpath)

Retrieves the absolute path of the file the asset refers to.

```javascript
Asset.getAbsoluteAssetPath()
```

Returns the absolute path of the file the asset refers to.

**See Also:** [Managing Assets](https://fmod.com/docs/2.02/studio/managing-assets.html)

## [Asset.getAssetPath](#assetgetassetpath)

Retrieves the path of the file the asset refers to, relative to the project assets directory.

```javascript
Asset.getAssetPath()
```

Returns the path of the file the asset refers to, relative to the project assets directory.

## [Asset.setAssetPath](#assetsetassetpath)

Sets the path of the file the asset refers to, relative to the project assets directory.

```javascript
Asset.setAssetPath(
    filePath
)
```

filePath

The path to move the asset to.

Returns `true` if the operation succeeds, or `false` otherwise.
Calling this function will move the underlying file asset on disk.
