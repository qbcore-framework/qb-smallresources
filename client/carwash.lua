local washingVehicle = false

RegisterNetEvent('esx-carwash:client:washCar', function()
    local PlayerPed = PlayerPedId()
    local PedVehicle = GetVehiclePedIsIn(PlayerPed)
    washingVehicle = true
    DisableAllControlActions(0)
    Wait(math.random(4000, 8000))
    EnableAllControlActions(0)
    SetVehicleDirtLevel(PedVehicle, 0.0)
    SetVehicleUndriveable(PedVehicle, false)
    WashDecalsFromVehicle(PedVehicle, 1.0)
    washingVehicle = false
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
                local dist = #(PlayerPos - Config.CarWash[k].coords)
                if dist <= 10 then
                    inRange = true
                    if dist <= 7.5 then
                        if Driver == PlayerPed then
                            if not washingVehicle then
                                ESX.Game.Utils.DrawText3D(Config.CarWash[k].coords, '~g~E~w~ - Washing car ($'..Config.DefaultPrice..')')
                                if IsControlJustPressed(0, 38) then
                                    if dirtLevel > Config.DirtLevel then
                                        TriggerServerEvent('esx-carwash:server:washCar')
                                    else
                                        ESX.ShowNotification("The vehicle isn't dirty")
                                    end
                                end
                            else
                                ESX.Game.Utils.DrawText3D(Config.CarWash[k].coords, 'The car wash is not available ..')
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
    for k, v in pairs(Config.CarWash) do
        carWashLocation = Config.CarWash[k].coords
        local carWash = AddBlipForCoord(carWashLocation)
        SetBlipSprite (carWash, 100)
        SetBlipDisplay(carWash, 4)
        SetBlipScale  (carWash, 0.4)
        SetBlipAsShortRange(carWash, true)
        SetBlipColour(carWash, 37)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName(Config.CarWash[k]["label"])
        EndTextCommandSetBlipName(carWash)
    end
end)
