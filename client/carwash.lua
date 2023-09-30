local QBCore = exports['qb-core']:GetCoreObject()
local washingVeh = false
local listen = false
local washPoly = {}

local function washLoop()
    CreateThread(function()
        while listen do
            local ped = PlayerPedId()
            local pedVeh = GetVehiclePedIsIn(ped, false)
            local driver = GetPedInVehicleSeat(pedVeh, -1)
            local dirtLevel = GetVehicleDirtLevel(pedVeh)
            if driver == ped and not washingVeh then
                if IsControlPressed(0, 38) then
                    if dirtLevel > Config.CarWash.dirtLevel then
                        TriggerServerEvent('qb-carwash:server:washCar')
                    else
                        QBCore.Functions.Notify(Lang:t('wash.dirty'), 'error')
                    end
                    listen = false
                    break
                end
            end
            Wait(0)
        end
    end)
end

RegisterNetEvent('qb-carwash:client:washCar', function()
    local ped = PlayerPedId()
    local pedVeh = GetVehiclePedIsIn(ped, false)
    washingVeh = true
    QBCore.Functions.Progressbar('search_cabin', Lang:t('wash.in_progress'), math.random(4000, 8000), false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        SetVehicleDirtLevel(pedVeh, 0.0)
        SetVehicleUndriveable(pedVeh, false)
        WashDecalsFromVehicle(pedVeh, 1.0)
        washingVeh = false
    end, function() -- Cancel
        QBCore.Functions.Notify(Lang:t('wash.cancel'), 'error')
        washingVeh = false
    end)
end)

CreateThread(function()
    for k, v in pairs(Config.CarWash.locations) do
            while listen do
                local ped = PlayerPedId()
                local pedVeh = GetVehiclePedIsIn(ped, false)
                local driver = GetPedInVehicleSeat(pedVeh, -1)
                local dirtLevel = GetVehicleDirtLevel(pedVeh)
                if driver == ped and not washingVeh then
                    if IsControlPressed(0, 38) then
                        if dirtLevel > Config.CarWash.dirtLevel then
                            TriggerServerEvent('qb-carwash:server:washCar')
                        else
                            QBCore.Functions.Notify(Lang:t('wash.dirty'), 'error')
                        end
                        listen = false
                        break
                    end
                end
                Wait(0)
            end
        end
    --end
end)

CreateThread(function()
    for k in pairs(Config.CarWash.locations) do
        local carWash = AddBlipForCoord(Config.CarWash.locations[k].coords.x, Config.CarWash.locations[k].coords.y, Config.CarWash.locations[k].coords.z)
        SetBlipSprite (carWash, 100)
        SetBlipDisplay(carWash, 4)
        SetBlipScale  (carWash, 0.75)
        SetBlipAsShortRange(carWash, true)
        SetBlipColour(carWash, 37)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentSubstringPlayerName('Hands Free Carwash')
        EndTextCommandSetBlipName(carWash)
    end
end)