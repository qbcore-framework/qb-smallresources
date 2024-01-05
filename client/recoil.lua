local weapons = {
	['WEAPON_FLAREGUN'] = {recoil = 0.9, shake = 0.04},
	['WEAPON_PISTOL'] = {recoil = 0.3, shake = 0.06}, 
	['WEAPON_PISTOL_MK2'] = {recoil = 0.3, shake = 0.03}, 
	['WEAPON_COMBATPISTOL'] = {recoil = 0.3, shake = 0.03},
	['WEAPON_APPISTOL'] = {recoil = 0.38, shake = 0.35},
	['WEAPON_PISTOL50'] = {recoil = 0.57, shake = 0.05},
	['WEAPON_VINTAGEPISTOL'] = {recoil = 0.4, shake = 0.025},
	['WEAPON_HEAVYPISTOL'] = {recoil = 0.4, shake = 0.04},
	['WEAPON_STUNGUN'] = {recoil = 0.1, shake = 0.01},
	['WEAPON_SNSPISTOL'] = {recoil = 0.2, shake = 0.02},
	['WEAPON_SNSPISTOL_MK2'] = {recoil = 0.25, shake = 0.035}, 
	['WEAPON_MARKSMANPISTOL'] = {recoil = 0.9, shake = 0.04},
	['WEAPON_MACHINEPISTOL'] = {recoil = 0.3, shake = 0.04},
	['WEAPON_REVOLVER'] = {recoil = 0.6, shake = 0.05}, 
	['WEAPON_REVOLVER_MK2'] = {recoil = 0.65, shake = 0.055}, 
	['WEAPON_MINISMG'] = {recoil = 0.2, shake = 0.03}, 
	['WEAPON_MICROSMG'] = {recoil = 0.2, shake = 0.05},
	['WEAPON_SMG'] = {recoil = 0.1, shake = 0.065}, 
	['WEAPON_SMG_MK2'] = {recoil = 0.1, shake = 0.075},
	['WEAPON_ASSAULTSMG'] = {recoil = 0.1, shake = 0.050},
	['WEAPON_ASSAULTRIFLE'] = {recoil = 0.2, shake = 0.07},
	['WEAPON_ASSAULTRIFLE_MK2'] = {recoil = 0.2, shake = 0.072},
	['WEAPON_CARBINERIFLE'] = {recoil = 0.2, shake = 0.06}, 
	['WEAPON_CARBINERIFLE_MK2'] = {recoil = 0.1, shake = 0.065},
	['WEAPON_ADVANCED_RIFLE'] = {recoil = 0.1, shake = 0.06},
	['WEAPON_COMPACTRIFLE'] = {recoil = 0.3, shake = 0.03}, 
	['WEAPON_COMBATMG'] = {recoil = 0.1, shake = 0.08},
	['WEAPON_COMBATMG_MK2'] = {recoil = 0.1, shake = 0.085},
	['WEAPON_COMBATPDW'] = {recoil = 0.2, shake = 0.05},
	['WEAPON_BULLPUPRIFLE'] = {recoil = 0.2, shake = 0.05},
	['WEAPON_BULLPUPRIFLE_MK2'] = {recoil = 0.25, shake = 0.045},
	['WEAPON_PUMPSHOTGUN'] = {recoil = 0.4, shake = 0.07},
	['WEAPON_PUMPSHOTGUN_MK2'] = {recoil = 0.4, shake = 0.095},
	['WEAPON_SAWNOFFSHOTGUN'] = {recoil = 0.7, shake = 0.06},
	['WEAPON_ASSAULTSHOTGUN'] = {recoil = 0.4, shake = 0.12}, 
	['WEAPON_BULLPUPSHOTGUN'] = {recoil = 0.2, shake = 0.08},
	['WEAPON_SPECIALCARBINE'] = {recoil = 0.2, shake = 0.06},
	['WEAPON_SPECIALCARBINE_MK2'] = {recoil = 0.25, shake = 0.085},
	['WEAPON_DOUBLEACTION'] = {recoil = 0.4, shake = 0.025},
	['WEAPON_HEAVYSHOTGUN'] = {recoil = 0.2, shake = 0.13},
	['WEAPON_DBSHOTGUN'] = {recoil = 0.7, shake = 0.04}, 
	['WEAPON_AUTOSHOTGUN'] = {recoil = 0.2, shake = 0.04},
}

for k,v in pairs(weapons) do
    weapons[GetHashKey(k)] = v
end

AddEventHandler('CEventGunShot', function (entity, ped, coords)
    if PlayerPedId() ~= ped then return end
	local ped = PlayerPedId()
    if not weapons[GetSelectedPedWeapon(ped)] then return end
    local tv = 0
    local p
    local cfg = weapons[GetSelectedPedWeapon(ped)]
    if cfg.recoil then
        if GetFollowPedCamViewMode() ~= 4 then
            if cfg.shake then
                ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', cfg.shake)
            end
			repeat
                if IsPedInAnyVehicle(ped) then return end
				Wait(0)
				SetWeaponAnimationOverride(ped, GetHashKey('Default'))
				p = GetGameplayCamRelativePitch()
				SetGameplayCamRelativePitch(p + 0.1, 0.5)
				tv = tv + 0.1
			until tv >= cfg.recoil
		else
            if cfg.shake then
                ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', cfg.shake)
            end
			repeat
                if IsPedInAnyVehicle(ped) then return end
				Wait(0)
				SetWeaponAnimationOverride(ped, GetHashKey('FirstPersonAiming'))
				p = GetGameplayCamRelativePitch()
				if cfg.recoil > 0.1 then
					SetGameplayCamRelativePitch(p + 0.6, 1.2)
					tv = tv + 0.6
				else
					SetGameplayCamRelativePitch(p + 0.016, 0.333)
					tv = tv + 0.1
				end
			until tv >= cfg.recoil
		end
    end    
end)
