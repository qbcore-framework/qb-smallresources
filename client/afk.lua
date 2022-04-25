-- AFK Kick Time Limit (in seconds)
local secondsUntilKick = 1800
local prevPos, time = nil, nil

CreateThread(function()
    while true do
        local Sleep = 1500
        if ESX.IsPlayerLoaded() then
            if ESX.PlayerData.group == 'user' then
                Sleep = 1500
                currentPos = GetEntityCoords(ESX.PlayerData.ped, true)
                if prevPos ~= nil then
                    if currentPos == prevPos then
                        Sleep = 1000
                        if time ~= nil then
                            if time > 0 then
                                if time == (900) then
                                   ESX.ShowNotification('You are AFK and will be kicked in ' .. math.ceil(time / 60) .. ' minutes!')
                                elseif time == (600) then
                                    ESX.ShowNotification('You are AFK and will be kicked in ' .. math.ceil(time / 60) .. ' minutes!')
                                elseif time == (300) then
                                    ESX.ShowNotification('You are AFK and will be kicked in ' .. math.ceil(time / 60) .. ' minutes!')
                                elseif time == (150) then
                                    ESX.ShowNotification('You are AFK and will be kicked in ' .. math.ceil(time / 60) .. ' minutes!')
                                elseif time == (60) then
                                    ESX.ShowNotification('You are AFK and will be kicked in ' .. math.ceil(time / 60) .. ' minute!')
                                elseif time == (30) then
                                    ESX.ShowNotification('You are AFK and will be kicked in ' .. time .. ' seconds!')
                                elseif time == (20) then
                                    ESX.ShowNotification('You are AFK and will be kicked in ' .. time .. ' seconds!')
                                elseif time == (10) then
                                    ESX.ShowNotification('You are AFK and will be kicked in ' .. time .. ' seconds!')
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
    Wait(Sleep)
    end
end)
