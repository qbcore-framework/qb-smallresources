local QBCore = exports['qb-core']:GetCoreObject()
local seatbeltOn = false
local harnessOn = false
local harnessHp = Config.HarnessUses
local handbrake = 0
local sleep = 0
local harnessData = {}
local newvehicleBodyHealth = 0
local currentvehicleBodyHealth = 0
local frameBodyChange = 0
local lastFrameVehiclespeed = 0
local lastFrameVehiclespeed2 = 0
local thisFrameVehicleSpeed = 0
local tick = 0
local damageDone = false
local modifierDensity = true
local lastVehicle = nil
local veloc

-- Functions

local function ejectFromVehicle()
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped, false)
    local coords = GetOffsetFromEntityInWorldCoords(veh, 1.0, 0.0, 1.0)
    SetEntityCoords(ped, coords.x, coords.y, coords.z)
    Wait(1)
    SetPedToRagdoll(ped, 5511, 5511, 0, 0, 0, 0)
    SetEntityVelocity(ped, veloc.x * 4, veloc.y * 4, veloc.z * 4)
    local ejectspeed = math.ceil(GetEntitySpeed(ped) * 8)
    if GetEntityHealth(ped) - ejectspeed > 0 then
        SetEntityHealth(ped, GetEntityHealth(ped) - ejectspeed)
    elseif GetEntityHealth(ped) ~= 0 then
        SetEntityHealth(ped, 0)
    end
end

local function toggleSeatbelt()
    seatbeltOn = not seatbeltOn
    SeatBeltLoop()
    TriggerEvent("seatbelt:client:toggleSeatbelt")
    TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 5.0, seatbeltOn and "carbuckle" or "carunbuckle", 0.25)
end

local function toggleHarness()
    harnessOn = not harnessOn
    if not harnessOn then return end
    toggleSeatbelt()
end

local function resetHandBrake()
    if handbrake <= 0 then return end
    handbrake -= 1
end

function SeatBeltLoop()
    CreateThread(function()
        while true do
            sleep = 0
            if seatbeltOn or harnessOn then
                DisableControlAction(0, 75, true)
                DisableControlAction(27, 75, true)
            end
            if not IsPedInAnyVehicle(PlayerPedId(), false) then
                seatbeltOn = false
                harnessOn = false
                TriggerEvent("seatbelt:client:toggleSeatbelt")
                break
            end
            if not seatbeltOn and not harnessOn then break end
            Wait(sleep)
        end
    end)
end

-- Export

function HasHarness()
    return harnessOn
end

exports("HasHarness", HasHarness)

-- Ejection Logic

