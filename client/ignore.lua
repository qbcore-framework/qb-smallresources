Citizen.CreateThread(function()
    while true do
        for _, sctyp in next, Config.BlacklistedScenarios['TYPES'] do
            SetScenarioTypeEnabled(sctyp, false)
        end
        for _, scgrp in next, Config.BlacklistedScenarios['GROUPS'] do
            SetScenarioGroupEnabled(scgrp, false)
        end
		for _, carmdl in next, Config.BlacklistedVehs do
			SetVehicleModelIsSuppressed(carmdl, true)
		end
		Citizen.Wait(10000)
    end
end)

Citizen.CreateThread(function()
    StartAudioScene("CHARACTER_CHANGE_IN_SKY_SCENE")
    SetAudioFlag("PoliceScannerDisabled", true)
    while true do
	    local playerPed = PlayerPedId()
		local pos = GetEntityCoords(playerPed) 
		SetGarbageTrucks(0)
		SetCreateRandomCops(0)
		SetCreateRandomCopsNotOnScenarios(0)
		SetCreateRandomCopsOnScenarios(0)
		DistantCopCarSirens(0)
		CancelCurrentPoliceReport()
		RemoveVehiclesFromGeneratorsInArea(335.2616 - 300.0, -1432.455 - 300.0, 46.51 - 300.0, 335.2616 + 300.0, -1432.455 + 300.0, 46.51 + 300.0) -- central los santos medical center
		RemoveVehiclesFromGeneratorsInArea(441.8465 - 500.0, -987.99 - 500.0, 30.68 -500.0, 441.8465 + 500.0, -987.99 + 500.0, 30.68 + 500.0) -- police station mission row
		RemoveVehiclesFromGeneratorsInArea(316.79 - 300.0, -592.36 - 300.0, 43.28 - 300.0, 316.79 + 300.0, -592.36 + 300.0, 43.28 + 300.0) -- pillbox
		RemoveVehiclesFromGeneratorsInArea(-2150.44 - 500.0, 3075.99 - 500.0, 32.8 - 500.0, -2150.44 + 500.0, -3075.99 + 500.0, 32.8 + 500.0) -- military
		RemoveVehiclesFromGeneratorsInArea(-1108.35 - 300.0, 4920.64 - 300.0, 217.2 - 300.0, -1108.35 + 300.0, 4920.64 + 300.0, 217.2 + 300.0) -- nudist
		RemoveVehiclesFromGeneratorsInArea(-458.24 - 300.0, 6019.81 - 300.0, 31.34 - 300.0, -458.24 + 300.0, 6019.81 + 300.0, 31.34 + 300.0) -- police station paleto
		RemoveVehiclesFromGeneratorsInArea(1854.82 - 300.0, 3679.4 - 300.0, 33.82 - 300.0, 1854.82 + 300.0, 3679.4 + 300.0, 33.82 + 300.0) -- police station sandy
		RemoveVehiclesFromGeneratorsInArea(-724.46 - 300.0, -1444.03 - 300.0, 5.0 - 300.0, -724.46 + 300.0, -1444.03 + 300.0, 5.0 + 300.0) -- REMOVE CHOPPERS WOW
    	Citizen.Wait(10)
	end
end)

Citizen.CreateThread(function()
	while true do
		for k, v in pairs(Config.BlacklistedPeds) do
			SetPedModelIsSuppressed(k, true)
		end
		Citizen.Wait(3)
	end
end)

Citizen.CreateThread(function()
	local pedPool = GetGamePool('CPed')
	for k,v in pairs(pedPool) do
		SetPedDropsWeaponsWhenDead(v, false)
		if Config.BlacklistedPeds[GetEntityModel(v)] then
			DeleteEntity(v)
		end
	end
	Citizen.Wait(500)
end)

Citizen.CreateThread(function()
    while true do
        local vehiclePool = GetGamePool('CVehicle')
        for k,v in pairs(vehiclePool) do
            SetPedDropsWeaponsWhenDead(v, false)
            if Config.BlacklistedVehs[GetEntityModel(v)] then
                DeleteEntity(v)
            end
        end
        Citizen.Wait(250)
    end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		local ped = PlayerPedId()
		if IsPedBeingStunned(ped) then
			SetPedMinGroundTimeForStungun(ped, math.random(4000, 7000))
		else
			Citizen.Wait(1000)
		end
	end
end)


Citizen.CreateThread(function()
	while true do
		local player = PlayerId()
		for i = 1, 15 do
			EnableDispatchService(i, false)
		end
		if GetPlayerWantedLevel(player) ~= 0 then
			SetPlayerWantedLevel(player, 0, false)
			SetPlayerWantedLevelNow(player, false)
			SetPlayerWantedLevelNoDrop(player, 0, false)
		else
			Citizen.Wait(500)
		end
		Citizen.Wait(6)
	end
end)

Citizen.CreateThread(function()
    while true do
        local ped = PlayerPedId()
        local weapon = GetSelectedPedWeapon(ped)
		if weapon ~= `WEAPON_UNARMED` then
			if IsPedArmed(ped, 6) then
				DisableControlAction(1, 140, true)
				DisableControlAction(1, 141, true)
				DisableControlAction(1, 142, true)
			end

			if weapon == `WEAPON_FIREEXTINGUISHER` or  weapon == `WEAPON_PETROLCAN` then
				if IsPedShooting(ped) then
					SetPedInfiniteAmmo(ped, true, `WEAPON_FIREEXTINGUISHER`)
					SetPedInfiniteAmmo(ped, true, `WEAPON_PETROLCAN`)
				end
			end
		else
			Citizen.Wait(500)
		end
        Citizen.Wait(7)
    end
end)
