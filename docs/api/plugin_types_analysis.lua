--[[
    Plugin Types Analysis Report
    Generated for project: fromtheforge.fspro
    Date: 2025-02-27T17:31:09.537Z
--]]

local plugin_analysis = {
    ["MixerBusFader"] = {
        count = 2514,
        examples = {
            "event:/Level/Tile_Surface/icecrack/icecrack_medium",
            "event:/UI/optionsScreen/input_up_mainMenu",
            "event:/FX/Status/Frozen/Status_Frozen_LP",
        },
        properties = {
        },
        relationships = {
        },
    },
    ["ProxyEffect"] = {
        count = 3363,
        examples = {
            "event:/Level/Tile_Surface/icecrack/icecrack_medium",
            "event:/FX/Status/Frozen/Status_Frozen_LP",
            "event:/_townObjects/Amb/Cookpot_LP",
        },
        properties = {
            ["inputFormat"] = {
                type = "object",
                example = (ManagedProperty:ProxyEffect.inputFormat),
            },
        },
        relationships = {
            ["preset"] = {
                type = "object",
                example = (ManagedRelationship:ProxyEffect.preset),
            },
        },
    },
    ["EffectChain"] = {
        count = 3,
        examples = {
            "event:/Level/Tile_Surface/icecrack/icecrack_medium (via preset: General)",
            "event:/FX/Status/Frozen/Status_Frozen_LP (via preset: Power)",
            "event:/_townObjects/Amb/Cookpot_LP (via preset: Town Prop)",
        },
        properties = {
        },
        relationships = {
            ["effects"] = {
                type = "object",
                example = (ManagedRelationship:EffectChain.effects),
            },
        },
    },
    ["SpatialiserEffect"] = {
        count = 54,
        examples = {
            "event:/_gemsNWeather/Weather/AntleerStampede/antleer_stampede_bleat",
            "event:/NPC/Foley/Foley_Metal",
            "event:/_grimhollow/Equipment/ProximityMine/Cannon_ProximityMine_Explode",
        },
        properties = {
            ["distanceRolloffType"] = {
                type = "object",
                example = (ManagedProperty:SpatialiserEffect.distanceRolloffType),
            },
            ["minimumDistance"] = {
                type = "object",
                example = (ManagedProperty:SpatialiserEffect.minimumDistance),
            },
            ["maximumDistance"] = {
                type = "object",
                example = (ManagedProperty:SpatialiserEffect.maximumDistance),
            },
            ["overrideRange"] = {
                type = "object",
                example = (ManagedProperty:SpatialiserEffect.overrideRange),
            },
            ["extentMode"] = {
                type = "object",
                example = (ManagedProperty:SpatialiserEffect.extentMode),
            },
            ["soundSize"] = {
                type = "object",
                example = (ManagedProperty:SpatialiserEffect.soundSize),
            },
            ["minimumExtent"] = {
                type = "object",
                example = (ManagedProperty:SpatialiserEffect.minimumExtent),
            },
            ["derivedMinimumDistance"] = {
                type = "object",
                example = (ManagedProperty:SpatialiserEffect.derivedMinimumDistance),
            },
            ["derivedMaximumDistance"] = {
                type = "object",
                example = (ManagedProperty:SpatialiserEffect.derivedMaximumDistance),
            },
            ["occlusionEnabled"] = {
                type = "object",
                example = (ManagedProperty:SpatialiserEffect.occlusionEnabled),
            },
            ["dopplerMultiplier"] = {
                type = "object",
                example = (ManagedProperty:SpatialiserEffect.dopplerMultiplier),
            },
            ["panBlend"] = {
                type = "object",
                example = (ManagedProperty:SpatialiserEffect.panBlend),
            },
            ["userPanDirection"] = {
                type = "object",
                example = (ManagedProperty:SpatialiserEffect.userPanDirection),
            },
            ["userPanExtent"] = {
                type = "object",
                example = (ManagedProperty:SpatialiserEffect.userPanExtent),
            },
            ["userLFELevel"] = {
                type = "object",
                example = (ManagedProperty:SpatialiserEffect.userLFELevel),
            },
            ["LFEUpmixEnabled"] = {
                type = "object",
                example = (ManagedProperty:SpatialiserEffect.LFEUpmixEnabled),
            },
            ["stereoToSurroundUserPanMode"] = {
                type = "object",
                example = (ManagedProperty:SpatialiserEffect.stereoToSurroundUserPanMode),
            },
            ["userStereoSeparation"] = {
                type = "object",
                example = (ManagedProperty:SpatialiserEffect.userStereoSeparation),
            },
            ["userStereoAxis"] = {
                type = "object",
                example = (ManagedProperty:SpatialiserEffect.userStereoAxis),
            },
        },
        relationships = {
        },
    },
    ["ThreeEQEffect"] = {
        count = 169,
        examples = {
            "event:/_gemsNWeather/Weather/AntleerStampede/antleer_stampede_bleat",
            "event:/Creature/SHIPPED/snowball/Standard/snowball_twirl_LP",
            "event:/Creature/SHIPPED/embison/luca_tempevents/embison_punch2_new",
        },
        properties = {
            ["lowGain"] = {
                type = "object",
                example = (ManagedProperty:ThreeEQEffect.lowGain),
            },
            ["midGain"] = {
                type = "object",
                example = (ManagedProperty:ThreeEQEffect.midGain),
            },
            ["highGain"] = {
                type = "object",
                example = (ManagedProperty:ThreeEQEffect.highGain),
            },
            ["lowCrossover"] = {
                type = "object",
                example = (ManagedProperty:ThreeEQEffect.lowCrossover),
            },
            ["highCrossover"] = {
                type = "object",
                example = (ManagedProperty:ThreeEQEffect.highCrossover),
            },
            ["crossoverSlope"] = {
                type = "object",
                example = (ManagedProperty:ThreeEQEffect.crossoverSlope),
            },
        },
        relationships = {
        },
    },
    ["PannerEffect"] = {
        count = 81,
        examples = {
            "event:/FX/Loot/Pickup/item_pickup_rare",
            "event:/UI/weightmeter/ui_weightMeter_adjust_up",
            "event:/FX/Hits/Knockdown",
        },
        properties = {
            ["stereoPan"] = {
                type = "object",
                example = (ManagedProperty:PannerEffect.stereoPan),
            },
            ["stereoLeftPan"] = {
                type = "object",
                example = (ManagedProperty:PannerEffect.stereoLeftPan),
            },
            ["stereoRightPan"] = {
                type = "object",
                example = (ManagedProperty:PannerEffect.stereoRightPan),
            },
            ["surroundPanDirection"] = {
                type = "object",
                example = (ManagedProperty:PannerEffect.surroundPanDirection),
            },
            ["surroundPanExtent"] = {
                type = "object",
                example = (ManagedProperty:PannerEffect.surroundPanExtent),
            },
            ["surroundLFELevel"] = {
                type = "object",
                example = (ManagedProperty:PannerEffect.surroundLFELevel),
            },
            ["stereoToSurroundPanMode"] = {
                type = "object",
                example = (ManagedProperty:PannerEffect.stereoToSurroundPanMode),
            },
            ["surroundStereoSeparation"] = {
                type = "object",
                example = (ManagedProperty:PannerEffect.surroundStereoSeparation),
            },
            ["surroundStereoAxis"] = {
                type = "object",
                example = (ManagedProperty:PannerEffect.surroundStereoAxis),
            },
            ["surroundHeightBlend"] = {
                type = "object",
                example = (ManagedProperty:PannerEffect.surroundHeightBlend),
            },
            ["overridingOutputFormat"] = {
                type = "object",
                example = (ManagedProperty:PannerEffect.overridingOutputFormat),
            },
            ["disabledSpeakers"] = {
                type = "object",
                example = (ManagedProperty:PannerEffect.disabledSpeakers),
            },
            ["LFEUpmixEnabled"] = {
                type = "object",
                example = (ManagedProperty:PannerEffect.LFEUpmixEnabled),
            },
        },
        relationships = {
        },
    },
    ["MixerSend"] = {
        count = 83,
        examples = {
            "event:/Creature/SHIPPED/bandicoot/bandicoot_shadow_enter",
            "event:/Creature/SHIPPED/owlitzer/owlitzer_knockdown",
            "event:/Props/Destructible Hit/Destructible_Stalactite_snap",
        },
        properties = {
            ["level"] = {
                type = "object",
                example = (ManagedProperty:MixerSend.level),
            },
            ["inputFormat"] = {
                type = "object",
                example = (ManagedProperty:MixerSend.inputFormat),
            },
        },
        relationships = {
            ["mixerReturn"] = {
                type = "object",
                example = (ManagedRelationship:MixerSend.mixerReturn),
            },
        },
    },
    ["MultibandEqEffect"] = {
        count = 141,
        examples = {
            "event:/Creature/fungoons/fungoons_hatspin_LP",
            "event:/Creature/SHIPPED/embison/embison_punch1",
            "event:/Props/trap_slideblock/IceBlock_Launch_slide",
        },
        properties = {
            ["filterTypeA"] = {
                type = "object",
                example = (ManagedProperty:MultibandEqEffect.filterTypeA),
            },
            ["filterTypeB"] = {
                type = "object",
                example = (ManagedProperty:MultibandEqEffect.filterTypeB),
            },
            ["filterTypeC"] = {
                type = "object",
                example = (ManagedProperty:MultibandEqEffect.filterTypeC),
            },
            ["filterTypeD"] = {
                type = "object",
                example = (ManagedProperty:MultibandEqEffect.filterTypeD),
            },
            ["filterTypeE"] = {
                type = "object",
                example = (ManagedProperty:MultibandEqEffect.filterTypeE),
            },
            ["frequencyA"] = {
                type = "object",
                example = (ManagedProperty:MultibandEqEffect.frequencyA),
            },
            ["frequencyB"] = {
                type = "object",
                example = (ManagedProperty:MultibandEqEffect.frequencyB),
            },
            ["frequencyC"] = {
                type = "object",
                example = (ManagedProperty:MultibandEqEffect.frequencyC),
            },
            ["frequencyD"] = {
                type = "object",
                example = (ManagedProperty:MultibandEqEffect.frequencyD),
            },
            ["frequencyE"] = {
                type = "object",
                example = (ManagedProperty:MultibandEqEffect.frequencyE),
            },
            ["qualityA"] = {
                type = "object",
                example = (ManagedProperty:MultibandEqEffect.qualityA),
            },
            ["qualityB"] = {
                type = "object",
                example = (ManagedProperty:MultibandEqEffect.qualityB),
            },
            ["qualityC"] = {
                type = "object",
                example = (ManagedProperty:MultibandEqEffect.qualityC),
            },
            ["qualityD"] = {
                type = "object",
                example = (ManagedProperty:MultibandEqEffect.qualityD),
            },
            ["qualityE"] = {
                type = "object",
                example = (ManagedProperty:MultibandEqEffect.qualityE),
            },
            ["gainA"] = {
                type = "object",
                example = (ManagedProperty:MultibandEqEffect.gainA),
            },
            ["gainB"] = {
                type = "object",
                example = (ManagedProperty:MultibandEqEffect.gainB),
            },
            ["gainC"] = {
                type = "object",
                example = (ManagedProperty:MultibandEqEffect.gainC),
            },
            ["gainD"] = {
                type = "object",
                example = (ManagedProperty:MultibandEqEffect.gainD),
            },
            ["gainE"] = {
                type = "object",
                example = (ManagedProperty:MultibandEqEffect.gainE),
            },
        },
        relationships = {
        },
    },
    ["DistortionEffect"] = {
        count = 11,
        examples = {
            "event:/Creature/grimhollow/grimhollow_dirt_LP",
            "event:/Creature/SHIPPED/woworm/woworm_tell",
            "event:/Creature/SHIPPED/eggzy/eggzy_spin",
        },
        properties = {
            ["level"] = {
                type = "object",
                example = (ManagedProperty:DistortionEffect.level),
            },
        },
        relationships = {
        },
    },
    ["CompressorEffect"] = {
        count = 56,
        examples = {
            "event:/Creature/grimhollow/grimhollow_dirt_LP",
            "event:/Creature/SHIPPED/embison/embison_punch1",
            "event:/NPC/toots_speech_neutral",
        },
        properties = {
            ["threshold"] = {
                type = "object",
                example = (ManagedProperty:CompressorEffect.threshold),
            },
            ["ratio"] = {
                type = "object",
                example = (ManagedProperty:CompressorEffect.ratio),
            },
            ["attackTime"] = {
                type = "object",
                example = (ManagedProperty:CompressorEffect.attackTime),
            },
            ["releaseTime"] = {
                type = "object",
                example = (ManagedProperty:CompressorEffect.releaseTime),
            },
            ["gain"] = {
                type = "object",
                example = (ManagedProperty:CompressorEffect.gain),
            },
            ["linkChannels"] = {
                type = "object",
                example = (ManagedProperty:CompressorEffect.linkChannels),
            },
        },
        relationships = {
            ["sidechains"] = {
                type = "object",
                example = (ManagedRelationship:CompressorEffect.sidechains),
            },
        },
    },
    ["GainEffect"] = {
        count = 83,
        examples = {
            "event:/Player/Player_potion_refill",
            "event:/_grimhollow/Equipment/ProximityMine/Cannon_ProximityMine_Explode",
            "event:/Player/Weapon/Cannon/mortar/Cannon_Mortar_Explode_Counter_Focus",
        },
        properties = {
            ["gain"] = {
                type = "object",
                example = (ManagedProperty:GainEffect.gain),
            },
        },
        relationships = {
        },
    },
    ["DelayEffect"] = {
        count = 25,
        examples = {
            "event:/Player/Skill/Weapon/Cannon/Skill_Cannon_ClusterShot_Tail",
            "event:/Creature/SHIPPED/floracrane/floracrane_spinning_pre",
            "event:/UI/weightmeter/ui_weightMeter_adjust_up",
        },
        properties = {
            ["delay"] = {
                type = "object",
                example = (ManagedProperty:DelayEffect.delay),
            },
            ["feedback"] = {
                type = "object",
                example = (ManagedProperty:DelayEffect.feedback),
            },
            ["level"] = {
                type = "object",
                example = (ManagedProperty:DelayEffect.level),
            },
            ["dryLevel"] = {
                type = "object",
                example = (ManagedProperty:DelayEffect.dryLevel),
            },
        },
        relationships = {
        },
    },
    ["TremoloEffect"] = {
        count = 7,
        examples = {
            "event:/Player/Weapon/Polearm/Polearm_poke_4_spin",
            "event:/Creature/SHIPPED/megatreemon/Weapon/megatreemon_elite_charged_bomb_warn_LP",
            "event:/Creature/SHIPPED/megatreemon/Weapon/megatreemon_elite_heal_bomb_heal_warn_LP",
        },
        properties = {
            ["frequency"] = {
                type = "object",
                example = (ManagedProperty:TremoloEffect.frequency),
            },
            ["depth"] = {
                type = "object",
                example = (ManagedProperty:TremoloEffect.depth),
            },
            ["shape"] = {
                type = "object",
                example = (ManagedProperty:TremoloEffect.shape),
            },
            ["skew"] = {
                type = "object",
                example = (ManagedProperty:TremoloEffect.skew),
            },
            ["duty"] = {
                type = "object",
                example = (ManagedProperty:TremoloEffect.duty),
            },
            ["square"] = {
                type = "object",
                example = (ManagedProperty:TremoloEffect.square),
            },
            ["phase"] = {
                type = "object",
                example = (ManagedProperty:TremoloEffect.phase),
            },
            ["spread"] = {
                type = "object",
                example = (ManagedProperty:TremoloEffect.spread),
            },
        },
        relationships = {
        },
    },
    ["PitchShifterEffect"] = {
        count = 16,
        examples = {
            "event:/Creature/SHIPPED/cabbageroll/Elite/cabbageroll_Elite_gather",
            "event:/Creature/SHIPPED/snowball/Elite/snowball_Elite_twirl_LP",
            "event:/Creature/SHIPPED/cabbageroll/Elite/cabbageroll_Elite_twirl_LP",
        },
        properties = {
            ["pitch"] = {
                type = "object",
                example = (ManagedProperty:PitchShifterEffect.pitch),
            },
            ["fftSize"] = {
                type = "object",
                example = (ManagedProperty:PitchShifterEffect.fftSize),
            },
            ["overlap"] = {
                type = "object",
                example = (ManagedProperty:PitchShifterEffect.overlap),
            },
            ["maxChannels"] = {
                type = "object",
                example = (ManagedProperty:PitchShifterEffect.maxChannels),
            },
        },
        relationships = {
        },
    },
    ["SFXReverbEffect"] = {
        count = 13,
        examples = {
            "event:/Props/trap_slideblock/IceBlock_Knockback",
            "event:/Music/Boss/Bandicoot/Mus_Bandicoot_DashStinger",
            "event:/Player/Skill/Weapon/Music Layers/Skill_IsPlayerInTotem_Thump",
        },
        properties = {
            ["decayTime"] = {
                type = "object",
                example = (ManagedProperty:SFXReverbEffect.decayTime),
            },
            ["earlyDelay"] = {
                type = "object",
                example = (ManagedProperty:SFXReverbEffect.earlyDelay),
            },
            ["lateDelay"] = {
                type = "object",
                example = (ManagedProperty:SFXReverbEffect.lateDelay),
            },
            ["HFReference"] = {
                type = "object",
                example = (ManagedProperty:SFXReverbEffect.HFReference),
            },
            ["HFDecayRatio"] = {
                type = "object",
                example = (ManagedProperty:SFXReverbEffect.HFDecayRatio),
            },
            ["diffusion"] = {
                type = "object",
                example = (ManagedProperty:SFXReverbEffect.diffusion),
            },
            ["density"] = {
                type = "object",
                example = (ManagedProperty:SFXReverbEffect.density),
            },
            ["lowShelfFrequency"] = {
                type = "object",
                example = (ManagedProperty:SFXReverbEffect.lowShelfFrequency),
            },
            ["lowShelfGain"] = {
                type = "object",
                example = (ManagedProperty:SFXReverbEffect.lowShelfGain),
            },
            ["highCut"] = {
                type = "object",
                example = (ManagedProperty:SFXReverbEffect.highCut),
            },
            ["earlyLateMix"] = {
                type = "object",
                example = (ManagedProperty:SFXReverbEffect.earlyLateMix),
            },
            ["wetLevel"] = {
                type = "object",
                example = (ManagedProperty:SFXReverbEffect.wetLevel),
            },
            ["dryLevel"] = {
                type = "object",
                example = (ManagedProperty:SFXReverbEffect.dryLevel),
            },
        },
        relationships = {
        },
    },
    ["Sidechain"] = {
        count = 7,
        examples = {
            "event:/Creature/SHIPPED/bandicoot/bandicoot_howl",
            "event:/Creature/SHIPPED/bandicoot/bandicoot_clone_kill",
            "event:/Creature/SHIPPED/bandicoot/bandicoot_clone_cast",
        },
        properties = {
            ["level"] = {
                type = "object",
                example = (ManagedProperty:Sidechain.level),
            },
        },
        relationships = {
            ["targets"] = {
                type = "object",
                example = (ManagedRelationship:Sidechain.targets),
            },
        },
    },
    ["ChannelMixEffect"] = {
        count = 1,
        examples = {
            "event:/Creature/SHIPPED/stunk/stunk_whoosh",
        },
        properties = {
            ["outputGrouping"] = {
                type = "object",
                example = (ManagedProperty:ChannelMixEffect.outputGrouping),
            },
            ["gain00"] = {
                type = "object",
                example = (ManagedProperty:ChannelMixEffect.gain00),
            },
            ["gain01"] = {
                type = "object",
                example = (ManagedProperty:ChannelMixEffect.gain01),
            },
            ["gain02"] = {
                type = "object",
                example = (ManagedProperty:ChannelMixEffect.gain02),
            },
            ["gain03"] = {
                type = "object",
                example = (ManagedProperty:ChannelMixEffect.gain03),
            },
            ["gain04"] = {
                type = "object",
                example = (ManagedProperty:ChannelMixEffect.gain04),
            },
            ["gain05"] = {
                type = "object",
                example = (ManagedProperty:ChannelMixEffect.gain05),
            },
            ["gain06"] = {
                type = "object",
                example = (ManagedProperty:ChannelMixEffect.gain06),
            },
            ["gain07"] = {
                type = "object",
                example = (ManagedProperty:ChannelMixEffect.gain07),
            },
            ["gain08"] = {
                type = "object",
                example = (ManagedProperty:ChannelMixEffect.gain08),
            },
            ["gain09"] = {
                type = "object",
                example = (ManagedProperty:ChannelMixEffect.gain09),
            },
            ["gain10"] = {
                type = "object",
                example = (ManagedProperty:ChannelMixEffect.gain10),
            },
            ["gain11"] = {
                type = "object",
                example = (ManagedProperty:ChannelMixEffect.gain11),
            },
            ["gain12"] = {
                type = "object",
                example = (ManagedProperty:ChannelMixEffect.gain12),
            },
            ["gain13"] = {
                type = "object",
                example = (ManagedProperty:ChannelMixEffect.gain13),
            },
            ["gain14"] = {
                type = "object",
                example = (ManagedProperty:ChannelMixEffect.gain14),
            },
            ["gain15"] = {
                type = "object",
                example = (ManagedProperty:ChannelMixEffect.gain15),
            },
            ["gain16"] = {
                type = "object",
                example = (ManagedProperty:ChannelMixEffect.gain16),
            },
            ["gain17"] = {
                type = "object",
                example = (ManagedProperty:ChannelMixEffect.gain17),
            },
            ["gain18"] = {
                type = "object",
                example = (ManagedProperty:ChannelMixEffect.gain18),
            },
            ["gain19"] = {
                type = "object",
                example = (ManagedProperty:ChannelMixEffect.gain19),
            },
            ["gain20"] = {
                type = "object",
                example = (ManagedProperty:ChannelMixEffect.gain20),
            },
            ["gain21"] = {
                type = "object",
                example = (ManagedProperty:ChannelMixEffect.gain21),
            },
            ["gain22"] = {
                type = "object",
                example = (ManagedProperty:ChannelMixEffect.gain22),
            },
            ["gain23"] = {
                type = "object",
                example = (ManagedProperty:ChannelMixEffect.gain23),
            },
            ["gain24"] = {
                type = "object",
                example = (ManagedProperty:ChannelMixEffect.gain24),
            },
            ["gain25"] = {
                type = "object",
                example = (ManagedProperty:ChannelMixEffect.gain25),
            },
            ["gain26"] = {
                type = "object",
                example = (ManagedProperty:ChannelMixEffect.gain26),
            },
            ["gain27"] = {
                type = "object",
                example = (ManagedProperty:ChannelMixEffect.gain27),
            },
            ["gain28"] = {
                type = "object",
                example = (ManagedProperty:ChannelMixEffect.gain28),
            },
            ["gain29"] = {
                type = "object",
                example = (ManagedProperty:ChannelMixEffect.gain29),
            },
            ["gain30"] = {
                type = "object",
                example = (ManagedProperty:ChannelMixEffect.gain30),
            },
            ["gain31"] = {
                type = "object",
                example = (ManagedProperty:ChannelMixEffect.gain31),
            },
            ["output00"] = {
                type = "object",
                example = (ManagedProperty:ChannelMixEffect.output00),
            },
            ["output01"] = {
                type = "object",
                example = (ManagedProperty:ChannelMixEffect.output01),
            },
            ["output02"] = {
                type = "object",
                example = (ManagedProperty:ChannelMixEffect.output02),
            },
            ["output03"] = {
                type = "object",
                example = (ManagedProperty:ChannelMixEffect.output03),
            },
            ["output04"] = {
                type = "object",
                example = (ManagedProperty:ChannelMixEffect.output04),
            },
            ["output05"] = {
                type = "object",
                example = (ManagedProperty:ChannelMixEffect.output05),
            },
            ["output06"] = {
                type = "object",
                example = (ManagedProperty:ChannelMixEffect.output06),
            },
            ["output07"] = {
                type = "object",
                example = (ManagedProperty:ChannelMixEffect.output07),
            },
            ["output08"] = {
                type = "object",
                example = (ManagedProperty:ChannelMixEffect.output08),
            },
            ["output09"] = {
                type = "object",
                example = (ManagedProperty:ChannelMixEffect.output09),
            },
            ["output10"] = {
                type = "object",
                example = (ManagedProperty:ChannelMixEffect.output10),
            },
            ["output11"] = {
                type = "object",
                example = (ManagedProperty:ChannelMixEffect.output11),
            },
            ["output12"] = {
                type = "object",
                example = (ManagedProperty:ChannelMixEffect.output12),
            },
            ["output13"] = {
                type = "object",
                example = (ManagedProperty:ChannelMixEffect.output13),
            },
            ["output14"] = {
                type = "object",
                example = (ManagedProperty:ChannelMixEffect.output14),
            },
            ["output15"] = {
                type = "object",
                example = (ManagedProperty:ChannelMixEffect.output15),
            },
            ["output16"] = {
                type = "object",
                example = (ManagedProperty:ChannelMixEffect.output16),
            },
            ["output17"] = {
                type = "object",
                example = (ManagedProperty:ChannelMixEffect.output17),
            },
            ["output18"] = {
                type = "object",
                example = (ManagedProperty:ChannelMixEffect.output18),
            },
            ["output19"] = {
                type = "object",
                example = (ManagedProperty:ChannelMixEffect.output19),
            },
            ["output20"] = {
                type = "object",
                example = (ManagedProperty:ChannelMixEffect.output20),
            },
            ["output21"] = {
                type = "object",
                example = (ManagedProperty:ChannelMixEffect.output21),
            },
            ["output22"] = {
                type = "object",
                example = (ManagedProperty:ChannelMixEffect.output22),
            },
            ["output23"] = {
                type = "object",
                example = (ManagedProperty:ChannelMixEffect.output23),
            },
            ["output24"] = {
                type = "object",
                example = (ManagedProperty:ChannelMixEffect.output24),
            },
            ["output25"] = {
                type = "object",
                example = (ManagedProperty:ChannelMixEffect.output25),
            },
            ["output26"] = {
                type = "object",
                example = (ManagedProperty:ChannelMixEffect.output26),
            },
            ["output27"] = {
                type = "object",
                example = (ManagedProperty:ChannelMixEffect.output27),
            },
            ["output28"] = {
                type = "object",
                example = (ManagedProperty:ChannelMixEffect.output28),
            },
            ["output29"] = {
                type = "object",
                example = (ManagedProperty:ChannelMixEffect.output29),
            },
            ["output30"] = {
                type = "object",
                example = (ManagedProperty:ChannelMixEffect.output30),
            },
            ["output31"] = {
                type = "object",
                example = (ManagedProperty:ChannelMixEffect.output31),
            },
        },
        relationships = {
        },
    },
    ["FlangerEffect"] = {
        count = 12,
        examples = {
            "event:/Creature/SHIPPED/bulbug/bulbug_cast",
            "event:/Creature/SHIPPED/sedament/sedament_freeze_LP",
            "event:/Creature/SHIPPED/megatreemon/Weapon/megatreemon_elite_heal_bomb_heal_pre_LP",
        },
        properties = {
            ["rate"] = {
                type = "object",
                example = (ManagedProperty:FlangerEffect.rate),
            },
            ["delay"] = {
                type = "object",
                example = (ManagedProperty:FlangerEffect.delay),
            },
            ["mix"] = {
                type = "object",
                example = (ManagedProperty:FlangerEffect.mix),
            },
        },
        relationships = {
        },
    },
    ["ChorusEffect"] = {
        count = 3,
        examples = {
            "event:/Creature/SHIPPED/megatreemon/Weapon/megatreemon_elite_charged_bomb_warn_LP",
            "event:/Creature/SHIPPED/megatreemon/Weapon/megatreemon_elite_heal_bomb_heal_warn_LP",
            "event:/Creature/SHIPPED/stunk/stunk_in",
        },
        properties = {
            ["rate"] = {
                type = "object",
                example = (ManagedProperty:ChorusEffect.rate),
            },
            ["depth"] = {
                type = "object",
                example = (ManagedProperty:ChorusEffect.depth),
            },
            ["mix"] = {
                type = "object",
                example = (ManagedProperty:ChorusEffect.mix),
            },
        },
        relationships = {
        },
    },
    ["ConvolutionReverbEffect"] = {
        count = 1,
        examples = {
            "event:/Level/market_room/building_marketroom_shop_LP",
        },
        properties = {
            ["startFrame"] = {
                type = "object",
                example = (ManagedProperty:ConvolutionReverbEffect.startFrame),
            },
            ["endFrame"] = {
                type = "object",
                example = (ManagedProperty:ConvolutionReverbEffect.endFrame),
            },
            ["wetLevel"] = {
                type = "object",
                example = (ManagedProperty:ConvolutionReverbEffect.wetLevel),
            },
            ["dryLevel"] = {
                type = "object",
                example = (ManagedProperty:ConvolutionReverbEffect.dryLevel),
            },
            ["linkChannels"] = {
                type = "object",
                example = (ManagedProperty:ConvolutionReverbEffect.linkChannels),
            },
        },
        relationships = {
            ["referenceableData"] = {
                type = "object",
                example = (ManagedRelationship:ConvolutionReverbEffect.referenceableData),
            },
        },
    },
    Summary = {
        TotalPluginTypes = 20,
        TotalEventsAnalyzed = 2713,
    },
}

return plugin_analysis