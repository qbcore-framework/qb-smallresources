-- Initialize variables
local QBCore = exports['qb-core']:GetCoreObject()
local jumpCooldown = false
local cooldownTime = Config.jumpCooldown

-- Cooldown function
local function startJumpCooldown()
    jumpCooldown = true
    Citizen.CreateThread(function()
        Citizen.Wait(cooldownTime * 1000) -- Wait for the cooldown time
        jumpCooldown = false
    end)
end

-- Main thread to handle jump key
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if not IsControlPressed(0, 25) then
            if IsControlJustPressed(0, 22) then
                if not jumpCooldown then
                    TaskJump(PlayerPedId())
                    startJumpCooldown()
                end
            end
        else
        end
    end
end)

-- Disable the default jump when cooldown is active
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if not IsControlPressed(0, 25) then
            if jumpCooldown then
                DisableControlAction(0, 22, true)
            end
        else
            EnableControlAction(0, 22, true)
        end
    end
end)
