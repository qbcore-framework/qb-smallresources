-- AFK Kick Time Limit (in seconds)
local group = 'user'
local secondsUntilKick = 1800
local QBCore = exports['qb-core']:GetCoreObject()
local prevPos, time = nil, nil

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.TriggerCallback('qb-afkkick:server:GetPermissions', function(UserGroup)
        group = UserGroup
    end)
end)

RegisterNetEvent('QBCore:Client:OnPermissionUpdate', function(UserGroup)
    group = UserGroup
end)

CreateThread(function()
    while true do
        Wait(1000)
        local playerPed = PlayerPedId()
        if LocalPlayer.state.isLoggedIn then
            if group == 'user' then
                currentPos = GetEntityCoords(playerPed, true)
                if prevPos ~= nil then
                    if currentPos == prevPos then
                        if time ~= nil then
                            if time > 0 then
                                if time == (900) then
                                    QBCore.Functions.Notify(Lang:t("error.afk_time_left_minutes",{timeLeft = math.ceil(time / 60)}), 'error', 10000)
                                elseif time == (600) then
                                    QBCore.Functions.Notify(Lang:t("error.afk_time_left_minutes",{timeLeft = math.ceil(time / 60)}), 'error', 10000)
                                elseif time == (300) then
                                    QBCore.Functions.Notify(Lang:t("error.afk_time_left_minutes",{timeLeft = math.ceil(time / 60)}), 'error', 10000)
                                elseif time == (150) then
                                    QBCore.Functions.Notify(Lang:t("error.afk_time_left_minutes",{timeLeft = math.ceil(time / 60)}), 'error', 10000)
                                elseif time == (60) then
                                    QBCore.Functions.Notify(Lang:t("error.afk_time_left_minute",{timeLeft = math.ceil(time / 60)}), 'error', 10000)
                                elseif time == (30) then
                                    QBCore.Functions.Notify(Lang:t("error.afk_time_left_seconds",{timeLeft = time}), 'error', 10000)
                                elseif time == (20) then
                                    QBCore.Functions.Notify(Lang:t("error.afk_time_left_seconds",{timeLeft = time}), 'error', 10000)
                                elseif time == (10) then
                                    QBCore.Functions.Notify(Lang:t("error.afk_time_left_seconds",{timeLeft = time}), 'error', 10000)
                                end
                                time = time - 1
                            else
                                TriggerServerEvent('KickForAFK')
                            end
                        else
                            time = secondsUntilKick
                        end
                    else
                        time = secondsUntilKick
                    end
                end
                prevPos = currentPos
            end
        end
    end
end)
