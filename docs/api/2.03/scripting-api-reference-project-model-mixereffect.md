# Scripting API Reference | Project.Model.MixerEffect

FMOD Studio User Manual 2.03.12

## Types

- **model.ChannelMixEffect** — An effect that allows custom gain and mixing of each individual channel.
- **model.ChorusEffect** — An effect that uses an LFO modulated delay to create a shimmering sound.
- **model.CompressorEffect** — An effect that reduces the dynamic range of a signal by attenuating peaks in volume.
- **model.ConvolutionReverbEffect** — An effect that convolves the incoming signal with a user-provided impulse response.
- **model.DelayEffect** — An effect that repeats a signal after a user-specified amount of time.
- **model.DistortionEffect** — An effect that applies clipping to a signal to affect the harmonic envelope.
- **model.FlangerEffect** — An effect that uses an LFO modulated delay to create a swirling sound.
- **model.GainEffect** — An effect that attenuates or amplifies a signal.
- **model.HighpassEffect** — An effect that attenuates the low frequencies of a signal. *(Deprecated)*
- **model.HighpassSimpleEffect** — An effect that attenuates the low frequencies of a signal. *(Deprecated)*
- **model.ITEchoEffect** — A stereo delay effect that repeats a signal after a user-specified amount of time.
- **model.LimiterEffect** — An effect that reduces the dynamic range of a signal by attenuating peaks in volume.
- **model.LoudnessMeter** — An effect that displays standardized loudness metrics for an input signal.
- **model.LowpassEffect** — An effect that attenuates the high frequencies of a signal. *(Deprecated)*
- **model.LowpassSimpleEffect** — An effect that attenuates the high frequencies of a signal. *(Deprecated)*
- **model.MixerBusEffectChain** — A mixer bus's signal chain.
- **model.MixerBusFader** — The mixer bus's fader within the signal chain.
- **model.MixerBusPanner** — An effect that modifies the mix balance of a signal in relation to each speaker.
- **model.MixerEffect** — The base class for a signal processing unit.
- **model.MixerSend** — An effect that sends the incoming signal to a return, and allows the signal to flow on through the signal chain.
- **model.MultibandEqEffect** — An effect that attenuates or amplifies multiple bands of a signal.
- **model.ObjectSpatialiserEffect** — An object based spatializer effect.
- **model.PannerEffect** — An effect that modifies the mix balance of a signal in relation to each speaker.
- **model.ParamEqEffect** — An effect that attenuates or amplifies a single band of a signal. *(Deprecated)*
- **model.PitchShifterEffect** — An effect that modifies the pitch of the signal.
- **model.SFXReverbEffect** — An effect that uses a series of delays to apply reverb to a signal.
- **model.Sidechain** — An effect that makes a signal available as an input for effect, parameter, or event property modulation.
- **model.SpatialEffect** — The base class for spatializer effects.
- **model.SpatialiserEffect** — An effect that simulates the positioning of a sound in 3D space.
- **model.ThreeEQEffect** — An effect that attenuates or amplifies the lower, middle, and upper bands of a signal.
- **model.TransceiverEffect** — An effect that can transmit or receive a signal on one of thirty-two different transceiver channels.
- **model.TremoloEffect** — An effect that modulates the volume of a signal with an LFO to create a rhythmic beating sound.

## Extension Methods

- **MixerBusEffectChain.addEffect** — Creates an effect and adds it to the end of the chain.
- **ConvolutionReverbEffect.setIRFromFilePath** — Sets the impulse response for a convolution reverb effect.

---

## model.ChannelMixEffect

An effect that allows custom gain and mixing of each individual channel.

