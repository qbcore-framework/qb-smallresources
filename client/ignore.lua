CreateThread(function()
	while true do
		for _, sctyp in next, Config.BlacklistedScenarios['TYPES'] do
			SetScenarioTypeEnabled(sctyp, false)
		end
		for _, scgrp in next, Config.BlacklistedScenarios['GROUPS'] do
			SetScenarioGroupEnabled(scgrp, false)
		end
		Wait(10000)
	end
end)

AddEventHandler("populationPedCreating", function(x, y, z)
	Wait(500)	-- Give the entity some time to be created
	local _, handle = GetClosestPed(x, y, z, 1.0) -- Get the entity handle
	SetPedDropsWeaponsWhenDead(handle, false)
end)

CreateThread(function() -- all these should only need to be called once
	if Config.DisableAmbience then
		StartAudioScene("CHARACTER_CHANGE_IN_SKY_SCENE")
	end
	SetAudioFlag("PoliceScannerDisabled", true)
	SetGarbageTrucks(false)
	SetCreateRandomCops(false)
	SetCreateRandomCopsNotOnScenarios(false)
	SetCreateRandomCopsOnScenarios(false)
	DistantCopCarSirens(false)
	for i,u in pairs(Config.RemoveVehicles) do
		local distance = 300
		for k,v in pairs(Config.RemoveVehicles[i]) do
			if i == 'long_range' then
				distance = 500
			end
	    	RemoveVehiclesFromGeneratorsInArea(v.x-distance,v.y-distance,v.z-distance,v.x+distance,v.y+distance,v.z+distance)
		end
	end
end)

if Config.Stun.active then
	CreateThread(function()
		local sleep
		while true do
			sleep = 1000
			local ped = PlayerPedId()
			if IsPedBeingStunned(ped, 0) then
				sleep = 0
				SetPedMinGroundTimeForStungun(ped, math.random(Config.Stun.min, Config.Stun.max))
			end
			Wait(sleep)
		end
	end)
end


CreateThread(function()
	for i = 1, 15 do
		EnableDispatchService(i, false)
	end

	SetMaxWantedLevel(0)
end)

if Config.IdleCamera then --Disable Idle Cinamatic Cam
	DisableIdleCamera(true)
end

RegisterNetEvent('QBCore:Client:DrawWeapon', function(currentWeapon)
	local sleep
	while true do
		sleep = 500
		local ped = PlayerPedId()
		local weapon = GetSelectedPedWeapon(ped)
		if weapon ~= `WEAPON_UNARMED` then
			if IsPedArmed(ped, 6) then
				sleep = 0
				DisableControlAction(1, 140, true)
				DisableControlAction(1, 141, true)
				DisableControlAction(1, 142, true)
			end

			if weapon == `WEAPON_FIREEXTINGUISHER` or weapon == `WEAPON_PETROLCAN` then
				if IsPedShooting(ped) then
					SetPedInfiniteAmmo(ped, true, `WEAPON_FIREEXTINGUISHER`)
					SetPedInfiniteAmmo(ped, true, `WEAPON_PETROLCAN`)
				end
			end
		else
			break
		end
		Wait(sleep)
	end
end)

CreateThread(function()
	local pedPool = GetGamePool('CPed')
	for _, v in pairs(pedPool) do
		SetPedDropsWeaponsWhenDead(v, false)
	end
end)
