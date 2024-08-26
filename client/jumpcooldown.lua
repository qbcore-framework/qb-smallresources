-- Initialize variables
local jumpCooldown = false
local cooldownTime = 10 -- Cooldown time in seconds

-- Cooldown function
local function startJumpCooldown()
    jumpCooldown = true
    Citizen.CreateThread(function()
        Citizen.Wait(cooldownTime * 1000)
        jumpCooldown = false
    end)
end

-- Main thread to handle jump key
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsControlJustPressed(0, 22) then
            if not jumpCooldown then
                TaskJump(PlayerPedId())
                startJumpCooldown()
            end
        end
    end
end)

-- Disable the default jump when cooldown is active
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if jumpCooldown then
            DisableControlAction(0, 22, true)
        end
    end
end)
