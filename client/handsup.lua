local animDict = "missminuteman_1ig_2"
local anim = "handsup_base"
local handsup = false
local disableHandsupControls = {24, 25, 47, 58, 59, 63, 64, 71, 72, 75, 140, 141, 142, 143, 257, 263, 264}

RegisterCommand('hu', function()
    local ped = PlayerPedId()
    if not HasAnimDictLoaded(animDict) then
        RequestAnimDict(animDict)
        while not HasAnimDictLoaded(animDict) do
            Wait(10)
        end
    end
    handsup = not handsup
    if exports['qb-policejob']:IsHandcuffed() then return end
    if handsup then
        TaskPlayAnim(ped, animDict, anim, 8.0, 8.0, -1, 50, 0, false, false, false)
        exports['qb-smallresources']:addDisableControls(disableHandsupControls)
    else
        ClearPedTasks(ped)
        exports['qb-smallresources']:removeDisableControls(disableHandsupControls)
    end
end, false)

RegisterKeyMapping('hu', 'Put your hands up', 'KEYBOARD', 'X')

exports('getHandsup', function() return handsup end)
