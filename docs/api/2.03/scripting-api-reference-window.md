# Scripting API Reference | Window

FMOD Studio User Manual 2.03.12

## Module: Window

The `studio.window` module allows for interaction with the window context.

### window.open(windowType)

Opens a new window of the given window type (e.g. "Event Editor").

Returns `true` if the window request is valid, or `false` otherwise.

### window.navigateTo(managedObject)

Attempts to navigate to a ManagedObject in the UI. Will open a new window if required. Returns `true` if successful.

### window.browserCurrent([tabName])

Returns the currently selected ManagedObject in the active browser tab of the last active window. A `tabName` can optionally be specified to select from a different browser tab.

### window.browserSelection([tabName])

Returns an `Array` of selected ManagedObjects in the active browser tab of the last active window. A `tabName` can optionally be specified.

### window.editorCurrent()

Returns the currently selected ManagedObject in the last active editor (e.g. in the multitrack view).

### window.editorSelection()

Returns an array of selected ManagedObjects in the last active editor.

### window.deckCurrent()

Returns the currently selected ManagedObject in the deck of the last active window.

### window.deckSelection()

Returns an array of selected ManagedObjects in the deck of the last active window.

### window.actions

An enumeration used with `window.triggerAction()`. Values include:
- `AddTransitionTimeline`, `BringToFront`, `Build`, `BuildAllPlatforms`
- `ClearRecentFiles`, `CloseProject`, `CloseTab`, `ContinuousZoomToFit`
- `Copy`, `CopyGuid`, `CopyPath`
- `DecreaseDefaultTrackHeight`, `Delete`, `Duplicate`
- `ExitApplication`, `ExportGuids`, `Find`
- `FlattenBrowserFolders`, `FollowPlaybackPosition`
- `ImportAudioFiles`, `IncreaseDefaultTrackHeight`
- `LoopPlayback`, `MergeConflictingAsset`, `MoveTo`, `MoveToCursor`
- `NewBrowserFolder`, `NewBrowserItem`, `NewMixerGroup`, `NewMixerReturn`
- `NewParameter`, `NewProject`, `NewTab`
- `OpenInExternal`, `OpenInFileSystem`, `OpenInNewWindow`
- `OpenMostRecentFile`, `OpenProject`, `PackageProject`
- `Paste`, `Redo`, `RefreshModifiedAssets`
- `RemoveTransitionTimeline`, `Rename`, `RevertToSaved`
- `SandboxToggleEmitter_01` through `SandboxToggleEmitter_10`
- `Save`, `SaveAs`, `ScriptReload`, `SendToBack`
- `ShowAbout`, `ShowAutomationValues`, `ShowCompactStrips`, `ShowFMODio`
- `ShowLogicTracks`, `ShowMarkerLines`, `ShowOverlappingInstrumentsInLanes`
- `ShowPreferences`, `ShowQuestionsPage`, `ShowQuickStartTutorial`
- `ShowSupportEmail`, `ShowUserManual`, `ShowWelcome`
- `SnapToItems`, `SnapToRuler`
- `SourceControlBrowseForProject`, `SourceControlCommit`
- `SourceControlIdentifyLocalChanges`, `SourceControlRevert`, `SourceControlSync`
- `Split`, `ToggleBulkEdit`, `ToggleConnectToGame`, `ToggleFilePlayback`
- `ToggleTransitionTimelineVisibility`, `Undo`, `ValidateProject`
- `ViewBrowser`, `ViewDeck`, `ViewProperties`
- `WindowBringAllToFront`, `WindowClose`, `WindowCycle`
- `WindowMaximize`, `WindowMinimize`
- `ZoomIn`, `ZoomOut`, `ZoomToFit`

### window.triggerAction(actionType)

Attempts to trigger the `actionType` action for the last active window.
