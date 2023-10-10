local QBCore = exports['qb-core']:GetCoreObject()
local isLoggedIn = LocalPlayer.state.isLoggedIn
local checkUser = true
local prevPos, time = nil, nil
local timeMinutes = {
    ['15'] = 'minutes',
    ['10'] = 'minutes',
    ['5'] = 'minutes',
    ['3'] = 'minutes',
    ['1'] = 'minutes',
    ['30'] = 'seconds',
    ['20'] = 'seconds',
    ['10'] = 'seconds',
}

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
    if playerJob and playerJob.name then
        --print("Player Job: " .. playerJob.name)  -- Debug log
        if Config.AFK.ignoredJobs[playerJob.name] then
           -- print("Job should be ignored for AFK check.")  -- Debug log
            checkUser = false
        end
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
                    if time and time > 0 then
                        time = time - 1
                        if timeMinutes[tostring(time)] then
                            if timeMinutes[tostring(time)] == 'minutes' then
                                QBCore.Functions.Notify(Lang:t('afk.will_kick') .. math.ceil(time / 60) .. Lang:t('afk.time_minutes'), 'error', 10000)
                            elseif timeMinutes[tostring(time)] == 'seconds' then
                                QBCore.Functions.Notify(Lang:t('afk.will_kick') .. time .. Lang:t('afk.time_seconds'), 'error', 10000)
                            end
                        end
                    else
                        TriggerServerEvent('KickForAFK')
                    end
                else
                    time = Config.AFK.secondsUntilKick
                end
            end
            prevPos = currPos
        end
    end
end)
