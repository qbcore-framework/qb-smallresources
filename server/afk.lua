local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('KickForAFK', function()
    DropPlayer(source, 'You Have Been Kicked For Being AFK')
end)

QBCore.Functions.CreateCallback('qb-afkkick:server:GetPermissions', function(source, cb)
    local group = QBCore.Functions.GetPermission(source)
    cb(group)
end)
