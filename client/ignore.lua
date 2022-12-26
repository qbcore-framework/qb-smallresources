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
	Wait(500) -- Give the entity some time to be created
	local _, handle = GetClosestPed(x, y, z, 1.0) -- Get the entity handle
	SetPedDropsWeaponsWhenDead(handle, false)
end)

CreateThread(function() -- all these should only need to be called once
	if Config.DisableAmbience then
		StartAudioScene("CHARACTER_CHANGE_IN_SKY_SCENE")
		SetAudioFlag("DisableFlightMusic", true)
	end
	SetAudioFlag("PoliceScannerDisabled", true)
	SetGarbageTrucks(false)
	SetCreateRandomCops(false)
	SetCreateRandomCopsNotOnScenarios(false)
	SetCreateRandomCopsOnScenarios(false)
	DistantCopCarSirens(false)
	RemoveVehiclesFromGeneratorsInArea(335.2616 - 300.0, -1432.455 - 300.0, 46.51 - 300.0, 335.2616 + 300.0, -1432.455 + 300.0, 46.51 + 300.0) -- central los santos medical center
	RemoveVehiclesFromGeneratorsInArea(441.8465 - 500.0, -987.99 - 500.0, 30.68 -500.0, 441.8465 + 500.0, -987.99 + 500.0, 30.68 + 500.0) -- police station mission row
	RemoveVehiclesFromGeneratorsInArea(316.79 - 300.0, -592.36 - 300.0, 43.28 - 300.0, 316.79 + 300.0, -592.36 + 300.0, 43.28 + 300.0) -- pillbox
	RemoveVehiclesFromGeneratorsInArea(-2150.44 - 500.0, 3075.99 - 500.0, 32.8 - 500.0, -2150.44 + 500.0, -3075.99 + 500.0, 32.8 + 500.0) -- military
	RemoveVehiclesFromGeneratorsInArea(-1108.35 - 300.0, 4920.64 - 300.0, 217.2 - 300.0, -1108.35 + 300.0, 4920.64 + 300.0, 217.2 + 300.0) -- nudist
	RemoveVehiclesFromGeneratorsInArea(-458.24 - 300.0, 6019.81 - 300.0, 31.34 - 300.0, -458.24 + 300.0, 6019.81 + 300.0, 31.34 + 300.0) -- police station paleto
	RemoveVehiclesFromGeneratorsInArea(1854.82 - 300.0, 3679.4 - 300.0, 33.82 - 300.0, 1854.82 + 300.0, 3679.4 + 300.0, 33.82 + 300.0) -- police station sandy
	RemoveVehiclesFromGeneratorsInArea(-724.46 - 300.0, -1444.03 - 300.0, 5.0 - 300.0, -724.46 + 300.0, -1444.03 + 300.0, 5.0 + 300.0) -- REMOVE CHOPPERS WOW
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
	for dispatchService, enabled in pairs(Config.DispatchServices) do
		EnableDispatchService(dispatchService, enabled)
	end

	local wantedLevel = 0
	if Config.EnableWantedLevel then
		wantedLevel = 5
	end

	SetMaxWantedLevel(wantedLevel)
end)

if Config.IdleCamera then --Disable Idle Cinamatic Cam
    DisableIdleCamera(true)
end

RegisterNetEvent('QBCore:Client:DrawWeapon', function()
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
                    SetPedInfiniteAmmo(ped, true, weapon)
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

CreateThread(function()
    while Config.AntiCombatRoll do
        Wait(5)
        if IsAimCamActive(bool) then
            if IsPedArmed(GetPlayerPed(-1), 4 | 2) then 
                DisableControlAction(0, 22, true)
            end
        end
    end
end)

local vehicleClassDisableControl = {
	[0] = true, --compacts
	[1] = true, --sedans
	[2] = true, --SUV's
	[3] = true, --coupes
	[4] = true, --muscle
	[5] = true, --sport classic
	[6] = true, --sport
	[7] = true, --super
	[8] = false, --motorcycle
	[9] = true, --offroad
	[10] = true, --industrial
	[11] = true, --utility
	[12] = true, --vans
	[13] = false, --bicycles
	[14] = false, --boats
	[15] = false, --helicopter
	[16] = false, --plane
	[17] = true, --service
	[18] = true, --emergency
	[19] = false --military
}
	
-- Main thread
CreateThread(function()
	while Config.MidAirVehControl do
	-- Loop forever and update every frame
	Wait(0)	
		-- Get player, vehicle and vehicle class
		local player = GetPlayerPed(-1)
		local vehicle = GetVehiclePedIsIn(player, false)
		local vehicleClass = GetVehicleClass(vehicle)

		-- Disable control if player is in the driver seat and vehicle class matches array
		if ((GetPedInVehicleSeat(vehicle, -1) == player) and vehicleClassDisableControl[vehicleClass]) then
			-- Check if vehicle is in the air and disable L/R and UP/DN controls
			if IsEntityInAir(vehicle) then
				DisableControlAction(2, 59)
				DisableControlAction(2, 60)
			end
		end
	end
end)
