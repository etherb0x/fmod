---
title: "Scripting API Reference | Project.Model.Automator"
source: "FMOD 2.02 Studio Scripting API"
downloaded: "2026-02-24"
---

# 26\. Scripting API Reference | Project.Model.Automator

**Types:**

-   [model.Automator](scripting-api-reference-project-model-automator.html#modelautomator "A binding between a model.AutomatableObject's properties and one or more model.AutomationCurves.") A binding between a `model.AutomatableObject`'s properties and one or more `model.AutomationCurve`s.

**Extension Methods:**

-   [Automator.addAutomationCurve](scripting-api-reference-project-model-automator.html#automatoraddautomationcurve "Creates a model.AutomationCurve on the parameter specified.") Creates a `model.AutomationCurve` on the parameter specified.

## [model.Automator](#modelautomator)

A binding between a [model.AutomatableObject](scripting-api-reference-project-model-automatableobject.html#modelautomatableobject)'s properties and one or more [model.AutomationCurve](scripting-api-reference-project-model-automationcurve.html#modelautomationcurve)s.

## [Automator.addAutomationCurve](#automatoraddautomationcurve)

Creates a [model.AutomationCurve](scripting-api-reference-project-model-automationcurve.html#modelautomationcurve) on the parameter specified.

```javascript
Automator.addAutomationCurve(
    parameter
)
```

parameter

Either a [model.GameParameter](scripting-api-reference-project-model-parameter.html#modelgameparameter) or the [model.Timeline](scripting-api-reference-project-model-parameter.html#modeltimeline) of the event containing the object being automated.

Returns the automation curve [ManagedObject](scripting-api-reference-project-managedobject.html#managedobject).

Example:

```javascript
// adds an automation curve to a master track's volume, on the timeline
var event = studio.project.workspace.addEvent("New Event", true);
var mixerGroup = event.masterTrack.mixerGroup;
var automator = mixerGroup.addAutomator("volume");
var automationCurve = automator.addAutomationCurve(event.timeline);

// adds an automation curve to a gain effect, on a parameter
var gainEffect = mixerGroup.effectChain.addEffect("GainEffect");
var automator = gainEffect.addAutomator("gain");
var rpmParameter = studio.project.lookup("parameter:/RPM");
var automationCurve = automator.addAutomationCurve(rpmParameter.parameter);
```

**See Also:** [Automation](https://fmod.com/docs/2.02/studio/glossary.html#automation)
