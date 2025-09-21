
local seatbeltOn = false
local harnessOn = false
local harnessHp = Config.HarnessUses
local handbrake = 0
local sleep = 0
local harnessData = {}
local newVehBodyHealth = 0
local currVehBodyHealth = 0
local frameBodyChange = 0
local lastFrameVehSpeed = 0
local lastFrameVehSpeed2 = 0
local thisFrameVehSpeed = 0
local tick = 0
local damageDone = false
local modifierDensity = true
local lastVeh = nil
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
    local ejectSpeed = math.ceil(GetEntitySpeed(ped) * 8)
    if GetEntityHealth(ped) - ejectSpeed > 0 then
        SetEntityHealth(ped, GetEntityHealth(ped) - ejectSpeed)
    elseif GetEntityHealth(ped) ~= 0 then
        SetEntityHealth(ped, 0)
    end
end

local function toggleSeatbelt()
    seatbeltOn = not seatbeltOn
    SeatBeltLoop()
    TriggerEvent("seatbelt:client:ToggleSeatbelt", seatbeltOn)
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
                TriggerEvent("seatbelt:client:ToggleSeatbelt", seatbeltOn)
                break
            end
            if not seatbeltOn and not harnessOn then break end
            Wait(sleep)
        end
    end)
end

-- Export

---Checks whether you have the harness on or not
---@return boolean 
local function hasHarness()
    return harnessOn
end

exports("HasHarness", hasHarness)

---Checks whether the player has their seatbelt on or not
---@return boolean
local function hasSeatbeltOn()
    return seatbeltOn
end

exports("HasSeatbeltOn", hasSeatbeltOn)

-- Ejection Logic

RegisterNetEvent('QBCore:Client:EnteredVehicle', function()
    local ped = PlayerPedId()
    while IsPedInAnyVehicle(ped, false) do
        Wait(0)
        local currVehicle = GetVehiclePedIsIn(ped, false)
        if currVehicle and currVehicle ~= false and currVehicle ~= 0 then
            SetPedHelmet(ped, false)
            lastVeh = GetVehiclePedIsIn(ped, false)
            if GetVehicleEngineHealth(currVehicle) < 0.0 then
                SetVehicleEngineHealth(currVehicle, 0.0)
            end
            if (GetVehicleHandbrake(currVehicle) or (GetVehicleSteeringAngle(currVehicle)) > 25.0 or (GetVehicleSteeringAngle(currVehicle)) < -25.0) then
                if handbrake == 0 then
                    handbrake = 100
                    resetHandBrake()
                else
                    handbrake = 100
                end
            end

            thisFrameVehSpeed = GetEntitySpeed(currVehicle) * 3.6
            currVehBodyHealth = GetVehicleBodyHealth(currVehicle)
            if currVehBodyHealth == 1000 and frameBodyChange ~= 0 then
                frameBodyChange = 0
            end
            if frameBodyChange ~= 0 then
                if lastFrameVehSpeed > 110 and thisFrameVehSpeed < (lastFrameVehSpeed * 0.75) and not damageDone then
                    if frameBodyChange > 18.0 then
                        if not seatbeltOn and not IsThisModelABike(currVehicle) then
                            if math.random(math.ceil(lastFrameVehSpeed)) > 60 then
                                if not harnessOn then
                                    ejectFromVehicle()
                                else
                                    harnessHp -= 1
                                    TriggerServerEvent('seatbelt:DoHarnessDamage', harnessHp, harnessData)
                                end
                            end
                        elseif (seatbeltOn or harnessOn) and not IsThisModelABike(currVehicle) then
                            if lastFrameVehSpeed > 150 then
                                if math.random(math.ceil(lastFrameVehSpeed)) > 150 then
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
                        if not seatbeltOn and not IsThisModelABike(currVehicle) then
                            if math.random(math.ceil(lastFrameVehSpeed)) > 60 then
                                if not harnessOn then
                                    ejectFromVehicle()
                                else
                                    harnessHp -= 1
                                    TriggerServerEvent('seatbelt:DoHarnessDamage', harnessHp, harnessData)
                                end
                            end
                        elseif (seatbeltOn or harnessOn) and not IsThisModelABike(currVehicle) then
                            if lastFrameVehSpeed > 120 then
                                if math.random(math.ceil(lastFrameVehSpeed)) > 200 then
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
                    SetVehicleEngineOn(currVehicle, false, true, true)
                end
                if currVehBodyHealth < 350.0 and not damageDone then
                    damageDone = true
                    SetVehicleEngineOn(currVehicle, false, true, true)
                    Wait(1000)
                end
            end
            if lastFrameVehSpeed < 100 then
                Wait(100)
                tick = 0
            end
            frameBodyChange = newVehBodyHealth - currVehBodyHealth
            if tick > 0 then
                tick -= 1
                if tick == 1 then
                    lastFrameVehSpeed = GetEntitySpeed(currVehicle) * 3.6
                end
            else
                if damageDone then
                    damageDone = false
                    frameBodyChange = 0
                    lastFrameVehSpeed = GetEntitySpeed(currVehicle) * 3.6
                end
                lastFrameVehSpeed2 = GetEntitySpeed(currVehicle) * 3.6
                if lastFrameVehSpeed2 > lastFrameVehSpeed then
                    lastFrameVehSpeed = GetEntitySpeed(currVehicle) * 3.6
                end
                if lastFrameVehSpeed2 < lastFrameVehSpeed then
                    tick = 25
                end

            end
            if tick < 0 then
                tick = 0
            end
            newVehBodyHealth = GetVehicleBodyHealth(currVehicle)
            if not modifierDensity then
                modifierDensity = true
            end
            veloc = GetEntityVelocity(currVehicle)
        else
            if lastVeh then
                SetPedHelmet(ped, true)
                Wait(200)
                newVehBodyHealth = GetVehicleBodyHealth(lastVeh)
                if not damageDone and newVehBodyHealth < currVehBodyHealth then
                    damageDone = true
                    SetVehicleEngineOn(lastVeh, false, true, true)
                    Wait(1000)
                end
                lastVeh = nil
            end
            lastFrameVehSpeed2 = 0
            lastFrameVehSpeed = 0
            newVehBodyHealth = 0
            currVehBodyHealth = 0
            frameBodyChange = 0
            Wait(2000)
            break
        end
    end
end)

-- Events

RegisterNetEvent('seatbelt:client:UseHarness', function(ItemData) -- On Item Use (registered server side)
    local ped = PlayerPedId()
    local inVeh = IsPedInAnyVehicle(ped, false)
    local class = GetVehicleClass(GetVehiclePedIsUsing(ped))
    if inVeh and class ~= 8 and class ~= 13 and class ~= 14 then
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
