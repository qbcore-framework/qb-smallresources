Config = {}
Config.MaxWidth = 5.0
Config.MaxHeight = 5.0
Config.MaxLength = 5.0
Config.DamageNeeded = 100.0
Config.IdleCamera = true
Config.EnableProne = true
Config.JointEffectTime = 60
Config.RemoveWeaponDrops = true
Config.RemoveWeaponDropsTimer = 25
Config.DefaultPrice = 20 -- Default price for the carwash
Config.DirtLevel = 0.1 -- Threshold for the dirt level to be counted as dirty
Config.DisableAmbience = false -- Disabled distance sirens, distance car alarms, etc

Config.Disable = {
    disableHudComponents = {1, 2, 3, 4, 7, 9, 13, 14, 19, 20, 21, 22}, -- Hud Components: https://docs.fivem.net/natives/?_0x6806C51AD12B83B8
    disableControls = {37}, -- Controls: https://docs.fivem.net/docs/game-references/controls/
    displayAmmo = true -- false disables ammo display
}

Config.Density = {
    ['parked'] = 0.8,
    ['vehicle'] = 0.8,
    ['multiplier'] = 0.8,
    ['peds'] = 0.8,
    ['scenario'] = 0.8,
}

Config.ConsumableAnims = {
    ['drinking'] = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
    ['eating'] = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
    ['bowl'] = { dict = 'anim@scripted@island@special_peds@pavel@hs4_pavel_ig5_caviar_p1', clip = 'base_idle' },
}

Config.ConsumableProps = {
    ['burger'] = { model = 'prop_cs_burger_01', pos = vec3(0.02, 0.02, -0.02), rot = vec3(0.0, 0.0, 0.0) },
    ['donut'] = { model = 'prop_amb_donut', pos = vec3(0.02, 0.02, -0.02), rot = vec3(0.0, 0.0, 0.0) },
    ['water'] = { model = 'ba_prop_club_water_bottle', pos = vec3(0.02, 0.02, -0.02), rot = vec3(0.0, 0.0, 0.0) },
    ['spoon'] = { model = 'h4_prop_h4_caviar_spoon_01a', pos = vec3(0.0, 0.0, 0.0), rot = vec3(0.0, 0.0, 0.0) },
    ['fork'] = { model = 'prop_cs_fork', pos = vec3(0.0, 0.0, 0.0), rot = vec3(0.0, 0.0, 0.0) },
    ['pizza'] = { model = 'v_res_tt_pizzaplate', pos = vec3(0.0, 0.0300, 0.0100), rot = vec3(0.0, 0.0, 0.0) },
    ['uwubowl'] = { model = 'prop_cs_bowl_01b', pos = vec3(0.0, 0.0300, 0.0100), rot = vec3(0.0, 0.0, 0.0) },
    ['uwusoup'] = { model = 'v_ret_247_noodle1', pos = vec3(0.0, 0.0300, 0.0100), rot = vec3(0.0, 0.0, 0.0) },
    ['uwupancake'] = { model = 'ng_proc_food_ornge1a', pos = vec3(0.0, 0.0, 0.0), rot = vec3(0.0, 0.0, 0.0) },
    ['uwudrink'] = { model = 'apa_prop_cs_plastic_cup_01', pos = vec3(0.0, 0.0, 0.0), rot = vec3(0.0, 0.0, 0.0) },
}

Config.Consumables = {
    ["sandwich"] = {
        prop = 'burger',
        anim = 'eating',
        type = 'food',
        value = math.random(35, 54),
    },
    ["tosti"] = {
        prop = 'burger',
        anim = 'eating',
        type = 'food',
        value = math.random(40, 50),
    },
    ["twerks_candy"] = {
        prop = 'donut',
        anim = 'eating',
        type = 'food',
        value = math.random(35, 54),
    },
    ["snikkel_candy"] = {
        prop = 'donut',
        anim = 'eating',
        type = 'food',
        value = math.random(40, 50),
    },
    ["water_bottle"] = {
        prop = 'water',
        anim = 'drinking',
        type = 'drink',
        value = math.random(35, 54),
    },
    ["kurkakola"] = {
        prop = 'water',
        anim = 'drinking',
        type = 'drink',
        value = math.random(35, 54),
    },
    ["coffee"] = {
        prop = 'water',
        anim = 'drinking',
        type = 'drink',
        value = math.random(40, 50),
    },
    ["whiskey"] = {
        prop = 'water',
        anim = 'drinking',
        type = 'alcool',
        value = math.random(20, 30),
    },
    ["beer"] = {
        prop = 'water',
        anim = 'drinking',
        type = 'alcool',
        value = math.random(30, 40),
    },
    ["vodka"] = {
        prop = 'water',
        anim = 'drinking',
        type = 'alcool',
        value = math.random(20, 40),
    },
}

