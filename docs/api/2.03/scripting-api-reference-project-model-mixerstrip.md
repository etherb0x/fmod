# Scripting API Reference | Project.Model.MixerStrip

FMOD Studio User Manual 2.03.12

## Types

### model.EventMixerGroup
An audio track within a model.Event.

### model.EventMixerMaster
The master track of a model.Event.

### model.EventMixerReturn
A return track that can receive signals from within the event.

### model.MixerBus
The base class for routable buses.

### model.MixerGroup
A model.MixerBus that accepts the outputs of other mixer buses as inputs.

### model.MixerInput
A model.MixerBus that allows output from a model.Event to enter the project-level mixer. Nested events, snapshots and profiler sessions cannot output to a mixer input.

### model.MixerMaster
The final output bus in the mixer.

### model.MixerPort
An output to an external audio port.

### model.MixerReturn
A return bus that can receive a signal from a model.MixerSend.

### model.MixerStrip
The base class for elements represented as a strip.

### model.MixerVCA
A model.MixerStrip that scales the volume of any other mixer strips assigned to it.

## Extension Methods

### MixerBus.getInputFormat()
Retrieves the input format of the bus. Returns the effective input format as an enumeration.

### MixerBus.getOutputFormat()
Retrieves the output format of the bus. Returns the effective output format as an enumeration.

### MixerStrip.getPath()
Retrieves the mixer strip's unique path identifier. Returns the path as a string.
