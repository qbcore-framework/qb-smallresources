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

RegisterNetEvent('qb-carwash:client:washCar', function()
    local PlayerPed = PlayerPedId()
    local PedVehicle = GetVehiclePedIsIn(PlayerPed)
    washingVehicle = true
    QBCore.Functions.Progressbar("search_cabin", "Vehicle is being washed ..", math.random(4000, 8000), false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        SetVehicleDirtLevel(PedVehicle)
        SetVehicleUndriveable(PedVehicle, false)
        WashDecalsFromVehicle(PedVehicle, 1.0)
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
        if IsPedInAnyVehicle(PlayerPed) then
            for k, v in pairs(Config.Locations) do
                local dist = #(PlayerPos - vector3(Config.Locations[k]["coords"]["x"], Config.Locations[k]["coords"]["y"], Config.Locations[k]["coords"]["z"]))
                if dist <= 10 then
                    inRange = true
                    if dist <= 7.5 then
                        if Driver == PlayerPed then
                            if not washingVehicle then
                                DrawText3Ds(Config.Locations[k]["coords"]["x"], Config.Locations[k]["coords"]["y"], Config.Locations[k]["coords"]["z"], '~g~E~w~ - Washing car ($'..Config.DefaultPrice..')')
                                if IsControlJustPressed(0, 38) then
                                    TriggerServerEvent('qb-carwash:server:washCar')
                                end
                            else
                                DrawText3Ds(Config.Locations[k]["coords"]["x"], Config.Locations[k]["coords"]["y"], Config.Locations[k]["coords"]["z"], 'The car wash is not available ..')
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

CreateThread(function()
	local currentCarwashBlip = 0

	while true do
		local coords = GetEntityCoords(PlayerPedId())
		local closest = 1000
		local closestCoords

		for _, carWashCoords in pairs(Config.Locations) do
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
