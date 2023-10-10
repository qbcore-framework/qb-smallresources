local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('KickForAFK', function()
	local src = source
    	local player = QBCore.Functions.GetPlayer(src)
	DropPlayer(source, Lang:t("afk.kick_message"))
	print("[Server] " .. player.PlayerData.name .. " was kicked for being AFK.")
end)

QBCore.Functions.CreateCallback('qb-afkkick:server:GetPermissions', function(source, cb)
    local player = QBCore.Functions.GetPlayer(source)
    local groups = {}

    if player then
        
        if player.PlayerData.job and player.PlayerData.job.name then
            groups[player.PlayerData.job.name] = true
        end

        if player.PlayerData.gang and player.PlayerData.gang.name then
            groups[player.PlayerData.gang.name] = true
        end
        
        if player.PlayerData.vip and player.PlayerData.vip.isActive then
            groups["vip"] = true
        end
        
        if player.PlayerData.group then
            groups[player.PlayerData.group] = true
        end
    end
    
    cb(groups)
end)

