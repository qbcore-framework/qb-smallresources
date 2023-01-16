local QBCore = exports['qb-core']:GetCoreObject()
local isLoggedIn = LocalPlayer.state.isLoggedIn
local checkUser = true
local checkInterval = 10
local notificationDuration = (checkInterval - 2) * 1000

local function updatePermissionLevel()
    QBCore.Functions.TriggerCallback('qb-afkkick:server:GetPermissions', function(userGroups)
        for k in pairs(userGroups) do
            if Config.AFK.ignoredGroups[k] then
                checkUser = false
                break
            end
            checkUser = true
        end
    end)
end

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    updatePermissionLevel()
    isLoggedIn = true
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    isLoggedIn = false
end)

RegisterNetEvent('QBCore:Client:OnPermissionUpdate', function()
    updatePermissionLevel()
end)

function getTimeUnit(time)
    return time >= 60 and 'minutes' or 'seconds'
end
if Config.AFK.enabled then
    CreateThread(function()
        local time = nil
        local prevPos = nil

        while true do
            Wait(checkInterval * 1000)
            local playerPed = PlayerPedId()
            if not time then
                time = Config.AFK.secondsUntilKick
            end

            if not checkUser then
                goto skip
            end

            if isLoggedIn then
                local currentPos = GetEntityCoords(playerPed, true)
                if currentPos ~= prevPos then
                    time = Config.AFK.secondsUntilKick
                end
                prevPos = currentPos
            end

            if time > 0 then
                if time < Config.AFK.secondsUntilKick / 2 then
                    local timeString = math.ceil(time / 60) .. Lang:t('afk.time_minutes')

                    if getTimeUnit(time) == 'seconds' then
                        timeString = time .. Lang:t('afk.time_seconds')
                    end

                    QBCore.Functions.Notify(Lang:t('afk.will_kick') .. timeString, 'error', notificationDuration)
                end

                time -= checkInterval
            else
                TriggerServerEvent('KickForAFK')
            end

            ::skip::
        end
    end)
end
