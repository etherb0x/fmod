# Scripting API Reference | Project.Model.Automator

FMOD Studio User Manual 2.03.12

## Types

- **model.Automator** — A binding between a `model.AutomatableObject`'s properties and one or more `model.AutomationCurve`s.

## Extension Methods

- **Automator.addAutomationCurve** — Creates a `model.AutomationCurve` on the parameter specified.

---

## model.Automator

A binding between a `model.AutomatableObject`'s properties and one or more `model.AutomationCurve`s.

---

## Automator.addAutomationCurve

Creates a `model.AutomationCurve` on the parameter specified.

```js
Automator.addAutomationCurve(
    parameter
)
```

**Parameters:**

- **parameter** — Either a `model.GameParameter` or the `model.Timeline` of the event containing the object being automated.

**Returns:** The automation curve `ManagedObject`.

**Example:**

```js
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

**See Also:** [Automation](https://fmod.com/docs/2.03/studio/glossary.html#automation)
