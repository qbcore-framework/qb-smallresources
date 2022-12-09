local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('KickForAFK', function()
	DropPlayer(source, Lang:t("text.afk_kick_message"))
end)

QBCore.Functions.CreateCallback('qb-afkkick:server:GetPermissions', function(source, cb)
    cb(QBCore.Functions.GetPermission(source))
end)
