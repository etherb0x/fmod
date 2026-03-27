---
title: "Scripting API Reference | Project.Model"
source: "FMOD 2.02 Studio Scripting API"
downloaded: "2026-02-24"
---

# 26\. Scripting API Reference | Project.Model

The project model type representation applicable for this version.
The `studio.project.model` provides access to information about the available model types. Data within the model is represented as a collection of [project.Entity](scripting-api-reference-project-entity.html) types upon which [ManagedObject](scripting-api-reference-project-managedobject.html#managedobject)s are based. You can look entities up by name. For example:

```javascript
studio.project.model.Event.findInstances(); // find all Event instances
```

## [model.document](#modeldocument)

Returns a `string` describing every [project.Entity](scripting-api-reference-project-entity.html).

```javascript
model.document()
```

## [model.%entity\_name%](#modelentity_name)

The following are common entities used for scripting. More enity types can be accessed through `model.%entity_name%`.

-   [project.model.asset](scripting-api-reference-project-model-asset.html)
-   [project.model.automatableobject](scripting-api-reference-project-model-automatableobject.html)
-   [project.model.automationcurve](scripting-api-reference-project-model-automationcurve.html)
-   [project.model.automator](scripting-api-reference-project-model-automator.html)
-   [project.model.bank](scripting-api-reference-project-model-bank.html)
-   [project.model.event](scripting-api-reference-project-model-event.html)
-   [project.model.folder](scripting-api-reference-project-model-folder.html)
-   [project.model.mixereffect](scripting-api-reference-project-model-mixereffect.html)
-   [project.model.mixerstrip](scripting-api-reference-project-model-mixerstrip.html)
-   [project.model.modulator](scripting-api-reference-project-model-modulator.html)
-   [project.model.parameter](scripting-api-reference-project-model-parameter.html)
-   [project.model.sound](scripting-api-reference-project-model-sound.html)
-   [project.model.track](scripting-api-reference-project-model-track.html)
-   [project.model.triggerable](scripting-api-reference-project-model-triggerable.html)
