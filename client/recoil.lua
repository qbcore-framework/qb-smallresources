local recoils = {
-- resource : https://wiki.gtanet.work/index.php?title=Weapons_Models

-- pistol
	[453432689] = 1.0, -- Pistol
	[3219281620] = 1.0, -- PistolMk2
	[1593441988] = 1.0, -- CombatPistol
	[-1716589765] = 2.0, -- Pistol50
	[-1076751822] = 0.5, -- SNSPistol
	[-771403250] = 0.5, -- HeavyPistol
	[137902532] = 1.0, -- VintagePistol
	[-598887786] = 0.9, -- MarksmanPistol
	[-1045183535] = 1.85, -- Revolver
	[584646201] = 2.5, -- APPistol
	[911657153] = 0.1, -- StunGun
	[1198879012] = 0.9, -- FlareGun

-- SMG
	[324215364] = 0.2, -- MicroSMG
	[-619010992] = 1.0, -- MachinePistol
	[736523883] = 1.2, -- SMG
	[2024373456] = 0.1, -- SMGMk2
	[-270015777] = 1.2, -- AssaultSMG
	[171789620] = 0.2, -- CombatPDW
	[-1660422300] = 0.1, -- MG
	[2144741730] = 0.1, -- CombatMG
	[3686625920] = 0.1, -- CombatMGMk2
	[1627465347] = 0.1, -- Gusenberg
	[-1121678507] = 1.4, -- MiniSMG

-- Rifle
	[-1074790547] = 0.2, -- AssaultRifle
	[961495388] = 0.2, -- AssaultRifleMk2
	[-2084633992] = 0.1, -- CarbineRifle
	[4208062921] = 0.1, -- CarbineRifleMk2
	[-1357824103] = 0.1, -- AdvancedRifle
	[-1063057011] = 0.2, -- SpecialCarbine
	[2132975508] = 0.2, -- BullpupRifle
	[1649403952] = 0.3, -- CompactRifle

-- Sniper
	[100416529] = 0.5, -- SniperRifle
	[205991906] = 0.7, -- HeavySniper
	[177293209] = 0.7, -- HeavySniperMk2
	[-952879014] = 0.35, -- MarksmanRifle	

-- Shotgun
	[487013001] = 0.4, -- PumpShotgun
	[2017895192] = 0.7, -- SawnoffShotgun
	[-1654528753] = 0.2, -- BullpupShotgun
	[-494615257] = 0.4, -- AssaultShotgun
	[-1466123874] = 0.7, -- Musket
	[984333226] = 0.2, -- HeavyShotgun
	[-275439685] = 0.7, -- DoubleBarrelShotgun
	[317205821] = 0.2, -- Autoshotgun
	
-- other	
	[-1568386805] = 1.0, -- GrenadeLauncher
	[-1312131151] = 0.0, -- RPG
	[1119849093] = 0.15, -- Minigun
	[2138347493] = 0.3, -- Firework
	[1834241177] = 2.4, -- Railgun
	[1672152130] = 0.0, -- HomingLauncher
	[1305664598] = 1.0, -- GrenadeLauncherSmoke
	[125959754] = 0.5, -- CompactLauncher
}

Citizen.CreateThread(function()
	while true do
		local ped = PlayerPedId()
		if IsPedShooting(ped) and not IsPedDoingDriveby(ped) then
			local _,wep = GetCurrentPedWeapon(ped)
			_,cAmmo = GetAmmoInClip(ped, wep)
			if recoils[wep] and recoils[wep] ~= 0 then
				tv = 0
				if GetFollowPedCamViewMode() ~= 4 then
					repeat 
						Wait(0)
						p = GetGameplayCamRelativePitch()
						SetGameplayCamRelativePitch(p+0.1, 0.2)
						tv = tv+0.1
					until tv >= recoils[wep]
				else
					repeat 
						Wait(0)
						p = GetGameplayCamRelativePitch()
						if recoils[wep] > 0.1 then
							SetGameplayCamRelativePitch(p+0.6, 1.2)
							tv = tv+0.6
						else
							SetGameplayCamRelativePitch(p+0.016, 0.333)
							tv = tv+0.1
						end
					until tv >= recoils[wep]
				end
			end
		end

		Citizen.Wait(0)
	end
end)