RegisterNetEvent('QBCore:Client:EnteredVehicle', function()
    local dped = PlayerPedId()
    while IsPedInAnyVehicle(dped, false) do
        Wait(0)
        local currentVehicle = GetVehiclePedIsIn(dped, false)
        if currentVehicle and currentVehicle ~= false and currentVehicle ~= 0 then
            SetPedHelmet(dped, false)
            lastVehicle = GetVehiclePedIsIn(dped, false)
            if GetVehicleEngineHealth(currentVehicle) < 0.0 then
                SetVehicleEngineHealth(currentVehicle, 0.0)
            end
            if (GetVehicleHandbrake(currentVehicle) or (GetVehicleSteeringAngle(currentVehicle)) > 25.0 or (GetVehicleSteeringAngle(currentVehicle)) < -25.0) then
                if handbrake == 0 then
                    handbrake = 100
                    resetHandBrake()
                else
                    handbrake = 100
                end
            end

            thisFrameVehicleSpeed = GetEntitySpeed(currentVehicle) * 3.6
            currentvehicleBodyHealth = GetVehicleBodyHealth(currentVehicle)
            if currentvehicleBodyHealth == 1000 and frameBodyChange ~= 0 then
                frameBodyChange = 0
            end
            if frameBodyChange ~= 0 then
                if lastFrameVehiclespeed > 110 and thisFrameVehicleSpeed < (lastFrameVehiclespeed * 0.75) and not damageDone then
                    if frameBodyChange > 18.0 then
                        if not seatbeltOn and not IsThisModelABike(currentVehicle) then
                            if math.random(math.ceil(lastFrameVehiclespeed)) > 60 then
                                if not harnessOn then
                                    ejectFromVehicle()
                                else
                                    harnessHp -= 1
                                    TriggerServerEvent('seatbelt:DoHarnessDamage', harnessHp, harnessData)
                                end
                            end
                        elseif (seatbeltOn or harnessOn) and not IsThisModelABike(currentVehicle) then
                            if lastFrameVehiclespeed > 150 then
                                if math.random(math.ceil(lastFrameVehiclespeed)) > 150 then
                                    if not harnessOn then
                                        ejectFromVehicle()
                                    else
                                        harnessHp -= 1
                                        TriggerServerEvent('seatbelt:DoHarnessDamage', harnessHp, harnessData)
                                    end
                                end
                            end
                        end
                    else
                        if not seatbeltOn and not IsThisModelABike(currentVehicle) then
                            if math.random(math.ceil(lastFrameVehiclespeed)) > 60 then
                                if not harnessOn then
                                    ejectFromVehicle()
                                else
                                    harnessHp -= 1
                                    TriggerServerEvent('seatbelt:DoHarnessDamage', harnessHp, harnessData)
                                end
                            end
                        elseif (seatbeltOn or harnessOn) and not IsThisModelABike(currentVehicle) then
                            if lastFrameVehiclespeed > 120 then
                                if math.random(math.ceil(lastFrameVehiclespeed)) > 200 then
                                    if not harnessOn then
                                        ejectFromVehicle()
                                    else
                                        harnessHp -= 1
                                        TriggerServerEvent('seatbelt:DoHarnessDamage', harnessHp, harnessData)
                                    end
                                end
                            end
                        end
                    end
                    damageDone = true
                    SetVehicleEngineOn(currentVehicle, false, true, true)
                end
                if currentvehicleBodyHealth < 350.0 and not damageDone then
                    damageDone = true
                    SetVehicleEngineOn(currentVehicle, false, true, true)
                    Wait(1000)
                end
            end
            if lastFrameVehiclespeed < 100 then
                Wait(100)
                tick = 0
            end
            frameBodyChange = newvehicleBodyHealth - currentvehicleBodyHealth
            if tick > 0 then
                tick -= 1
                if tick == 1 then
                    lastFrameVehiclespeed = GetEntitySpeed(currentVehicle) * 3.6
                end
            else
                if damageDone then
                    damageDone = false
                    frameBodyChange = 0
                    lastFrameVehiclespeed = GetEntitySpeed(currentVehicle) * 3.6
                end
                lastFrameVehiclespeed2 = GetEntitySpeed(currentVehicle) * 3.6
                if lastFrameVehiclespeed2 > lastFrameVehiclespeed then
                    lastFrameVehiclespeed = GetEntitySpeed(currentVehicle) * 3.6
                end
                if lastFrameVehiclespeed2 < lastFrameVehiclespeed then
                    tick = 25
                end

            end
            if tick < 0 then
                tick = 0
            end
            newvehicleBodyHealth = GetVehicleBodyHealth(currentVehicle)
            if not modifierDensity then
                modifierDensity = true
            end
            veloc = GetEntityVelocity(currentVehicle)
        else
            if lastVehicle then
                SetPedHelmet(dped, true)
                Wait(200)
                newvehicleBodyHealth = GetVehicleBodyHealth(lastVehicle)
                if not damageDone and newvehicleBodyHealth < currentvehicleBodyHealth then
                    damageDone = true
                    SetVehicleEngineOn(lastVehicle, false, true, true)
                    Wait(1000)
                end
                lastVehicle = nil
            end
            lastFrameVehiclespeed2 = 0
            lastFrameVehiclespeed = 0
            newvehicleBodyHealth = 0
            currentvehicleBodyHealth = 0
            frameBodyChange = 0
            Wait(2000)
            break
        end
    end
end)

-- Events

RegisterNetEvent('seatbelt:client:UseHarness', function(ItemData) -- On Item Use (registered server side)
    local ped = PlayerPedId()
    local inveh = IsPedInAnyVehicle(ped, false)
    local class = GetVehicleClass(GetVehiclePedIsUsing(ped))
    if inveh and class ~= 8 and class ~= 13 and class ~= 14 then
        if not harnessOn then
            LocalPlayer.state:set("inv_busy", true, true)
            QBCore.Functions.Progressbar("harness_equip", Lang:t('seatbelt.use_harness_progress'), 5000, false, true, {
                disableMovement = false,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = true,
            }, {}, {}, {}, function()
                LocalPlayer.state:set("inv_busy", false, true)
                toggleHarness()
                TriggerServerEvent('equip:harness', ItemData)
            end)
            harnessHp = ItemData.info.uses
            harnessData = ItemData
            TriggerEvent('hud:client:UpdateHarness', harnessHp)
        else
            LocalPlayer.state:set("inv_busy", true, true)
            QBCore.Functions.Progressbar("harness_equip", Lang:t('seatbelt.remove_harness_progress'), 5000, false, true, {
                disableMovement = false,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = true,
            }, {}, {}, {}, function()
                LocalPlayer.state:set("inv_busy", false, true)
                toggleHarness()
            end)
        end
    else
        QBCore.Functions.Notify(Lang:t('seatbelt.no_car'), 'error')
    end
end)

-- Register Key

RegisterCommand('toggleseatbelt', function()
    if not IsPedInAnyVehicle(PlayerPedId(), false) or IsPauseMenuActive() then return end
    local class = GetVehicleClass(GetVehiclePedIsUsing(PlayerPedId()))
    if class == 8 or class == 13 or class == 14 then return end
    toggleSeatbelt()
end, false)

RegisterKeyMapping('toggleseatbelt', 'Toggle Seatbelt', 'keyboard', 'B')