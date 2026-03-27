---
title: "Scripting API Reference | Project.Model.MixerStrip"
source: "FMOD 2.02 Studio Scripting API"
downloaded: "2026-02-24"
---

# 26\. Scripting API Reference | Project.Model.MixerStrip

**Types:**

-   [model.EventMixerGroup](scripting-api-reference-project-model-mixerstrip.html#modeleventmixergroup "An audio track within a model.Event.") An [audio track](glossary.html#audio-track) within a `model.Event`.
-   [model.EventMixerMaster](scripting-api-reference-project-model-mixerstrip.html#modeleventmixermaster "The master track of an model.Event.") The [master track](glossary.html#master-bus) of an `model.Event`.
-   [model.EventMixerReturn](scripting-api-reference-project-model-mixerstrip.html#modeleventmixerreturn "A return track that can receive signals from within the event.") A [return track](glossary.html#return-bus) that can receive [signals](glossary.html#signal) from within the [event](glossary.html#event).
-   [model.MixerBus](scripting-api-reference-project-model-mixerstrip.html#modelmixerbus "The base class for routable buses.") The base class for routable [buses](glossary.html#bus).
-   [model.MixerGroup](scripting-api-reference-project-model-mixerstrip.html#modelmixergroup "A model.MixerBus that accepts the outputs of other mixer buses as inputs.") A `model.MixerBus` that accepts the outputs of other mixer [buses](glossary.html#bus) as inputs.
-   [model.MixerInput](scripting-api-reference-project-model-mixerstrip.html#modelmixerinput "A model.MixerBus that allows output from a model.Event to enter the project-level mixer.") A `model.MixerBus` that allows output from a `model.Event` to enter the project-level [mixer](glossary.html#mixer).
-   [model.MixerMaster](scripting-api-reference-project-model-mixerstrip.html#modelmixermaster "The final output bus in the mixer.") The final output [bus](glossary.html#bus) in the [mixer](glossary.html#mixer).
-   [model.MixerPort](scripting-api-reference-project-model-mixerstrip.html#modelmixerport "An output to an external audio port.") An output to an external audio port.
-   [model.MixerReturn](scripting-api-reference-project-model-mixerstrip.html#modelmixerreturn "A return bus that can receive a signal from a model.MixerSend.") A [return bus](glossary.html#return-bus) that can receive a [signal](glossary.html#signal) from a `model.MixerSend`.
-   [model.MixerStrip](scripting-api-reference-project-model-mixerstrip.html#modelmixerstrip "The base class for elements represented as a strip.") The base class for elements represented as a strip.
-   [model.MixerVCA](scripting-api-reference-project-model-mixerstrip.html#modelmixervca "A model.MixerStrip that scales the volume of any other mixer strips assigned to it.") A `model.MixerStrip` that scales the volume of any other [mixer strips](glossary.html#mixer-strip) assigned to it.

**Extension Methods:**

-   [MixerBus.getInputFormat](scripting-api-reference-project-model-mixerstrip.html#mixerbusgetinputformat "Retrieves the input format of the bus.") Retrieves the input format of the [bus](glossary.html#bus).
-   [MixerBus.getOutputFormat](scripting-api-reference-project-model-mixerstrip.html#mixerbusgetoutputformat "Retrieves the output format of the bus.") Retrieves the output format of the [bus](glossary.html#bus).
-   [MixerStrip.getPath](scripting-api-reference-project-model-mixerstrip.html#mixerstripgetpath "Retrieves the mixer strip's unique path identifier.") Retrieves the [mixer strip's](glossary.html#mixer-strip) unique path identifier.

## [model.EventMixerGroup](#modeleventmixergroup)

An [audio track](glossary.html#audio-track) within a [model.Event](scripting-api-reference-project-model-event.html#modelevent).

## [model.EventMixerMaster](#modeleventmixermaster)

The [master track](glossary.html#master-bus) of an [model.Event](scripting-api-reference-project-model-event.html#modelevent).

## [model.EventMixerReturn](#modeleventmixerreturn)

A [return track](glossary.html#return-bus) that can receive [signals](glossary.html#signal) from within the [event](glossary.html#event).

**See Also:** [Sends and Return Buses](https://fmod.com/docs/2.02/studio/mixing.html#sends-and-return-buses), [Return](https://fmod.com/docs/2.02/api/effects-reference.html#return)

## [model.MixerBus](#modelmixerbus)

The base class for routable [buses](glossary.html#bus).

## [model.MixerGroup](#modelmixergroup)

A [model.MixerBus](scripting-api-reference-project-model-mixerstrip.html#modelmixerbus) that accepts the outputs of other mixer [buses](glossary.html#bus) as inputs.

**See Also:** [Group Buses and Routing](https://fmod.com/docs/2.02/studio/mixing.html#group-buses-and-routing)

## [model.MixerInput](#modelmixerinput)

A [model.MixerBus](scripting-api-reference-project-model-mixerstrip.html#modelmixerbus) that allows output from a [model.Event](scripting-api-reference-project-model-event.html#modelevent) to enter the project-level [mixer](glossary.html#mixer).

[Nested events](glossary.html#nested-event), [snapshots](glossary.html#snapshot) and profiler sessions cannot output to a mixer input.

**See Also:** [Mixer Strip](https://fmod.com/docs/2.02/studio/glossary.html#mixer-strip)

## [model.MixerMaster](#modelmixermaster)

The final output [bus](glossary.html#bus) in the [mixer](glossary.html#mixer).

**See Also:** [model.MixerStrip](scripting-api-reference-project-model-mixerstrip.html#modelmixerstrip), [Master Bus](https://fmod.com/docs/2.02/studio/mixing.html#master-bus)

## [model.MixerPort](#modelmixerport)

An output to an external audio port.

**See Also:** [Port Buses](https://fmod.com/docs/2.02/studio/mixing.html#port-buses)

## [model.MixerReturn](#modelmixerreturn)

A [return bus](glossary.html#return-bus) that can receive a [signal](glossary.html#signal) from a [model.MixerSend](scripting-api-reference-project-model-mixereffect.html#modelmixersend).

**See Also:** [Sends and Return Buses](https://fmod.com/docs/2.02/studio/mixing.html#sends-and-return-buses), [Return](https://fmod.com/docs/2.02/api/effects-reference.html#return)

## [model.MixerStrip](#modelmixerstrip)

The base class for elements represented as a strip.

## [model.MixerVCA](#modelmixervca)

A [model.MixerStrip](scripting-api-reference-project-model-mixerstrip.html#modelmixerstrip) that scales the volume of any other [mixer strips](glossary.html#mixer-strip) assigned to it.

**See Also:** [VCAs](https://fmod.com/docs/2.02/studio/mixing.html#vcas)

## [MixerBus.getInputFormat](#mixerbusgetinputformat)

Retrieves the input format of the [bus](glossary.html#bus).

```javascript
MixerBus.getInputFormat()
```

Returns the effective input format for a [model.MixerBus](scripting-api-reference-project-model-mixerstrip.html#modelmixerbus) object as an enumeration.

## [MixerBus.getOutputFormat](#mixerbusgetoutputformat)

Retrieves the output format of the [bus](glossary.html#bus).

```javascript
MixerBus.getOutputFormat()
```

Returns the effective output format for a [model.MixerBus](scripting-api-reference-project-model-mixerstrip.html#modelmixerbus) object as an enumeration.

## [MixerStrip.getPath](#mixerstripgetpath)

Retrieves the [mixer strip's](glossary.html#mixer-strip) unique path identifier.

```javascript
MixerStrip.getPath()
```

Returns the [model.MixerStrip](scripting-api-reference-project-model-mixerstrip.html#modelmixerstrip)'s [path](https://fmod.com/docs/2.02/studio/advanced-topics.html#paths) as a `string`.
