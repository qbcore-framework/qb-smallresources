Config = {}
Config.MaxWidth = 5.0
Config.MaxHeight = 5.0
Config.MaxLength = 5.0
Config.DamageNeeded = 100.0
Config.EnableProne = true
Config.JointEffectTime = 60
Config.RemoveWeaponDrops = true
Config.RemoveWeaponDropsTimer = 25

Consumeables = {
    ["sandwich"] = math.random(35, 54),
    ["water_bottle"] = math.random(35, 54),
    ["tosti"] = math.random(40, 50),
    ["kurkakola"] = math.random(35, 54),
    ["twerks_candy"] = math.random(35, 54),
    ["snikkel_candy"] = math.random(40, 50),
    ["coffee"] = math.random(40, 50),
    ["whiskey"] = math.random(20, 30),
    ["beer"] = math.random(30, 40),
    ["vodka"] = math.random(20, 40),
}

Config.BlacklistedScenarios = {
    ['TYPES'] = {
        "WORLD_VEHICLE_MILITARY_PLANES_SMALL",
        "WORLD_VEHICLE_MILITARY_PLANES_BIG",
    },
    ['GROUPS'] = {
        2017590552,
        2141866469,
        1409640232,
        `ng_planes`,
    }
}

Config.DamageWeapons = {
    ["WEAPON_BAT"] = 0.4,
    ["WEAPON_KNIFE"] = 0.5,
    ["WEAPON_FLASHLIGHT"] = 0.4,
    ["WEAPON_NIGHTSTICK"] = 0.4,
    ["WEAPON_DAGGER"] = 0.3,
    ["WEAPON_BOTTLE"] = 0.3,
    ["WEAPON_CROWBAR"] = 0.3,
    ["WEAPON_UNARMED"] = 0.3,
    ["WEAPON_GOLFCLUB"] = 0.3,
    ["WEAPON_HAMMER"] = 0.3,
    ["WEAPON_HATCHET"] = 0.3,
    ["WEAPON_KNUCKLE"] = 0.3,
    ["WEAPON_MACHETE"] = 0.3,
    ["WEAPON_SWITCHBLADE"] = 0.3,
    ["WEAPON_WRENCH"] = 0.3,
    ["WEAPON_BATTLEAXE"] = 0.3,
    ["WEAPON_POOLCUE"] = 0.3,
    ["WEAPON_STONE_HATCHET"] = 0.3,
    ["WEAPON_REVOLVER"] = 1.0,
    ["WEAPON_REVOLVER_MK2"] = 1.0,
    ["WEAPON_MICROSMG"] = 1.19,
    ["WEAPON_MACHINEPISTOL"] = 1.15,
    ["WEAPON_MINISMG"] = 1.16,
    ["WEAPON_ASSAULTSMG"] = 1.13,
    ["WEAPON_SMG"] = 1.10,
    ["WEAPON_SMG_MK2"] = 1.13,
    ["WEAPON_COMBATPDW"] = 1.02,
    ["WEAPON_GUSENBERG"] = 1.05,
    ["WEAPON_VINTAGEPISTOL"] = 1.10,
    ["WEAPON_APPISTOL"] = 1.17,
    ["WEAPON_HEAVYPISTOL"] = 1.19,
    ["WEAPON_COMBATPISTOL"] = 1.12,
    ["WEAPON_PISTOL"] = 1.09,
    ["WEAPON_SNSPISTOL"] = 1.0,
    ["WEAPON_PISTOL_MK2"] = 1.18,
    ["WEAPON_STUNGUN"] = 0.0,
    ["WEAPON_SMOKEGRENADE"] = 0.1,
    ["WEAPON_SNOWBALL"] = 0.0,
    ["WEAPON_HIT_BY_WATER_CANNON"] = 0.0,     
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
