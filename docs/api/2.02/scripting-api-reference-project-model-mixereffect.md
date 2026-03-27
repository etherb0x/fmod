---
title: "FMOD - Scripting API Reference | Project.Model.MixerEffect"
source: "FMOD 2.02 Studio Scripting API"
downloaded: "2026-02-24"
---

# 26\. Scripting API Reference | Project.Model.MixerEffect

**Types:**

-   [model.ChannelMixEffect](scripting-api-reference-project-model-mixereffect.html#modelchannelmixeffect "An effect that allows custom gain and mixing of each individual channel.") An [effect](glossary.html#effect) that allows custom gain and mixing of each individual channel.
-   [model.ChorusEffect](scripting-api-reference-project-model-mixereffect.html#modelchoruseffect "An effect that uses an LFO modulated delay to create a shimmering sound.") An [effect](glossary.html#effect) that uses an LFO modulated delay to create a shimmering sound.
-   [model.CompressorEffect](scripting-api-reference-project-model-mixereffect.html#modelcompressoreffect "An effect that reduces the dynamic range of a signal by attenuating peaks in volume.") An [effect](glossary.html#effect) that reduces the dynamic range of a [signal](glossary.html#signal) by attenuating peaks in volume.
-   [model.ConvolutionReverbEffect](scripting-api-reference-project-model-mixereffect.html#modelconvolutionreverbeffect "An effect that convolves the incoming signal with a user-provided impulse response.") An [effect](glossary.html#effect) that convolves the incoming [signal](glossary.html#signal) with a user-provided impulse response.
-   [model.DelayEffect](scripting-api-reference-project-model-mixereffect.html#modeldelayeffect "An effect that repeats a signal after a user-specified amount of time.") An [effect](glossary.html#effect) that repeats a [signal](glossary.html#signal) after a user-specified amount of time.
-   [model.FlangerEffect](scripting-api-reference-project-model-mixereffect.html#modelflangereffect "An effect that uses an LFO modulated delay to create a swirling sound.") An [effect](glossary.html#effect) that uses an LFO modulated delay to create a swirling sound.
-   [model.GainEffect](scripting-api-reference-project-model-mixereffect.html#modelgaineffect "An effect that attenuates or amplifies a signal.") An [effect](glossary.html#effect) that attenuates or amplifies a [signal](glossary.html#signal).
-   [model.HighpassEffect](scripting-api-reference-project-model-mixereffect.html#modelhighpasseffect "An effect that attenuates the low frequencies of a signal.") An [effect](glossary.html#effect) that attenuates the low frequencies of a [signal](glossary.html#signal).
-   [model.HighpassSimpleEffect](scripting-api-reference-project-model-mixereffect.html#modelhighpasssimpleeffect "An effect that attenuates the low frequencies of a signal.") An [effect](glossary.html#effect) that attenuates the low frequencies of a [signal](glossary.html#signal).
-   [model.ITEchoEffect](scripting-api-reference-project-model-mixereffect.html#modelitechoeffect "A stereo delay effect that repeats a signal after a user-specified amount of time.") A stereo delay effect that repeats a [signal](glossary.html#signal) after a user-specified amount of time.
-   [model.LimiterEffect](scripting-api-reference-project-model-mixereffect.html#modellimitereffect "An effect that reduces the dynamic range of a signal by attenuating peaks in volume.") An [effect](glossary.html#effect) that reduces the dynamic range of a [signal](glossary.html#signal) by attenuating peaks in volume.
-   [model.LoudnessMeter](scripting-api-reference-project-model-mixereffect.html#modelloudnessmeter "An effect that displays standardized loudness metrics for an input signal.") An [effect](glossary.html#effect) that displays standardized loudness metrics for an input [signal](glossary.html#signal).
-   [model.LowpassEffect](scripting-api-reference-project-model-mixereffect.html#modellowpasseffect "An effect that attenuates the high frequencies of a signal.") An [effect](glossary.html#effect) that attenuates the high frequencies of a [signal](glossary.html#signal).
-   [model.LowpassSimpleEffect](scripting-api-reference-project-model-mixereffect.html#modellowpasssimpleeffect "An effect that attenuates the high frequencies of a signal.") An [effect](glossary.html#effect) that attenuates the high frequencies of a [signal](glossary.html#signal).
-   [model.MixerBusEffectChain](scripting-api-reference-project-model-mixereffect.html#modelmixerbuseffectchain "A mixer bus's signal chain.") A [mixer bus](glossary.html#bus)'s [signal chain](glossary.html#signal-chain).
-   [model.MixerBusFader](scripting-api-reference-project-model-mixereffect.html#modelmixerbusfader "The mixer bus's fader within the signal chain.") The mixer [bus](glossary.html#bus)'s fader within the [signal chain](glossary.html#signal-chain).
-   [model.MixerBusPanner](scripting-api-reference-project-model-mixereffect.html#modelmixerbuspanner "An effect that modifies the mix balance of a signal in relation to each speaker.") An [effect](glossary.html#effect) that modifies the mix balance of a [signal](glossary.html#signal) in relation to each speaker.
-   [model.MixerEffect](scripting-api-reference-project-model-mixereffect.html#modelmixereffect "The base class for a signal processing unit.") The base class for a [signal](glossary.html#signal) processing unit.
-   [model.MixerSend](scripting-api-reference-project-model-mixereffect.html#modelmixersend "An effect that sends the incoming signal to a return, and allows the signal to flow on through the signal chain.") An [effect](glossary.html#effect) that sends the incoming [signal](glossary.html#signal) to a return, and allows the signal to flow on through the signal chain.
-   [model.MultibandEqEffect](scripting-api-reference-project-model-mixereffect.html#modelmultibandeqeffect "An effect that attenuates or amplifies multiple bands of a signal.") An [effect](glossary.html#effect) that attenuates or amplifies multiple bands of a [signal](glossary.html#signal).
-   [model.ObjectSpatialiserEffect](scripting-api-reference-project-model-mixereffect.html#modelobjectspatialisereffect "An object based spatializer effect.") An object based spatializer [effect](glossary.html#effect).
-   [model.PannerEffect](scripting-api-reference-project-model-mixereffect.html#modelpannereffect "An effect that modifies the mix balance of a signal in relation to each speaker.") An [effect](glossary.html#effect) that modifies the mix balance of a [signal](glossary.html#signal) in relation to each speaker.
-   [model.ParamEqEffect](scripting-api-reference-project-model-mixereffect.html#modelparameqeffect "An effect that attenuates or amplifies a single band of a signal.") An [effect](glossary.html#effect) that attenuates or amplifies a single band of a [signal](glossary.html#signal).
-   [model.PitchShifterEffect](scripting-api-reference-project-model-mixereffect.html#modelpitchshiftereffect "An effect that modifies the pitch of the signal.") An [effect](glossary.html#effect) that modifies the pitch of the [signal](glossary.html#signal).
-   [model.SFXReverbEffect](scripting-api-reference-project-model-mixereffect.html#modelsfxreverbeffect "An effect that uses a series of delays to apply reverb to a signal.") An [effect](glossary.html#effect) that uses a series of delays to apply reverb to a [signal](glossary.html#signal).
-   [model.Sidechain](scripting-api-reference-project-model-mixereffect.html#modelsidechain "An effect that makes a signal available as an input for effect, parameter, or event property modulation.") An [effect](glossary.html#effect) that makes a [signal](glossary.html#signal) available as an input for effect, parameter, or [event property](glossary.html#event-property) modulation.
-   [model.SpatialEffect](scripting-api-reference-project-model-mixereffect.html#modelspatialeffect "The base class for spatializer effects.") The base class for [spatializer effects](%studio%glossary.html#spatializer-effect).
-   [model.SpatialiserEffect](scripting-api-reference-project-model-mixereffect.html#modelspatialisereffect "An effect that simulates the positioning of a sound in 3D space.") An [effect](glossary.html#effect) that simulates the positioning of a sound in 3D space.
-   [model.ThreeEQEffect](scripting-api-reference-project-model-mixereffect.html#modelthreeeqeffect "An effect that attenuates or amplifies the lower, middle, and upper bands of a signal.") An [effect](glossary.html#effect) that attenuates or amplifies the lower, middle, and upper bands of a [signal](glossary.html#signal).
-   [model.TransceiverEffect](scripting-api-reference-project-model-mixereffect.html#modeltransceivereffect "An effect that can transmit or receive a signal on one of thirty-two different transceiver channels.") An [effect](glossary.html#effect) that can transmit or receive a [signal](glossary.html#signal) on one of thirty-two different transceiver channels.
-   [model.TremoloEffect](scripting-api-reference-project-model-mixereffect.html#modeltremoloeffect "An effect that modulates the volume of a signal with an LFO to create a rhythmic beating sound.") An [effect](glossary.html#effect) that modulates the volume of a [signal](glossary.html#signal) with an LFO to create a rhythmic beating sound.

**Extension Methods:**

-   [MixerBusEffectChain.addEffect](scripting-api-reference-project-model-mixereffect.html#mixerbuseffectchainaddeffect "Creates an effect and adds it to the end of the chain.") Creates an [effect](glossary.html#effect) and adds it to the end of the chain.
-   [ConvolutionReverbEffect.setIRFromFilePath](scripting-api-reference-project-model-mixereffect.html#convolutionreverbeffectsetirfromfilepath "Sets the impulse response for a convolution reverb effect.") Sets the impulse response for a convolution reverb effect.

## [model.ChannelMixEffect](#modelchannelmixeffect)

An [effect](glossary.html#effect) that allows custom gain and mixing of each individual channel.

**See Also:** [Channel Mix](https://fmod.com/docs/2.02/api/effects-reference.html#channel-mix)

## [model.ChorusEffect](#modelchoruseffect)

An [effect](glossary.html#effect) that uses an LFO modulated delay to create a shimmering sound.

**See Also:** [Chorus](https://fmod.com/docs/2.02/api/effects-reference.html#chorus)

## [model.CompressorEffect](#modelcompressoreffect)

An [effect](glossary.html#effect) that reduces the dynamic range of a [signal](glossary.html#signal) by attenuating peaks in volume.

**See Also:** [Compressor](https://fmod.com/docs/2.02/api/effects-reference.html#compressor)

## [model.ConvolutionReverbEffect](#modelconvolutionreverbeffect)

An [effect](glossary.html#effect) that convolves the incoming [signal](glossary.html#signal) with a user-provided impulse response.

**See Also:** [Convolution Reverb](https://fmod.com/docs/2.02/api/effects-reference.html#convolution-reverb)

## [model.DelayEffect](#modeldelayeffect)

An [effect](glossary.html#effect) that repeats a [signal](glossary.html#signal) after a user-specified amount of time.

**See Also:** [Delay](https://fmod.com/docs/2.02/api/effects-reference.html#delay)

## [model.FlangerEffect](#modelflangereffect)

An [effect](glossary.html#effect) that uses an LFO modulated delay to create a swirling sound.

**See Also:** [Flange](https://fmod.com/docs/2.02/api/effects-reference.html#flange)

## [model.GainEffect](#modelgaineffect)

An [effect](glossary.html#effect) that attenuates or amplifies a [signal](glossary.html#signal).

## [model.HighpassEffect](#modelhighpasseffect)

An [effect](glossary.html#effect) that attenuates the low frequencies of a [signal](glossary.html#signal).

This effect differs from [model.HighpassSimpleEffect](scripting-api-reference-project-model-mixereffect.html#modelhighpasssimpleeffect) by having a "Resonance" control.

**Development Status**. Deprecated and will be removed in a future release

**See Also:** [High Pass](https://fmod.com/docs/2.02/api/effects-reference.html#high-pass)

## [model.HighpassSimpleEffect](#modelhighpasssimpleeffect)

An [effect](glossary.html#effect) that attenuates the low frequencies of a [signal](glossary.html#signal).

**Development Status**. Deprecated and will be removed in a future release.

**See Also:** [High Pass Simple](https://fmod.com/docs/2.02/api/effects-reference.html#high-pass-simple)

## [model.ITEchoEffect](#modelitechoeffect)

A stereo delay effect that repeats a [signal](glossary.html#signal) after a user-specified amount of time.

**See Also:** [IT Echo](https://fmod.com/docs/2.02/api/effects-reference.html#it-echo)

## [model.LimiterEffect](#modellimitereffect)

An [effect](glossary.html#effect) that reduces the dynamic range of a [signal](glossary.html#signal) by attenuating peaks in volume.

The attenuation ratio of this effect is more extreme than that of a [model.CompressorEffect](scripting-api-reference-project-model-mixereffect.html#modelcompressoreffect).

**See Also:** [Limiter](https://fmod.com/docs/2.02/api/effects-reference.html#limiter)

## [model.LoudnessMeter](#modelloudnessmeter)

An [effect](glossary.html#effect) that displays standardized loudness metrics for an input [signal](glossary.html#signal).

## [model.LowpassEffect](#modellowpasseffect)

An [effect](glossary.html#effect) that attenuates the high frequencies of a [signal](glossary.html#signal).

This effect differs from [model.HighpassSimpleEffect](scripting-api-reference-project-model-mixereffect.html#modelhighpasssimpleeffect) by having a "Resonance" control.

**Development Status**. Deprecated and will be removed in a future release

**See Also:** [Low Pass](https://fmod.com/docs/2.02/api/effects-reference.html#low-pass)

## [model.LowpassSimpleEffect](#modellowpasssimpleeffect)

An [effect](glossary.html#effect) that attenuates the high frequencies of a [signal](glossary.html#signal).

**Development Status**. Deprecated and will be removed in a future release

**See Also:** [Low Pass Simple](https://fmod.com/docs/2.02/api/effects-reference.html#low-pass-simple)

## [model.MixerBusEffectChain](#modelmixerbuseffectchain)

A [mixer bus](glossary.html#bus)'s [signal chain](glossary.html#signal-chain).

A single [model.MixerBusFader](scripting-api-reference-project-model-mixereffect.html#modelmixerbusfader) is required to be placed within the chain.

**See Also:** [model.MixerBus](scripting-api-reference-project-model-mixerstrip.html#modelmixerbus)

## [model.MixerBusFader](#modelmixerbusfader)

The mixer [bus](glossary.html#bus)'s fader within the [signal chain](glossary.html#signal-chain).

**See Also:** [Fader](https://fmod.com/docs/2.02/api/effects-reference.html#fader), [model.MixerBus](scripting-api-reference-project-model-mixerstrip.html#modelmixerbus)

## [model.MixerBusPanner](#modelmixerbuspanner)

An [effect](glossary.html#effect) that modifies the mix balance of a [signal](glossary.html#signal) in relation to each speaker.

This effect appears automatically in the [deck](glossary.html#deck) when the [event](glossary.html#event)'s speaker configuration is set to stereo or higher, and cannot be manually added or removed.

**See Also:** [The Panner](https://fmod.com/docs/2.02/studio/mixing.html#the-panner)

## [model.MixerEffect](#modelmixereffect)

The base class for a [signal](glossary.html#signal) processing unit.

Mixer effects encapsulate the functionality of [DSP effects](https://fmod.com/docs/2.02/api/core-guide.html#dsp-effects-support-for-plugins).

**See Also:** [Effect](https://fmod.com/docs/2.02/studio/fmod-studio-concepts.html#effects)

## [model.MixerSend](#modelmixersend)

An [effect](glossary.html#effect) that sends the incoming [signal](glossary.html#signal) to a return, and allows the signal to flow on through the signal chain.

**See Also:** [Sends and Return Buses](https://fmod.com/docs/2.02/studio/mixing.html#sends-and-return-buses), [Send](https://fmod.com/docs/2.02/api/effects-reference.html#send), [model.MixerReturn](scripting-api-reference-project-model-mixerstrip.html#modelmixerreturn)

## [model.MultibandEqEffect](#modelmultibandeqeffect)

An [effect](glossary.html#effect) that attenuates or amplifies multiple bands of a [signal](glossary.html#signal).

**See Also:** [Multiband Equalizer](https://fmod.com/docs/2.02/api/effects-reference.html#multiband-equalizer)

## [model.ObjectSpatialiserEffect](#modelobjectspatialisereffect)

An object based spatializer [effect](glossary.html#effect).

The [signal](glossary.html#signal) routed to this effect is directed straight to the hardware output.

**See Also:** [The FMOD Object Spatializer Effect](https://fmod.com/docs/2.02/studio/advanced-topics.html#the-fmod-object-spatializer-effect), [Object Panner](https://fmod.com/docs/2.02/api/effects-reference.html#object-panner)

## [model.PannerEffect](#modelpannereffect)

An [effect](glossary.html#effect) that modifies the mix balance of a [signal](glossary.html#signal) in relation to each speaker.

**See Also:** [Pan](https://fmod.com/docs/2.02/api/effects-reference.html#pan)

## [model.ParamEqEffect](#modelparameqeffect)

An [effect](glossary.html#effect) that attenuates or amplifies a single band of a [signal](glossary.html#signal).

**Development Status**. Deprecated and will be removed in a future release.

**See Also:** [Parametric EQ](https://fmod.com/docs/2.02/api/effects-reference.html#parametric-eq)

## [model.PitchShifterEffect](#modelpitchshiftereffect)

An [effect](glossary.html#effect) that modifies the pitch of the [signal](glossary.html#signal).

**See Also:** [Pitch Shifter](https://fmod.com/docs/2.02/api/effects-reference.html#pitch-shifter)

## [model.SFXReverbEffect](#modelsfxreverbeffect)

An [effect](glossary.html#effect) that uses a series of delays to apply reverb to a [signal](glossary.html#signal).

**See Also:** [SFX Reverb](https://fmod.com/docs/2.02/api/effects-reference.html#sfx-reverb)

## [model.Sidechain](#modelsidechain)

An [effect](glossary.html#effect) that makes a [signal](glossary.html#signal) available as an input for effect, parameter, or [event property](glossary.html#event-property) modulation.

**See Also:** [Sidechain Modulator](https://fmod.com/docs/2.02/studio/modulator-reference.html#sidechain-modulator), [Sidechain Effect](https://fmod.com/docs/2.02/studio/glossary.html#sidechain-effect), [model.SidechainModulator](scripting-api-reference-project-model-modulator.html#modelsidechainmodulator)

## [model.SpatialEffect](#modelspatialeffect)

The base class for [spatializer effects](https://fmod.com/docs/2.02/studio/glossary.html#spatializer-effect).

## [model.SpatialiserEffect](#modelspatialisereffect)

An [effect](glossary.html#effect) that simulates the positioning of a sound in 3D space.

**See Also:** [The FMOD Spatializer Effect](https://fmod.com/docs/2.02/studio/advanced-topics.html#the-fmod-spatializer-effect), [Pan](https://fmod.com/docs/2.02/api/effects-reference.html#pan)

## [model.ThreeEQEffect](#modelthreeeqeffect)

An [effect](glossary.html#effect) that attenuates or amplifies the lower, middle, and upper bands of a [signal](glossary.html#signal).

**See Also:** [Three EQ](https://fmod.com/docs/2.02/api/effects-reference.html#three-eq)

## [model.TransceiverEffect](#modeltransceivereffect)

An [effect](glossary.html#effect) that can transmit or receive a [signal](glossary.html#signal) on one of thirty-two different transceiver channels.

**See Also:** [Transceiver](https://fmod.com/docs/2.02/api/effects-reference.html#transceiver)

## [model.TremoloEffect](#modeltremoloeffect)

An [effect](glossary.html#effect) that modulates the volume of a [signal](glossary.html#signal) with an LFO to create a rhythmic beating sound.

**See Also:** [Tremolo](https://fmod.com/docs/2.02/api/effects-reference.html#tremolo)

## [MixerBusEffectChain.addEffect](#mixerbuseffectchainaddeffect)

Creates an [effect](glossary.html#effect) and adds it to the end of the chain.

```javascript
MixerBusEffectChain.addEffect(
    effectDefinition
)
```

effectDefinition

Either an `EffectPreset`, a [model.MixerEffect](scripting-api-reference-project-model-mixereffect.html#modelmixereffect) that is a preset, or one of the following strings:
\- `ThreeEQEffect`
\- `ChannelMixEffect`
\- `ChorusEffect`
\- `CompressorEffect`
\- `ConvolutionReverbEffect`
\- `DistortionEffect`
\- `DelayEffect`
\- `FlangerEffect`
\- `GainEffect`
\- `LimiterEffect`
\- `MultibandEqEffect`
\- `PitchShifterEffect`
\- `SFXReverbEffect`
\- `TransceiverEffect`
\- `TremoloEffect`
\- `HighpassEffect`
\- `HighpassSimpleEffect`
\- `LowpassEffect`
\- `LowpassSimpleEffect`
\- `ParamEqEffect`
\- `SpatialiserEffect`
\- `ObjectSpatialiserEffect`
\- `LoudnessMeter`

Returns the effect [ManagedObject](scripting-api-reference-project-managedobject.html#managedobject).

**See Also:** [Signal Chain](https://fmod.com/docs/2.02/studio/glossary.html#signal-chain)

## [ConvolutionReverbEffect.setIRFromFilePath](#convolutionreverbeffectsetirfromfilepath)

Sets the impulse response for a convolution reverb effect.

```javascript
ConvolutionReverbEffect.setIRFromFilePath(
    filePath
)
```

filePath

The absolute path to an audio data file.

## [model.DistortionEffect](#modeldistortioneffect)

An [effect](glossary.html#effect) that applies clipping to a [signal](glossary.html#signal) to affect the harmonic envelope.

**See Also:** [Distortion](https://fmod.com/docs/2.02/api/effects-reference.html#distortion)
