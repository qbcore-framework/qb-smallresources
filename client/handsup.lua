local handsUp = false

local function isDeadOrDown(ped)

    if LocalPlayer and LocalPlayer.state then
        if LocalPlayer.state.dead == true or LocalPlayer.state.down == true then
            return true
        end
    end

    return IsEntityDead(ped) or IsPedRagdoll(ped)
end

RegisterCommand(Config.HandsUp.command, function()
    local ped = PlayerPedId()

    if not HasAnimDictLoaded('missminuteman_1ig_2') then
        RequestAnimDict('missminuteman_1ig_2')
        while not HasAnimDictLoaded('missminuteman_1ig_2') do
            Wait(10)
        end
    end

    local wantRaise = not handsUp

    if wantRaise then
        if GetResourceState('qb-policejob') == 'started' or GetResourceState('qb-policejob') == 'starting' then
            local ok, cuffed = pcall(function() return exports['qb-policejob']:IsHandcuffed() end)
            if ok and cuffed then return end
        end
        if isDeadOrDown(ped) then return end
    end

    handsUp = wantRaise
    if handsUp then
        TaskPlayAnim(ped, 'missminuteman_1ig_2', 'handsup_base', 8.0, 8.0, -1, 50, 0, false, false, false)
        exports['qb-smallresources']:addDisableControls(Config.HandsUp.controls)
    else
        ClearPedTasks(ped)
        exports['qb-smallresources']:removeDisableControls(Config.HandsUp.controls)
    end
end, false)

RegisterKeyMapping(Config.HandsUp.command, 'Hands Up', 'keyboard', Config.HandsUp.keybind)
exports('getHandsup', function() return handsUp end)