**See Also:** [Channel Mix](https://fmod.com/docs/2.03/api/effects-reference.html#channel-mix)

---

## model.ChorusEffect

An effect that uses an LFO modulated delay to create a shimmering sound.

**See Also:** [Chorus](https://fmod.com/docs/2.03/api/effects-reference.html#chorus)

---

## model.CompressorEffect

An effect that reduces the dynamic range of a signal by attenuating peaks in volume.

**See Also:** [Compressor](https://fmod.com/docs/2.03/api/effects-reference.html#compressor)

---

## model.ConvolutionReverbEffect

An effect that convolves the incoming signal with a user-provided impulse response.

**See Also:** [Convolution Reverb](https://fmod.com/docs/2.03/api/effects-reference.html#convolution-reverb)

---

## model.DelayEffect

An effect that repeats a signal after a user-specified amount of time.

**See Also:** [Delay](https://fmod.com/docs/2.03/api/effects-reference.html#delay)

---

## model.DistortionEffect

An effect that applies clipping to a signal to affect the harmonic envelope.

**See Also:** [Distortion](https://fmod.com/docs/2.03/api/effects-reference.html#distortion)

---

## model.FlangerEffect

An effect that uses an LFO modulated delay to create a swirling sound.

**See Also:** [Flange](https://fmod.com/docs/2.03/api/effects-reference.html#flange)

---

## model.GainEffect

An effect that attenuates or amplifies a signal.

---

## model.HighpassEffect

An effect that attenuates the low frequencies of a signal.

This effect differs from `model.HighpassSimpleEffect` by having a "Resonance" control.

> **Development Status:** Deprecated and will be removed in a future release.

**See Also:** [High Pass](https://fmod.com/docs/2.03/api/effects-reference.html#high-pass)

---

## model.HighpassSimpleEffect

An effect that attenuates the low frequencies of a signal.

> **Development Status:** Deprecated and will be removed in a future release.

**See Also:** [High Pass Simple](https://fmod.com/docs/2.03/api/effects-reference.html#high-pass-simple)

---

## model.ITEchoEffect

A stereo delay effect that repeats a signal after a user-specified amount of time.

**See Also:** [IT Echo](https://fmod.com/docs/2.03/api/effects-reference.html#it-echo)

---

## model.LimiterEffect

An effect that reduces the dynamic range of a signal by attenuating peaks in volume.

The attenuation ratio of this effect is more extreme than that of a `model.CompressorEffect`.

**See Also:** [Limiter](https://fmod.com/docs/2.03/api/effects-reference.html#limiter)

---

## model.LoudnessMeter

An effect that displays standardized loudness metrics for an input signal.

---

## model.LowpassEffect

An effect that attenuates the high frequencies of a signal.

This effect differs from `model.HighpassSimpleEffect` by having a "Resonance" control.

> **Development Status:** Deprecated and will be removed in a future release.

**See Also:** [Low Pass](https://fmod.com/docs/2.03/api/effects-reference.html#low-pass)

---

## model.LowpassSimpleEffect

An effect that attenuates the high frequencies of a signal.

> **Development Status:** Deprecated and will be removed in a future release.

**See Also:** [Low Pass Simple](https://fmod.com/docs/2.03/api/effects-reference.html#low-pass-simple)

---

## model.MixerBusEffectChain

A mixer bus's signal chain.

A single `model.MixerBusFader` is required to be placed within the chain.

**See Also:** [model.MixerBus](https://www.fmod.com/docs/2.03/studio/scripting-api-reference-project-model-mixerstrip.html#modelmixerbus)

---

## model.MixerBusFader

The mixer bus's fader within the signal chain.

**See Also:** [Fader](https://fmod.com/docs/2.03/api/effects-reference.html#fader), [model.MixerBus](https://www.fmod.com/docs/2.03/studio/scripting-api-reference-project-model-mixerstrip.html#modelmixerbus)

---

## model.MixerBusPanner

An effect that modifies the mix balance of a signal in relation to each speaker.

This effect appears automatically in the deck when the event's speaker configuration is set to stereo or higher, and cannot be manually added or removed.

**See Also:** [The Panner](https://fmod.com/docs/2.03/studio/mixing.html#the-panner)

---

## model.MixerEffect

The base class for a signal processing unit.

Mixer effects encapsulate the functionality of DSP effects.

**See Also:** [Effect](https://fmod.com/docs/2.03/studio/fmod-studio-concepts.html#effects)

---

## model.MixerSend

An effect that sends the incoming signal to a return, and allows the signal to flow on through the signal chain.

**See Also:** [Sends and Return Buses](https://fmod.com/docs/2.03/studio/mixing.html#sends-and-return-buses), [Send](https://fmod.com/docs/2.03/api/effects-reference.html#send), [model.MixerReturn](https://www.fmod.com/docs/2.03/studio/scripting-api-reference-project-model-mixerstrip.html#modelmixerreturn)

---

## model.MultibandEqEffect

An effect that attenuates or amplifies multiple bands of a signal.

**See Also:** [Multiband Equalizer](https://fmod.com/docs/2.03/api/effects-reference.html#multiband-equalizer)

---

## model.ObjectSpatialiserEffect

An object based spatializer effect.

The signal routed to this effect is directed straight to the hardware output.

**See Also:** [The FMOD Object Spatializer Effect](https://fmod.com/docs/2.03/studio/advanced-topics.html#the-fmod-object-spatializer-effect), [Object Panner](https://fmod.com/docs/2.03/api/effects-reference.html#object-panner)

---

## model.PannerEffect

An effect that modifies the mix balance of a signal in relation to each speaker.

**See Also:** [Pan](https://fmod.com/docs/2.03/api/effects-reference.html#pan)

---

## model.ParamEqEffect

An effect that attenuates or amplifies a single band of a signal.

> **Development Status:** Deprecated and will be removed in a future release.

**See Also:** [Parametric EQ](https://fmod.com/docs/2.03/api/effects-reference.html#parametric-eq)

---

## model.PitchShifterEffect

An effect that modifies the pitch of the signal.

**See Also:** [Pitch Shifter](https://fmod.com/docs/2.03/api/effects-reference.html#pitch-shifter)

---

## model.SFXReverbEffect

An effect that uses a series of delays to apply reverb to a signal.

**See Also:** [SFX Reverb](https://fmod.com/docs/2.03/api/effects-reference.html#sfx-reverb)

---

## model.Sidechain

An effect that makes a signal available as an input for effect, parameter, or event property modulation.

**See Also:** [Sidechain Modulator](https://fmod.com/docs/2.03/studio/modulator-reference.html#sidechain-modulator), [Sidechain Effect](https://fmod.com/docs/2.03/studio/glossary.html#sidechain-effect), [model.SidechainModulator](https://www.fmod.com/docs/2.03/studio/scripting-api-reference-project-model-modulator.html#modelsidechainmodulator)

---

## model.SpatialEffect

The base class for spatializer effects.

---

## model.SpatialiserEffect

An effect that simulates the positioning of a sound in 3D space.

**See Also:** [The FMOD Spatializer Effect](https://fmod.com/docs/2.03/studio/advanced-topics.html#the-fmod-spatializer-effect), [Pan](https://fmod.com/docs/2.03/api/effects-reference.html#pan)

---

## model.ThreeEQEffect

An effect that attenuates or amplifies the lower, middle, and upper bands of a signal.

**See Also:** [Three EQ](https://fmod.com/docs/2.03/api/effects-reference.html#three-eq)

---

## model.TransceiverEffect

An effect that can transmit or receive a signal on one of thirty-two different transceiver channels.

**See Also:** [Transceiver](https://fmod.com/docs/2.03/api/effects-reference.html#transceiver)

---

## model.TremoloEffect

An effect that modulates the volume of a signal with an LFO to create a rhythmic beating sound.

**See Also:** [Tremolo](https://fmod.com/docs/2.03/api/effects-reference.html#tremolo)

---

## MixerBusEffectChain.addEffect

Creates an effect and adds it to the end of the chain.

```js
MixerBusEffectChain.addEffect(
    effectDefinition
)
```

**Parameters:**

- **effectDefinition** — Either an `EffectPreset`, a `model.MixerEffect` that is a shared effect, or one of the following strings:
  - `ThreeEQEffect`
  - `ChannelMixEffect`
  - `ChorusEffect`
  - `CompressorEffect`
  - `ConvolutionReverbEffect`
  - `DistortionEffect`
  - `DelayEffect`
  - `FlangerEffect`
  - `GainEffect`
  - `LimiterEffect`
  - `MultibandEqEffect`
  - `PitchShifterEffect`
  - `SFXReverbEffect`
  - `TransceiverEffect`
  - `TremoloEffect`
  - `HighpassEffect`
  - `HighpassSimpleEffect`
  - `LowpassEffect`
  - `LowpassSimpleEffect`
  - `ParamEqEffect`
  - `SpatialiserEffect`
  - `ObjectSpatialiserEffect`
  - `LoudnessMeter`

**Returns:** The effect `ManagedObject`.

**See Also:** [Signal Chain](https://fmod.com/docs/2.03/studio/glossary.html#signal-chain)

---

## ConvolutionReverbEffect.setIRFromFilePath

Sets the impulse response for a convolution reverb effect.

```js
ConvolutionReverbEffect.setIRFromFilePath(
    filePath
)
```

**Parameters:**

- **filePath** — The absolute path to an audio data file.
