local animDict = "missminuteman_1ig_2"
local anim = "handsup_base"
local handsup = false
local QBCore = exports['qb-core']:GetCoreObject()

RegisterCommand(Config.HandsUp.command, function()
    local ped = PlayerPedId()
    if QBCore.Functions.GetPlayerData().metadata['isdead'] then return end 
    if IsPedInAnyVehicle(PlayerPedId(), false) then
        -- Do nothing if the player is in a vehicle
        return
    end
    if not HasAnimDictLoaded(animDict) then
        RequestAnimDict(animDict)
        while not HasAnimDictLoaded(animDict) do
            Wait(10)
        end
    end
    local PlayerData = QBCore.Functions.GetPlayerData()
    if exports['qb-policejob']:IsHandcuffed() or PlayerData.metadata["isdead"] or PlayerData.metadata["inlaststand"] then
        return
    end
    handsup = not handsup
    if exports['qb-policejob']:IsHandcuffed() then return end
    if handsup then
        TaskPlayAnim(ped, animDict, anim, 8.0, 8.0, -1, 50, 0, false, false, false)
        exports['qb-smallresources']:addDisableControls(Config.Disable.controls)
    else
        ClearPedTasks(ped)
        exports['qb-smallresources']:removeDisableControls(Config.Disable.controls)
    end
end, false)

RegisterKeyMapping(Config.HandsUp.command, 'Hands Up', 'keyboard', Config.HandsUp.keybind)
exports('getHandsup', function() return handsup end)
