local QBCore = exports['qb-core']:GetCoreObject()
local isLoggedIn = LocalPlayer.state.isLoggedIn
local checkUser = true

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

CreateThread(function()
    local sleepTimer = 10000
    while true do
        if (isLoggedIn or Config.AFK.kickInCharMenu) and checkUser then
            while GetTimeSinceLastInput(0) > sleepTimer do
                local kickTimer = Config.AFK.minutesUntilKick * 60 * 1000
                local timeLeftSec = (kickTimer - GetTimeSinceLastInput(0)) / 1000
                for _, warning in pairs(Config.AFK.warnings) do
                    if not warning.sent and timeLeftSec < warning.timeSec then
                        if warning.timeSec >= 60 then
                            QBCore.Functions.Notify(Lang:t('afk.will_kick') .. math.ceil(warning.timeSec / 60) .. Lang:t('afk.time_minutes'), 'error', 15000)
                        else
                            QBCore.Functions.Notify(Lang:t('afk.will_kick') .. warning.timeSec .. Lang:t('afk.time_seconds'), 'error', 15000)
                        end
                        warning.sent = true
                    end
                    if GetTimeSinceLastInput(0) > kickTimer then
                        TriggerServerEvent('KickForAFK')
                    end
                end
                Wait(1000)
            end
            for _, warning in pairs(Config.AFK.warnings) do warning.sent = false end
        end
        Wait(sleepTimer)
    end
end)