---
title: "Scripting API Reference | Project.Model.AutomationCurve"
source: "FMOD 2.02 Studio Scripting API"
downloaded: "2026-02-24"
---

# 26\. Scripting API Reference | Project.Model.AutomationCurve

**Types:**

-   [model.AutomationCurve](scripting-api-reference-project-model-automationcurve.html#modelautomationcurve "Maps automation values across an associated model.Parameter.") Maps automation values across an associated `model.Parameter`.

**Extension Methods:**

-   [AutomationCurve.addAutomationPoint](scripting-api-reference-project-model-automationcurve.html#automationcurveaddautomationpoint "Creates an automation point at the given position.") Creates an automation point at the given position.

## [model.AutomationCurve](#modelautomationcurve)

Maps automation values across an associated [model.Parameter](scripting-api-reference-project-model-parameter.html#modelparameter).

## [AutomationCurve.addAutomationPoint](#automationcurveaddautomationpoint)

Creates an automation point at the given position.

```javascript
AutomationCurve.addAutomationPoint(
    position,
    value
)
```

position

The timeline position to place the automation point. Must be within the range of the curve's parameter.

value

The value to assign the automation point. Must be within the value range of the automated property.

Returns the automation point [ManagedObject](scripting-api-reference-project-managedobject.html#managedobject).

**See Also:** [Automation Curves](https://fmod.com/docs/2.02/studio/parameters.html#automation-curves), Automation Point
