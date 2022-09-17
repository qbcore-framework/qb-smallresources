local QBCore = exports['qb-core']:GetCoreObject()
local washingVehicle = false
local WashPlaces = {}
local enableButton = false

RegisterNetEvent('qb-carwash:client:washCar', function()
    local PlayerPed = PlayerPedId()
    local PedVehicle = GetVehiclePedIsIn(PlayerPed, false)
    washingVehicle = true
    QBCore.Functions.Progressbar("search_cabin", "Vehicle is being washed ..", math.random(4000, 8000), false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        SetVehicleDirtLevel(PedVehicle, 0.0)
        SetVehicleUndriveable(PedVehicle, false)
        WashDecalsFromVehicle(PedVehicle, 1.0)
        washingVehicle = false
    end, function() -- Cancel
        QBCore.Functions.Notify("Washing canceled ..", "error")
        washingVehicle = false
    end)
end)

CreateThread(function()
    Wait(1000)
    for k in pairs(Config.CarWash) do
        local el = Config.CarWash[k]
        WashPlaces[k] = BoxZone:Create(el["coords"].xyz, el["width"] or 5, 10, {
            name = "CarWash" .. k,
         --   debugPoly = true,
            minZ = el.coords.z - 1,
            maxZ = el.coords.z + 3,
            heading = el["coords"].w
        })
        WashPlaces[k]:onPlayerInOut(function(isPointInside)
            if isPointInside then
                enableButton = true
                exports["qb-core"]:DrawText(("Washing car $ %s"):format(Config.DefaultPrice))
            else
                enableButton = false
                exports["qb-core"]:HideText()
            end
        end)
        -- No need for another loop just for the Blips
        Wait(200)
        local carWash = AddBlipForCoord(el["coords"].x, el["coords"].y, el["coords"].z)
        SetBlipSprite(carWash, 100)
        SetBlipDisplay(carWash, 4)
        SetBlipScale(carWash, 0.75)
        SetBlipAsShortRange(carWash, true)
        SetBlipColour(carWash, 37)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName(el["label"])
        EndTextCommandSetBlipName(carWash)
    end
end)

RegisterCommand("+CleanVehicle", function()
    if enableButton and not washingVehicle then
        local PlayerPed = PlayerPedId()
        local PedVehicle = GetVehiclePedIsIn(PlayerPed, false)
        local Driver = GetPedInVehicleSeat(PedVehicle, -1)
        local dirtLevel = GetVehicleDirtLevel(PedVehicle)
        if PedVehicle ~= 0 and Driver == PlayerPed then
            if dirtLevel > Config.DirtLevel then
                TriggerServerEvent('qb-carwash:server:washCar')
                exports["qb-core"]:ChangeText("The car wash is not available")
            else
                exports["qb-core"]:HideText()
                QBCore.Functions.Notify("The vehicle isn't dirty", 'error')
            end
        end
    end
end)

RegisterKeyMapping("+CleanVehicle", "Function", "keyboard", "e")
