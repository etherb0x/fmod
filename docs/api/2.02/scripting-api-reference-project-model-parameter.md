---
title: "FMOD - Scripting API Reference | Project.Model.Parameter"
source: "FMOD 2.02 Studio Scripting API"
downloaded: "2026-02-24"
---

# 26\. Scripting API Reference | Project.Model.Parameter

**Types:**

-   [model.ActionSheet](scripting-api-reference-project-model-parameter.html#modelactionsheet "A sheet for an model.Event that plays through a playlist of instruments.") A sheet for an `model.Event` that plays through a playlist of instruments.
-   [model.GameParameter](scripting-api-reference-project-model-parameter.html#modelgameparameter "A built-in parameter or user parameter of a model.Event, whose input value is specified by the game.") A built-in [parameter](glossary.html#parameter) or user parameter of a `model.Event`, whose input value is specified by the game.
-   [model.Parameter](scripting-api-reference-project-model-parameter.html#modelparameter "The base class for a parameter sheet upon which instruments can be placed, within an model.Event.") The base class for a [parameter sheet](glossary.html#parameter-sheet) upon which [instruments](glossary.html#instrument) can be placed, within an `model.Event`.
-   [model.ParameterPreset](scripting-api-reference-project-model-parameter.html#modelparameterpreset "An object representing a preset parameter.") An object representing a [preset parameter](glossary.html#preset-parameter).
-   [model.ParameterProxy](scripting-api-reference-project-model-parameter.html#modelparameterproxy "An object containing a reference to a model.ParameterPreset.") An object containing a reference to a `model.ParameterPreset`.
-   [model.Timeline](scripting-api-reference-project-model-parameter.html#modeltimeline "A parameter sheet of a model.Event that automatically increases its value over time.") A [parameter sheet](glossary.html#parameter-sheet) of a `model.Event` that automatically increases its value over time.

**Extension Methods:**

-   [GameParameter.getCursorPosition](scripting-api-reference-project-model-parameter.html#gameparametergetcursorposition "Retrieves the parameter's cursor position.") Retrieves the [parameter](glossary.html#parameter)'s [cursor](glossary.html#cursor) position.
-   [GameParameter.setCursorPosition](scripting-api-reference-project-model-parameter.html#gameparametersetcursorposition "Sets the cursor position of the global, user, or built-in parameter to a number.") Sets the [cursor](glossary.html#cursor) position of the [global](glossary.html#global-parameter), [user](glossary.html#user-parameter), or [built-in](glossary.html#built-in-parameter) parameter to a number.
-   [Parameter.getPlayheadPosition](scripting-api-reference-project-model-parameter.html#parametergetplayheadposition "Retrieves the playback position of a parameter, within the context of the associated model.Event.") Retrieves the [playback position](glossary.html#playback-position) of a parameter, within the context of the associated `model.Event`.
-   [ParameterPreset.getPath](scripting-api-reference-project-model-parameter.html#parameterpresetgetpath "Retrieves the preset parameter's unique path identifier.") Retrieves the preset parameter's unique path identifier.
-   [ParameterProxy.getCursorPosition](scripting-api-reference-project-model-parameter.html#parameterproxygetcursorposition "Retrieves the preset parameter's cursor position.") Retrieves the [preset parameter](glossary.html#preset-parameter)'s [cursor](glossary.html#cursor) position.
-   [ParameterProxy.setCursorPosition](scripting-api-reference-project-model-parameter.html#parameterproxysetcursorposition "Sets the cursor position of the preset parameter to a number.") Sets the [cursor](glossary.html#cursor) position of the [preset parameter](glossary.html#preset-parameter) to a number.
-   [Timeline.getCursorPosition](scripting-api-reference-project-model-parameter.html#timelinegetcursorposition "Retrieves the timeline's cursor position.") Retrieves the [timeline](glossary.html#timeline)'s [cursor](glossary.html#cursor) position.
-   [Timeline.setCursorPosition](scripting-api-reference-project-model-parameter.html#timelinesetcursorposition "Sets the cursor position of the timeline to a number.") Sets the [cursor](glossary.html#cursor) position of the [timeline](glossary.html#timeline) to a number.

## [model.ActionSheet](#modelactionsheet)

A sheet for an [model.Event](scripting-api-reference-project-model-event.html#modelevent) that plays through a playlist of instruments.

**See Also:** [Action Sheet](https://fmod.com/docs/2.02/studio/glossary.html#action-sheet)

## [model.GameParameter](#modelgameparameter)

A built-in [parameter](glossary.html#parameter) or user parameter of a [model.Event](scripting-api-reference-project-model-event.html#modelevent), whose input value is specified by the game.

**See Also:** [Built-in parameters](parameters-reference.html#built-in-parameters), [User parameters](parameters-reference.html#user-parameters)

## [model.Parameter](#modelparameter)

The base class for a [parameter sheet](glossary.html#parameter-sheet) upon which [instruments](glossary.html#instrument) can be placed, within an [model.Event](scripting-api-reference-project-model-event.html#modelevent).

**See Also:** [Parameters Reference](parameters-reference.html)

## [model.ParameterPreset](#modelparameterpreset)

An object representing a [preset parameter](glossary.html#preset-parameter).

**See Also:** [Parameter](https://fmod.com/docs/2.02/studio/parameters.html)

## [model.ParameterProxy](#modelparameterproxy)

An object containing a reference to a [model.ParameterPreset](scripting-api-reference-project-model-parameter.html#modelparameterpreset).

## [model.Timeline](#modeltimeline)

A [parameter sheet](glossary.html#parameter-sheet) of a [model.Event](scripting-api-reference-project-model-event.html#modelevent) that automatically increases its value over time.

**See Also:** [Timeline](https://fmod.com/docs/2.02/studio/glossary.html#timeline)

## [GameParameter.getCursorPosition](#gameparametergetcursorposition)

Retrieves the [parameter](glossary.html#parameter)'s [cursor](glossary.html#cursor) position.

```javascript
GameParameter.getCursorPosition()
```

Returns the cursor position of the global [user parameter](glossary.html#user-parameter) as a `number`. Returns `undefined` if the scope of the game parameter is not global.

Example:

```javascript
var globalParameterPreset = studio.project.lookup("parameter:/game_state/time_of_day"); // return a ParameterPreset object
var timeOfDay = globalParameterPreset.parameter.getCursorPosition();
```

## [GameParameter.setCursorPosition](#gameparametersetcursorposition)

Sets the [cursor](glossary.html#cursor) position of the [global](glossary.html#global-parameter), [user](glossary.html#user-parameter), or [built-in](glossary.html#built-in-parameter) parameter to a number.

```javascript
GameParameter.setCursorPosition(
    position
)
```

position

The numerical position to set the parameter's cursor to.

Example:

```javascript
var globalParameterPreset = studio.project.lookup("parameter:/game_state/time_of_day"); // return a ParameterPreset object
globalParameterPreset.parameter.setCursorPosition(1300);
```

**See Also:** [Game Parameter](https://fmod.com/docs/2.02/studio/glossary.html#game-parameter)

## [Parameter.getPlayheadPosition](#parametergetplayheadposition)

Retrieves the [playback position](glossary.html#playback-position) of a parameter, within the context of the associated [model.Event](scripting-api-reference-project-model-event.html#modelevent).

**See Also:** [Parameter](https://fmod.com/docs/2.02/studio/parameters.html)

## [ParameterPreset.getPath](#parameterpresetgetpath)

Retrieves the preset parameter's unique path identifier.

```javascript
ParameterPreset.getPath()
```

Returns the parameter's [path](https://fmod.com/docs/2.02/studio/advanced-topics.html#paths) as a `string`.

**See Also:** [Parameter](https://fmod.com/docs/2.02/studio/parameters.html)

## [ParameterProxy.getCursorPosition](#parameterproxygetcursorposition)

Retrieves the [preset parameter](glossary.html#preset-parameter)'s [cursor](glossary.html#cursor) position.

```javascript
ParameterProxy.getCursorPosition()
```

Returns the cursor position as a `number`, within the context of the associated [event](glossary.html#event).

This is only meaningful when dealing with [global parameters](glossary.html#global-parameter), since [local preset parameters](glossary.html#local-parameter) do not have meaningful cursor positions.

The equivalent of calling `parameterProxy.event.getCursorPosition(parameterProxy.preset)`.

## [ParameterProxy.setCursorPosition](#parameterproxysetcursorposition)

Sets the [cursor](glossary.html#cursor) position of the [preset parameter](glossary.html#preset-parameter) to a number.

```javascript
ParameterProxy.setCursorPosition(
    position
)
```

position

The numerical position to set the parameter proxy's cursor to.

Sets the cursor position to a `number`, within the context of the associated [event](glossary.html#event).

The equivalent of calling `parameterProxy.event.setCursorPosition(parameterProxy.preset, position)`.

## [Timeline.getCursorPosition()](#timelinegetcursorposition)

Retrieves the [timeline](glossary.html#timeline)'s [cursor](glossary.html#cursor) position.

```javascript
Timeline.getCursorPosition()
```

Returns the cursor position as a `number`, within the context of the associated [event](glossary.html#event).

The equivalent of calling `timeline.event.getCursorPosition(timeline)`.

## [Timeline.setCursorPosition](#timelinesetcursorposition)

Sets the [cursor](glossary.html#cursor) position of the [timeline](glossary.html#timeline) to a number.

```javascript
Timeline.setCursorPosition(
    position
)
```

position

The numerical position to set the timeline to.

Sets the cursor position to a `number`, within the context of the associated [event](glossary.html#event).

The equivalent of calling `timeline.event.setCursorPosition(timeline, position)`.

**See Also:** [Timeline](https://fmod.com/docs/2.02/studio/glossary.html#timeline)
