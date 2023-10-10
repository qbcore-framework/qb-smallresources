local QBCore = exports['qb-core']:GetCoreObject()
local isLoggedIn = LocalPlayer.state.isLoggedIn
local checkUser = true
local prevPos, time = nil, nil

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
    local playerJob = QBCore.Functions.GetPlayerData().job
    if playerJob and playerJob.name and Config.AFK.ignoredJobs[playerJob.name] then
        checkUser = false
    end
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

CreateThread(function()
    while true do
        Wait(10000)
        local ped = PlayerPedId()
        if isLoggedIn and checkUser then
            local currPos = GetEntityCoords(ped, true)
            if prevPos then
                if currPos == prevPos then
                    if time then
                        if time > 0 then
                            time = time - 10
                        else
                            TriggerServerEvent('KickForAFK')
                        end
                    else
                        time = Config.AFK.secondsUntilKick
                    end
                else
                    time = Config.AFK.secondsUntilKick
                end
            end
            prevPos = currPos
        end
    end
end)
