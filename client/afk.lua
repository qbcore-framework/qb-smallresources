-- AFK Kick Time Limit (in seconds)
local IgnoredGroups = {
    ['mod'] = true,
    ['admin'] = true,
    ['god'] = true
}

local checkUser = nil
local secondsUntilKick = 1800
local QBCore = exports['qb-core']:GetCoreObject()
local prevPos, time = nil, nil

AddEventHandler('onResourceStart', function(resourceName)
    if resourceName == GetCurrentResourceName() and checkUser == nil then
        updatePermissionLevel()
    end
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    updatePermissionLevel()
end)

local timeMinutes = {
    ['900'] = 'minutes',
    ['600'] = 'minutes',
    ['300'] = 'minutes',
    ['150'] = 'minutes',
    ['60'] = 'minutes',
    ['30'] = 'seconds',
    ['20'] = 'seconds',
    ['10'] = 'seconds',
}

CreateThread(function()
    while true do
        Wait(1000)
        local playerPed = PlayerPedId()
        if LocalPlayer.state.isLoggedIn then
            if checkUser then
                currentPos = GetEntityCoords(playerPed, true)
                if prevPos ~= nil then
                    if currentPos == prevPos then
                        if time ~= nil then
                            if time > 0 then
                                local type = timeMinutes[tostring(time)]
                                if type == 'minutes' then
                                    QBCore.Functions.Notify('You are AFK and will be kicked in ' .. math.ceil(time / 60) .. ' minute(s)!', 'error', 10000)
                                elseif type =='seconds' then
                                    QBCore.Functions.Notify('You are AFK and will be kicked in ' .. time .. ' seconds!', 'error', 10000)
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

function updatePermissionLevel()
    QBCore.Functions.TriggerCallback('qb-afkkick:server:GetPermissions', function(UserGroups)
        for k,_ in pairs(UserGroups) do
            if IgnoredGroups[k] then
                checkUser = false
                break
            end
            checkUser = true
        end
    end)
end