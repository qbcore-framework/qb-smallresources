local QBCore = exports['qb-core']:GetCoreObject()
local washingVeh, listen = false, false
local washPoly = {}

local function washLoop()
    CreateThread(function()
        while listen do
            local ped = PlayerPedId()
            local veh = GetVehiclePedIsIn(ped, false)
            local driver = GetPedInVehicleSeat(veh, -1)
            local dirtLevel = GetVehicleDirtLevel(veh)
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
    local veh = GetVehiclePedIsIn(ped, false)
    washingVeh = true
    QBCore.Functions.Progressbar('search_cabin', Lang:t('wash.in_progress'), math.random(4000, 8000), false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        SetVehicleDirtLevel(veh, 0.0)
        SetVehicleUndriveable(veh, false)
        WashDecalsFromVehicle(veh, 1.0)
        washingVeh = false
    end, function() -- Cancel
        QBCore.Functions.Notify(Lang:t('wash.cancel'), 'error')
        washingVeh = false
    end)
end)

CreateThread(function()
    for k, v in pairs(Config.CarWash.locations) do
        if Config.UseTarget then
            exports["qb-target"]:AddBoxZone('carwash_'..k, v.coords, v.length, v.width, {
                name = 'carwash_'..k,
                debugPoly = false,
                heading = v.heading,
                minZ = v.coords.z - 5,
                maxZ = v.coords.z + 5,
            }, {
                    options = {
                        {
                            icon = "fa-car-wash",
                            label = Lang:t('wash.wash_vehicle_target'),
                            action = function()
                                local ped = PlayerPedId()
                                local veh = GetVehiclePedIsIn(ped, false)
                                local driver = GetPedInVehicleSeat(veh, -1)
                                local dirtLevel = GetVehicleDirtLevel(veh)
                                if driver == ped and not washingVeh then
                                    if dirtLevel > Config.CarWash.dirtLevel then
                                        TriggerServerEvent('qb-carwash:server:washCar')
                                    else
                                        QBCore.Functions.Notify(Lang:t('wash.dirty'), 'error')
                                    end
                                end
                            end,
                            canInteract = function()
                                if IsPedInAnyVehicle(PlayerPedId(), false) then return true end
                            end,
                        }
                    },
                distance = 3
            })
        else
            washPoly[#washPoly + 1] = BoxZone:Create(vector3(v.coords.x, v.coords.y, v.coords.z), v.length, v.width, {
                heading = v.heading,
                name = 'carwash',
                debugPoly = false,
                minZ = v.coords.z - 5,
                maxZ = v.coords.z + 5,
            })
            local washCombo = ComboZone:Create(washPoly, {name = "washPoly"})
            washCombo:onPlayerInOut(function(isPointInside)
                if isPointInside and IsPedInAnyVehicle(PlayerPedId(), false) then
                    exports['qb-core']:DrawText(Lang:t('wash.wash_vehicle'),'left')
                    if not listen then
                        listen = true
                        washLoop()
                    end
                else
                    listen = false
                    exports['qb-core']:HideText()
                end
            end)
        end
    end
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