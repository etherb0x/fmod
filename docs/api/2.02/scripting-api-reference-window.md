---
title: "FMOD - Scripting API Reference | Window"
source: "FMOD 2.02 Studio Scripting API"
downloaded: "2026-02-24"
---

# 26\. Scripting API Reference | Window

## [Module: Window](#module-window)

The `studio.window` module allows for interaction with the window context.

### [window.open(windowType)](#windowopenwindowtype)

Opens a new window of the given window type (e.g. "Event Editor").

Returns `true` if the window request is valid, or `false` otherwise.

### [window.navigateTo(managedObject)](#windownavigatetomanagedobject)

Attempts to navigate to a [ManagedObject](scripting-api-reference-project-managedobject.html#managedobject) in the UI. Will open a new window if required. Returns `true` if successful.

### [window.browserCurrent([tabName])](#windowbrowsercurrenttabname)

Returns the currently selected [ManagedObject](scripting-api-reference-project-managedobject.html#managedobject) in the active browser tab of the last active window. A `tabName` can optionally be specified to select from a different browser tab.

### [window.browserSelection([tabName])](#windowbrowserselectiontabname)

Returns an `Array` of selected [ManagedObject](scripting-api-reference-project-managedobject.html#managedobject)s in the active browser tab of the last active window. A `tabName` can optionally be specified to select from a different browser tab.

### [window.editorCurrent()](#windoweditorcurrent)

Returns the currently selected [ManagedObject](scripting-api-reference-project-managedobject.html#managedobject) in the last active editor (e.g. in the multitrack view).

### [window.editorSelection()](#windoweditorselection)

Returns an array of selected [ManagedObject](scripting-api-reference-project-managedobject.html#managedobject)s in the last active editor (e.g. in the multitrack view).

### [window.deckCurrent()](#windowdeckcurrent)

Returns the currently selected [ManagedObject](scripting-api-reference-project-managedobject.html#managedobject) in the deck of the last active window.

### [window.deckSelection()](#windowdeckselection)

Returns an array of selected [ManagedObject](scripting-api-reference-project-managedobject.html#managedobject)s in the deck of the last active window.

### [window.actions](#windowactions)

An enumeration used with [studio.window.triggerAction()](#windowtriggeractionactiontype) to trigger the execution of an action. Possible values are:

-   `AddTransitionTimeline`
-   `BringToFront`
-   `Build`
-   `BuildAllPlatforms`
-   `ClearRecentFiles`
-   `CloseProject`
-   `CloseTab`
-   `ContinuousZoomToFit`
-   `Copy`
-   `CopyGuid`
-   `CopyPath`
-   `DecreaseDefaultTrackHeight`
-   `Delete`
-   `Duplicate`
-   `ExitApplication`
-   `ExportGuids`
-   `Find`
-   `FlattenBrowserFolders`
-   `FollowPlaybackPosition`
-   `ImportAudioFiles`
-   `IncreaseDefaultTrackHeight`
-   `LoopPlayback`
-   `MergeConflictingAsset`
-   `MoveTo`
-   `MoveToCursor`
-   `NewBrowserFolder`
-   `NewBrowserItem`
-   `NewMixerGroup`
-   `NewMixerReturn`
-   `NewParameter`
-   `NewProject`
-   `NewTab`
-   `OpenInExternal`
-   `OpenInFileSystem`
-   `OpenInNewWindow`
-   `OpenMostRecentFile`
-   `OpenProject`
-   `PackageProject`
-   `Paste`
-   `Redo`
-   `RefreshModifiedAssets`
-   `RemoveTransitionTimeline`
-   `Rename`
-   `RevertToSaved`
-   `SandboxToggleEmitter_01`
-   `SandboxToggleEmitter_02`
-   `SandboxToggleEmitter_03`
-   `SandboxToggleEmitter_04`
-   `SandboxToggleEmitter_05`
-   `SandboxToggleEmitter_06`
-   `SandboxToggleEmitter_07`
-   `SandboxToggleEmitter_08`
-   `SandboxToggleEmitter_09`
-   `SandboxToggleEmitter_10`
-   `Save`
-   `SaveAs`
-   `ScriptReload`
-   `SendToBack`
-   `ShowAbout`
-   `ShowAutomationValues`
-   `ShowCompactStrips`
-   `ShowFMODio`
-   `ShowLogicTracks`
-   `ShowMarkerLines`
-   `ShowOverlappingInstrumentsInLanes`
-   `ShowPreferences`
-   `ShowQuestionsPage`
-   `ShowQuickStartTutorial`
-   `ShowSupportEmail`
-   `ShowUserManual`
-   `ShowWelcome`
-   `SnapToItems`
-   `SnapToRuler`
-   `SourceControlBrowseForProject`
-   `SourceControlCommit`
-   `SourceControlIdentifyLocalChanges`
-   `SourceControlRevert`
-   `SourceControlSync`
-   `Split`
-   `ToggleBulkEdit`
-   `ToggleConnectToGame`
-   `ToggleFilePlayback`
-   `ToggleTransitionTimelineVisibility`
-   `Undo`
-   `ValidateProject`
-   `ViewBrowser`
-   `ViewDeck`
-   `ViewProperties`
-   `WindowBringAllToFront`
-   `WindowClose`
-   `WindowCycle`
-   `WindowMaximize`
-   `WindowMinimize`
-   `ZoomIn`
-   `ZoomOut`
-   `ZoomToFit`

### [window.triggerAction(actionType)](#windowtriggeractionactiontype)

Attempts to trigger the `actionType` action for the last active window. The available options are described by the [window.actions](#windowactions) enum.
