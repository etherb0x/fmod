# Scripting API Reference | Project.Model.AutomationCurve

FMOD Studio User Manual 2.03.12

## Types

- **model.AutomationCurve** — Maps automation values across an associated `model.Parameter`.

## Extension Methods

- **AutomationCurve.addAutomationPoint** — Creates an automation point at the given position.

---

## model.AutomationCurve

Maps automation values across an associated `model.Parameter`.

---

## AutomationCurve.addAutomationPoint

Creates an automation point at the given position.

```js
AutomationCurve.addAutomationPoint(
    position,
    value
)
```

**Parameters:**

- **position** — The timeline position to place the automation point. Must be within the range of the curve's parameter.
- **value** — The value to assign the automation point. Must be within the value range of the automated property.

**Returns:** The automation point `ManagedObject`.

**See Also:** [Automation Curves](https://fmod.com/docs/2.03/studio/parameters.html#automation-curves)
