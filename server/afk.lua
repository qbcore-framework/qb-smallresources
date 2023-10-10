local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('KickForAFK', function()
	DropPlayer(source, Lang:t("afk.kick_message"))
end)

QBCore.Functions.CreateCallback('qb-afkkick:server:GetPermissions', function(source, cb)
    local player = QBCore.Functions.GetPlayer(source)
    local groups = {}
    if player then
        if player.PlayerData.job and player.PlayerData.job.name then
            groups[player.PlayerData.job.name] = true
        end
        cb(QBCore.Functions.GetPermission(source))
    end
    cb(groups)
end)

