# Scripting API Reference | UI

FMOD Studio User Manual 2.03.12

## Module: UI

The `studio.ui` module allows you to create user interfaces.

### ui.showModalDialog(description)

Displays a dialog window. The function returns once the dialog has been closed.

See `ui.showModelessDialog(description)` for further information about the widget `description` argument.

### ui.showModelessDialog(description)

Displays a dialog window. The function returns once the dialog is shown.

The layout of the dialog is based on a widget `description` object, which contains the following attributes:

- `widgetType`: A `studio.ui.widgetType`. Required.
- `widgetId`: A `string` used to reference this widget. Immutable.
- `isVisible`: A `Boolean` which sets widget visibility.
- `isEnabled`: A `Boolean` which sets whether a widget is interactive.
- `minimumWidth`: The minimum width in pixels for a widget (`number`).
- `minimumHeight`: The minimum height in pixels for a widget (`number`).
- `sizePolicy`: A `studio.ui.sizePolicy`.
- `onConstructed`: A `Function` called after the widget is constructed.
- `onTimerEvent(timerId)`: A callback `Function` called periodically after calling `startTimer()` on a widget.

**Root widget description (dialog):**
- `windowTitle`: A `string` for the window title.
- `windowWidth`: Width of the window (`number`).
- `windowHeight`: Height of the window (`number`).
- `onClose`: A `Function` called as the widget is destroyed.

**Applicable to `widgetType.Layout`:**
- `layout`: A `studio.ui.layoutType`. Required.
- `items`: An `Array` of widget descriptions to nest in this layout.
- `contentsMargins`: An object `{ left, top, right, bottom }` (numbers).
- `spacing`: Spacing between items in pixels (`number`).

**Items in HBoxLayout or VBoxLayout:**
- `stretchFactor`: How much space an item consumes relative to siblings (`number`). Immutable.
- `alignment`: A `studio.ui.alignment`. Immutable.

**Items in GridLayout:**
- `row`: Row index in grid (`number`). Immutable.
- `column`: Column index in grid (`number`). Immutable.
- `rowSpan`: Number of rows to span. Immutable.
- `columnSpan`: Number of columns to span. Immutable.
- `alignment`: A `studio.ui.alignment`. Immutable.

**widgetType.Label:**
- `text`: A `string`.
- `wordWrap`: A `boolean`.

**widgetType.PushButton:**
- `text`: A `string`.
- `onClicked`: A callback `Function`.

**widgetType.LineEdit:**
- `text`: A `string`.
- `isReadOnly`: A `bool`.
- `echoMode`: A `studio.ui.echoMode`.
- `onTextEdited`: A callback `Function`.
- `onEditingFinished`: A callback `Function`.

**widgetType.TextEdit:**
- `text`: Plain text `string`. Alternatively, use `html` attribute for HTML formatted text.
- `html`: HTML formatted `string` (used instead of `text`).
- `isReadOnly`: A `boolean`.

**widgetType.ComboBox:**
- `items`: Array of objects `{ text, userData }`. Write-only.
- `currentIndex`: A `number`.
- `currentText`: A `string`. Read-only.
- `currentUserData`: Read-only.
- `onCurrentIndexChanged`: A callback `Function`.

**widgetType.CheckBox:**
- `text`: A `string`.
- `isChecked`: A `boolean`.
- `onToggled`: A callback `Function`.

**widgetType.Slider:**
- `orientation`: A `studio.ui.orientation`.
- `value`: A `number`.
- `range`: An object `{ minimum, maximum }`.
- `onValueChanged`: A callback `Function`.

**widgetType.SpinBox:**
- `value`: A `number`.
- `range`: An object `{ minimum, maximum }`.
- `onValueChanged`: A callback `Function`.

**widgetType.PathLineEdit:**
- `text`: A `string`.
- `label`: A `string`. Immutable.
- `caption`: A `string`. Immutable.
- `pathType`: A `studio.ui.pathType`. Immutable.
- `onEditingFinished`: A callback `Function`.

**Widget callbacks:** Called with `this` set to the corresponding widget. Use getter/setter (e.g. `widget.setVisible()`) to modify attributes dynamically. Immutable attributes have no setter.

**Additional callback member functions:**
- `findWidget(widgetId)`: Returns a sibling widget with matching widgetId.
- `closeDialog()`: Closes the parent window.
- `startTimer(intervalInMs)`: Starts a timer, returns a timerId.
- `stopTimer(timerId)`: Stops a timer.

### ui.widgetType

Widget types for UI descriptions:
- `Spacer` — A blank widget.
- `Layout` — A container widget. Must specify a layout type.
- `Label` — A text label.
- `PushButton` — A clickable button.
- `LineEdit` — A single-line text entry widget.
- `TextEdit` — A multi-line text entry widget. Supports plain text and HTML.
- `ComboBox` — A drop down.
- `CheckBox` — A boolean check box with a text label.
- `Slider` — A slider with an integer range.
- `SpinBox` — A number box with an integer range.
- `PathLineEdit` — A convenience widget with text entry and "Browse" button for file/directory paths.

### ui.layoutType

Layout types for `widgetType.Layout`:
- `HBoxLayout` — Horizontal layout. Items spaced evenly unless `stretchFactor` specified.
- `VBoxLayout` — Vertical layout. Items spaced evenly unless `stretchFactor` specified.
- `GridLayout` — Grid layout. Items can specify `row`, `column`, `rowSpan`, `columnSpan`.

### ui.alignment

Alignment within a layout widget:
- `AlignLeft`, `AlignRight`, `AlignHCenter`, `AlignJustify`, `AlignAbsolute`
- `AlignTop`, `AlignBottom`, `AlignVCenter`, `AlignBaseline`
- `AlignCenter`

### ui.sizePolicy

Size policy for widgets, determining space consumption. Specify separate horizontal and vertical policies:

```js
sizePolicy: {
    horizontalPolicy: studio.ui.sizePolicy.Fixed,
    verticalPolicy: studio.ui.sizePolicy.Fixed
}
```

Values:
- `Fixed` — Cannot grow or shrink.
- `Minimum` — Can expand but not shrink below minimumWidth/Height.
- `Maximum` — Can shrink but not expand beyond maximumWidth/Height.
- `Preferred` — Can be expanded or shrunk, but no advantage being larger than minimum.
- `MinimumExpanding` — Should get as much space as possible, with preferred minimum.
- `Expanding` — Should get as much space as possible.
- `Ignored` — Gets as much space as possible.

### ui.orientation

- `Horizontal`
- `Vertical`

### ui.echoMode

Echo mode for `LineEdit` widgets:
- `Normal`
- `NoEcho`
- `Password`
- `PasswordEchoOnEdit`

### ui.pathType

Path types for `PathLineEdit`:
- `OpenFile` — Select an existing file.
- `SaveFile` — Specify a new file name.
- `Directory` — Select an existing directory.
