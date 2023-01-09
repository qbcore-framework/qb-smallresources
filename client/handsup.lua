QBCore = exports["qb-core"]:GetCoreObject()

local animDict = "missminuteman_1ig_2"
local anim = "handsup_base"
local handsup = false

RegisterCommand('hu', function()
    local ped = PlayerPedId()
    if not HasAnimDictLoaded(animDict) then
        RequestAnimDict(animDict)
        while not HasAnimDictLoaded(animDict) do
            Wait(10)
        end
    end

    -- We verify if the character is dead or in last stand or handcuffed.
    QBCore.Functions.GetPlayerData(function(PlayerData)
        if PlayerData.metadata["isdead"] or exports['qb-policejob']:IsHandcuffed() or PlayerData.metadata["inlaststand"] then
            return
        end
        handsup = not handsup
        if handsup then
            TaskPlayAnim(ped, animDict, anim, 8.0, 8.0, -1, 50, 0, false, false, false)
            exports['qb-smallresources']:addDisableControls(Config.disableHandsupControls)
        else
            ClearPedTasks(ped)
            exports['qb-smallresources']:removeDisableControls(Config.disableHandsupControls)
        end
    end)
end, false)

exports('getHandsup', function() return handsup end)
