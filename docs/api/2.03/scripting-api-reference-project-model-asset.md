# Scripting API Reference | Project.Model.Asset

FMOD Studio User Manual 2.03.12

## Types

### model.Asset
The base class representation for a file asset's metadata.

### model.AudioFile
An audio file asset containing sound data.

## Extension Methods

### Asset.getAbsoluteAssetPath()
Retrieves the absolute path of the file the asset refers to. Returns the absolute path as a string.

### Asset.getAssetPath()
Retrieves the path of the file the asset refers to, relative to the project assets directory. Returns the relative path as a string.

### Asset.setAssetPath(filePath)
Sets the path of the file the asset refers to, relative to the project assets directory.
- **filePath** The path to move the asset to.
Returns `true` on success. Calling this will move the underlying file asset on disk.
