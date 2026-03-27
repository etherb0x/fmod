# Scripting API Reference | Project.Model

FMOD Studio User Manual 2.03.12

The project model type representation applicable for this version. The `studio.project.model` provides access to information about the available model types. Data within the model is represented as a collection of project.Entity types upon which ManagedObjects are based. You can look entities up by name.

Example:

```js
studio.project.model.Event.findInstances(); // find all Event instances
```

## model.document

Returns a `string` describing every project.Entity.

```js
model.document()
```

## model.%entity_name%

The following are common entities used for scripting. More entity types can be accessed through `model.%entity_name%`.

- [project.model.Asset](scripting-api-reference-project-model-asset.md)
- [project.model.AutomatableObject](scripting-api-reference-project-model-automatableobject.md)
- [project.model.AutomationCurve](scripting-api-reference-project-model-automationcurve.md)
- [project.model.Automator](scripting-api-reference-project-model-automator.md)
- [project.model.Bank](scripting-api-reference-project-model-bank.md)
- [project.model.Event](scripting-api-reference-project-model-event.md)
- [project.model.Folder](scripting-api-reference-project-model-folder.md)
- [project.model.MixerEffect](scripting-api-reference-project-model-mixereffect.md)
- [project.model.MixerStrip](scripting-api-reference-project-model-mixerstrip.md)
- [project.model.Modulator](scripting-api-reference-project-model-modulator.md)
- [project.model.Parameter](scripting-api-reference-project-model-parameter.md)
- [project.model.Sound](scripting-api-reference-project-model-sound.md)
- [project.model.Track](scripting-api-reference-project-model-track.md)
- [project.model.Triggerable](scripting-api-reference-project-model-triggerable.md)
