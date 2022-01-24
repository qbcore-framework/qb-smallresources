local QBCore = exports['qb-core']:GetCoreObject()
local washingVehicle = false

local function DrawText3Ds(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

local function CreateBlip(coords)
	local blip = AddBlipForCoord(coords)
	SetBlipSprite(blip, 100)
	SetBlipScale(blip, 0.75)
	SetBlipColour(blip, 37)
	SetBlipDisplay(blip, 4)
	SetBlipAsShortRange(blip, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Hands Free Carwash")
	EndTextCommandSetBlipName(blip)

	return blip
end

RegisterNetEvent('qb-carwash:client:washCar', function()
    local PlayerPed = PlayerPedId()
    local PedVehicle = GetVehiclePedIsIn(PlayerPed)
	local coords = GetEntityCoords(PlayerPed)
    washingVehicle = true
	QBCore.Functions.LoadParticleDictionary("core")
    UseParticleFxAssetNextCall("core")
    particles1  = StartParticleFxLoopedAtCoord("ent_amb_waterfall_splash_p", coords.x, coords.y, coords.z, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
	UseParticleFxAssetNextCall("core")
	particles2  = StartParticleFxLoopedAtCoord("ent_amb_waterfall_splash_p", coords.x + 2, coords.y, coords.z, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
    QBCore.Functions.Progressbar("search_cabin", "Vehicle is being washed ..", math.random(4000, 8000), false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        SetVehicleDirtLevel(PedVehicle)
        SetVehicleUndriveable(PedVehicle, false)
        WashDecalsFromVehicle(PedVehicle, 1.0)
        StopParticleFxLooped(particles1, 0)
        StopParticleFxLooped(particles2, 0)
        washingVehicle = false
    end, function() -- Cancel
        QBCore.Functions.Notify("Washing canceled ..", "error")
        washingVehicle = false
    end)
end)

CreateThread(function()
    while true do
        local inRange = false
        local PlayerPed = PlayerPedId()
        local PlayerPos = GetEntityCoords(PlayerPed)
        local PedVehicle = GetVehiclePedIsIn(PlayerPed)
        local Driver = GetPedInVehicleSeat(PedVehicle, -1)
        local dirtLevel = GetVehicleDirtLevel(PedVehicle)
        if IsPedInAnyVehicle(PlayerPed) then
            for k, v in pairs(Config.CarWash) do
                local dist = #(PlayerPos - vector3(Config.CarWash[k]["coords"]["x"], Config.CarWash[k]["coords"]["y"], Config.CarWash[k]["coords"]["z"]))
                if dist <= 10 then
                    inRange = true
                    if dist <= 7.5 then
                        if Driver == PlayerPed then
                            if not washingVehicle then
                                DrawText3Ds(Config.CarWash[k]["coords"]["x"], Config.CarWash[k]["coords"]["y"], Config.CarWash[k]["coords"]["z"], '~g~E~w~ - Washing car ($'..Config.DefaultPrice..')')
                                if IsControlJustPressed(0, 38) then
                                    if dirtLevel > Config.DirtLevel then
                                        TriggerServerEvent('qb-carwash:server:washCar')
                                    else
                                        QBCore.Functions.Notify("The vehicle isn't dirty", 'error')
                                    end
                                end
                            else
                                DrawText3Ds(Config.CarWash[k]["coords"]["x"], Config.CarWash[k]["coords"]["y"], Config.CarWash[k]["coords"]["z"], 'The car wash is not available ..')
                            end
                        end
                    end
                end
            end
        end
        if not inRange then
            Wait(5000)
        end
        Wait(3)
    end
end)

CreateThread(function()
	local currentCarwashBlip = 0

	while true do
		local coords = GetEntityCoords(PlayerPedId())
		local closest = 1000
		local closestCoords

		for _, carWashCoords in pairs(Config.CarWash) do
			local dstcheck = #(coords - carWashCoords)

			if dstcheck < closest then
				closest = dstcheck
				closestCoords = carWashCoords
			end
		end

		if DoesBlipExist(currentCarwashBlip) then
			RemoveBlip(currentCarwashBlip)
		end

		currentCarwashBlip = CreateBlip(closestCoords)
		Wait(10000)
	end
end)
