# Scripting API Reference | Project.Model.Folder

FMOD Studio User Manual 2.03.12

## Types

- **model.Folder** — The base class for an item container visible in browsers.
- **model.MasterAssetFolder** — The root folder of a folder-structure containing assets.

## Extension Methods

- **Folder.getItem** — Retrieves the item at the relative path specified.
- **MasterAssetFolder.getAsset** — Retrieves the asset at the path specified.

---

## model.Folder

The base class for an item container visible in browsers.

---

## model.MasterAssetFolder

The root folder of a folder-structure containing assets.

**See Also:** [model.Asset](https://www.fmod.com/docs/2.03/studio/scripting-api-reference-project-model-asset.html#modelasset)

---

## Folder.getItem

Retrieves the item at the relative path specified.

```js
Folder.getItem(
    path
)
```

**Parameters:**

- **path** — Relative path of the item to retrieve.

**Returns:** The item at the relative `path` specified. Returns `undefined` if the item cannot be found.

**Example:**

```js
var event = studio.project.workspace.masterEventFolder.getItem("sfx/explosion_event");
```

**See Also:** [Folders](https://fmod.com/docs/2.03/studio/managing-assets.html#folders)

---

## MasterAssetFolder.getAsset

Retrieves the asset at the path specified.

```js
MasterAssetFolder.getAsset(
    path
)
```

**Parameters:**

- **path** — Relative path of the asset to retrieve.

**Returns:** The `model.Asset` at the relative path specified. Returns `undefined` if the item cannot be found.

**Example:**

```js
studio.project.workspace.masterAssetFolder.getAsset("music/level_01.wav");
```

**See Also:** [The Assets Folder](https://fmod.com/docs/2.03/studio/advanced-topics.html#the-assets-folder)