ConsumablesFireworks = {
    "firework1",
    "firework2",
    "firework3",
    "firework4"
}

Config.BlacklistedScenarios = {
    ['TYPES'] = {
        "WORLD_VEHICLE_MILITARY_PLANES_SMALL",
        "WORLD_VEHICLE_MILITARY_PLANES_BIG",
        "WORLD_VEHICLE_AMBULANCE",
        "WORLD_VEHICLE_POLICE_NEXT_TO_CAR",
        "WORLD_VEHICLE_POLICE_CAR",
        "WORLD_VEHICLE_POLICE_BIKE",
    },
    ['GROUPS'] = {
        2017590552,
        2141866469,
        1409640232,
        `ng_planes`,
    }
}

Config.BlacklistedVehs = {
    [`SHAMAL`] = true,
    [`LUXOR`] = true,
    [`LUXOR2`] = true,
    [`JET`] = true,
    [`LAZER`] = true,
    [`BUZZARD`] = true,
    [`BUZZARD2`] = true,
    [`ANNIHILATOR`] = true,
    [`SAVAGE`] = true,
    [`TITAN`] = true,
    [`RHINO`] = true,
    [`FIRETRUK`] = true,
    [`MULE`] = true,
    [`MAVERICK`] = true,
    [`BLIMP`] = true,
    [`AIRTUG`] = true,
    [`CAMPER`] = true,
    [`HYDRA`] = true,
    [`OPPRESSOR`] = true,
    [`technical3`] = true,
    [`insurgent3`] = true,
    [`apc`] = true,
    [`tampa3`] = true,
    [`trailersmall2`] = true,
    [`halftrack`] = true,
    [`hunter`] = true,
    [`vigilante`] = true,
    [`akula`] = true,
    [`barrage`] = true,
    [`khanjali`] = true,
    [`caracara`] = true,
    [`blimp3`] = true,
    [`menacer`] = true,
    [`oppressor2`] = true,
    [`scramjet`] = true,
    [`strikeforce`] = true,
    [`cerberus`] = true,
    [`cerberus2`] = true,
    [`cerberus3`] = true,
    [`scarab`] = true,
    [`scarab2`] = true,
    [`scarab3`] = true,
    [`rrocket`] = true,
    [`ruiner2`] = true,
    [`deluxo`] = true,
}

Config.BlacklistedPeds = {
    [`s_m_y_ranger_01`] = true,
    [`s_m_y_sheriff_01`] = true,
    [`s_m_y_cop_01`] = true,
    [`s_f_y_sheriff_01`] = true,
    [`s_f_y_cop_01`] = true,
    [`s_m_y_hwaycop_01`] = true,
}

Config.Teleports = {
    --Elevator @ labs
    [1] = {
        [1] = {
            coords = vector4(3540.74, 3675.59, 20.99, 167.5),
            ["AllowVehicle"] = false,
            drawText = '[E] Take Elevator Up'
        },
        [2] = {
            coords = vector4(3540.74, 3675.59, 28.11, 172.5),
            ["AllowVehicle"] = false,
            drawText = '[E] Take Elevator Down'
        },

    },
    --Coke Processing Enter/Exit
    [2] = {
        [1] = {
            coords = vector4(909.49, -1589.22, 30.51, 92.24),
            ["AllowVehicle"] = false,
            drawText = '[E] Enter Coke Processing'
        },
        [2] = {
            coords = vector4(1088.81, -3187.57, -38.99, 181.7),
            ["AllowVehicle"] = false,
            drawText = '[E] Leave'
        },
    },
}

Config.CarWash = { -- carwash
    [1] = {
        ["label"] = "Hands Free Carwash",
        ["coords"] = vector3(25.29, -1391.96, 29.33),
    },
    [2] = {
        ["label"] = "Hands Free Carwash",
        ["coords"] = vector3(174.18, -1736.66, 29.35),
    },
    [3] = {
        ["label"] = "Hands Free Carwash",
        ["coords"] = vector3(-74.56, 6427.87, 31.44),
    },
    [4] = {
        ["label"] = "Hands Free Carwash",
        ["coords"] = vector3(1363.22, 3592.7, 34.92),
    },
    [5] = {
        ["label"] = "Hands Free Carwash",
        ["coords"] = vector3(-699.62, -932.7, 19.01),
    }
}
