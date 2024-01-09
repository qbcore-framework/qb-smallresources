local handsUp = false
local QBCore = exports['qb-core']:GetCoreObject()

RegisterCommand(Config.HandsUp.command, function()
    local ped = PlayerPedId()
    if not HasAnimDictLoaded('missminuteman_1ig_2') then
        RequestAnimDict('missminuteman_1ig_2')
        while not HasAnimDictLoaded('missminuteman_1ig_2') do
            Wait(10)
        end
    end
    handsUp = not handsUp
    local PlayerData = QBCore.Functions.GetPlayerData()
    if exports['qb-policejob']:IsHandcuffed() or PlayerData.metadata["isdead"] or PlayerData.metadata["inlaststand"] then return end
    if handsUp then
        TaskPlayAnim(ped, 'missminuteman_1ig_2', 'handsup_base', 2.0, 2.5, -1, 50, 0, false, false, false)
        exports['qb-smallresources']:addDisableControls(Config.HandsUp.controls)
    else
        ClearPedTasks(ped)
        exports['qb-smallresources']:removeDisableControls(Config.HandsUp.controls)
    end
end, false)

RegisterKeyMapping(Config.HandsUp.command, 'Hands Up', 'keyboard', Config.HandsUp.keybind)
exports('getHandsup', function() return handsUp end)
