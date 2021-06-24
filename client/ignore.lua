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

local entityEnumerator = {
	__gc = function(enum)
		if enum.destructor and enum.handle then
			enum.destructor(enum.handle)
		end

		enum.destructor = nil
		enum.handle = nil
	end
}

local function EnumerateEntities(initFunc, moveFunc, disposeFunc)
	return coroutine.wrap(function()
		local iter, id = initFunc()
		if not id or id == 0 then
			disposeFunc(iter)
			return
		end

		local enum = {handle = iter, destructor = disposeFunc}
		setmetatable(enum, entityEnumerator)

		local next = true
		repeat
		coroutine.yield(id)
		next, id = moveFunc(iter)
		until not next

		enum.destructor, enum.handle = nil, nil
		disposeFunc(iter)
	end)
end

function EnumerateVehicles()
	return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end

function EnumeratePeds()
	return EnumerateEntities(FindFirstPed, FindNextPed, EndFindPed)
end

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
		SetAllLowPriorityVehicleGeneratorsActive(0.0)
		RemoveVehiclesFromGeneratorsInArea(335.2616 - 300.0, -1432.455 - 300.0, 46.51 - 300.0, 335.2616 + 300.0, -1432.455 + 300.0, 46.51 + 300.0) -- ziekenhuis
		RemoveVehiclesFromGeneratorsInArea(441.8465 - 500.0, -987.99 - 500.0, 30.68 -500.0, 441.8465 + 500.0, -987.99 + 500.0, 30.68 + 500.0) -- politie bureau
		RemoveVehiclesFromGeneratorsInArea(316.79 - 300.0, -592.36 - 300.0, 43.28 - 300.0, 316.79 + 300.0, -592.36 + 300.0, 43.28 + 300.0) -- pillbox
		RemoveVehiclesFromGeneratorsInArea(-2150.44 - 500.0, 3075.99 - 500.0, 32.8 - 500.0, -2150.44 + 500.0, -3075.99 + 500.0, 32.8 + 500.0) -- military
		RemoveVehiclesFromGeneratorsInArea(-1108.35 - 300.0, 4920.64 - 300.0, 217.2 - 300.0, -1108.35 + 300.0, 4920.64 + 300.0, 217.2 + 300.0) -- nudist
		RemoveVehiclesFromGeneratorsInArea(-458.24 - 300.0, 6019.81 - 300.0, 31.34 - 300.0, -458.24 + 300.0, 6019.81 + 300.0, 31.34 + 300.0) -- politie bureau paleto
		RemoveVehiclesFromGeneratorsInArea(1854.82 - 300.0, 3679.4 - 300.0, 33.82 - 300.0, 1854.82 + 300.0, 3679.4 + 300.0, 33.82 + 300.0) -- politie bureau sandy
		RemoveVehiclesFromGeneratorsInArea(-724.46 - 300.0, -1444.03 - 300.0, 5.0 - 300.0, -724.46 + 300.0, -1444.03 + 300.0, 5.0 + 300.0) -- REMOVE CHOPPERS WOW

    	Citizen.Wait(10)
	end
end)

Citizen.CreateThread(function()
	for ped in EnumeratePeds() do
		SetPedDropsWeaponsWhenDead(ped, false)
		if Config.BlacklistedPeds[GetEntityModel(ped)] then
			DeleteEntity(ped)
		end
	end
	Citizen.Wait(500)
end)

Citizen.CreateThread(function()
	while true do

		for k, v in pairs(Config.BlacklistedPeds) do
			SetVehicleModelIsSuppressed(k, true)
		end

		Citizen.Wait(3)
	end
end)

Citizen.CreateThread(function()
	while true do
		for veh in EnumerateVehicles() do
			if Config.BlacklistedVehs[GetEntityModel(veh)] then
				DeleteEntity(veh)
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

		if weapon ~= GetHashKey("WEAPON_UNARMED") then
			if IsPedArmed(ped, 6) then
				DisableControlAction(1, 140, true)
				DisableControlAction(1, 141, true)
				DisableControlAction(1, 142, true)
			end

			if weapon == GetHashKey("WEAPON_FIREEXTINGUISHER") or  weapon == GetHashKey("WEAPON_PETROLCAN") then
				if IsPedShooting(ped) then
					SetPedInfiniteAmmo(ped, true, GetHashKey("WEAPON_FIREEXTINGUISHER"))
					SetPedInfiniteAmmo(ped, true, GetHashKey("WEAPON_PETROLCAN"))
				end
			end
		else
			Citizen.Wait(500)
		end

        Citizen.Wait(7)
    end
end)
