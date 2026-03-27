---
title: "FMOD - Scripting API Reference | Project.Model.Triggerable"
source: "FMOD 2.02 Studio Scripting API"
downloaded: "2026-02-24"
---

# 26\. Scripting API Reference | Project.Model.Triggerable

**Types:**

-   [model.Triggerable](scripting-api-reference-project-model-triggerable.html#modeltriggerable "The base class for entities that can be triggered.") The base class for entities that can be triggered.

**Extension Methods:**

-   [Triggerable.addParameterCondition](scripting-api-reference-project-model-triggerable.html#triggerableaddparametercondition "Adds a parameter condition for a given parameter to a triggerable object.") Adds a [parameter condition](glossary.html#parameter-condition) for a given [parameter](glossary.html#parameter) to a triggerable object.

## [model.Triggerable](#modeltriggerable)

The base class for entities that can be triggered.

**See Also:** [Trigger](glossary.html#trigger)

## [Triggerable.addParameterCondition](#triggerableaddparametercondition)

Adds a [parameter condition](glossary.html#parameter-condition) for a given [parameter](glossary.html#parameter) to a triggerable object.

```javascript
Triggerable.addParameterCondition(
    parameter,
    min,
    max
)
```

parameter

Can be either a [model.ParameterPreset](scripting-api-reference-project-model-parameter.html#modelparameterpreset) or a [model.GameParameter](scripting-api-reference-project-model-parameter.html#modelgameparameter).

min

The minimum value of the parameter condition.

max

The maximum value of the parameter condition.

Returns the parameter condition [ManagedObject](scripting-api-reference-project-managedobject.html#managedobject).

The range of the parameter condition is specified using the `min` and `max`. If `max` is `undefined`, the maximum of the parameter condition is set to `min`. For a [labeled parameter](glossary.html#labeled-user-parameter), the `max` argument is ignored.

Example:

```javascript
var continuousCondition = loopRegion.addParameterCondition(studio.project.lookup("parameter:/Distance Parameter"), 0, 1000);
var labeledCondition = singleSound.addParameterCondition(studio.project.lookup("parameter:/Current Country"), "Australia");
labeledCondition = transitionMarker.addParameterCondition(studio.project.lookup("parameter:/Current Country"), "Australia");
labeledCondition = transitionRegion.addParameterCondition(studio.project.lookup("parameter:/Current Country"), "Australia");
```

**See Also:** [Trigger](https://fmod.com/docs/2.02/studio/glossary.html#trigger), [Parameter Condition](glossary.html#parameter-condition), [ManagedObject](scripting-api-reference-project-managedobject.html#managedobject)
