local isCrouching = false
local walkSet = 'default'

local function loadAnimSet(anim)
    if not HasAnimSetLoaded(anim) then
        RequestAnimSet(anim)
        while not HasAnimSetLoaded(anim) do
            Wait(10)
        end
    end
end

local function resetAnimSet()
    local ped = PlayerPedId()
    ResetPedMovementClipset(ped, 1.0)
    ResetPedWeaponMovementClipset(ped)
    ResetPedStrafeClipset(ped)

    if walkSet ~= 'default' then
        loadAnimSet(walkSet)
        SetPedMovementClipset(ped, walkSet, 1.0)
        RemoveAnimSet(walkSet)
    end
end

RegisterNetEvent('crouchprone:client:SetWalkSet', function(clipset)
    walkSet = clipset
end)

RegisterCommand('togglecrouch', function()
    local ped = PlayerPedId()
    if IsPedSittingInAnyVehicle(ped) or IsPedFalling(ped) or IsPedSwimming(ped) or IsPedSwimmingUnderWater(ped) or IsPauseMenuActive() then
        return
    end

    ClearPedTasks(ped)
    if isCrouching then
        resetAnimSet()
        SetPedStealthMovement(ped, false, 'DEFAULT_ACTION')
        isCrouching = false
    else
        loadAnimSet('move_ped_crouched')
        SetPedMovementClipset(ped, 'move_ped_crouched', 1.0)
        SetPedStrafeClipset(ped, 'move_ped_crouched_strafing')
        isCrouching = true
    end
end, false)

-- Optional: Register a keybind so they can press CTRL (36) to toggle
RegisterKeyMapping('togglecrouch', 'Toggle Crouch', 'keyboard', 'LCONTROL')
