
CreateThread(function()
    while Config.Discord.isEnabled do
        SetDiscordAppId(Config.Discord.applicationId)
        SetDiscordRichPresenceAsset(Config.Discord.iconLarge)
        SetDiscordRichPresenceAssetText(Config.Discord.iconLargeHoverText)
        SetDiscordRichPresenceAssetSmall(Config.Discord.iconSmall)
        SetDiscordRichPresenceAssetSmallText(Config.Discord.iconSmallHoverText)

        if Config.Discord.showPlayerCount then
            QBCore.Functions.TriggerCallback('smallresources:server:GetCurrentPlayers', function(result)
                SetRichPresence('Players: ' .. result .. '/' .. Config.Discord.maxPlayers)
            end)
        end

        if Config.Discord.buttons and type(Config.Discord.buttons) == "table" then
            for i, v in pairs(Config.Discord.buttons) do
                SetDiscordRichPresenceAction(i - 1, v.text, v.url)
            end
        end

        Wait(Config.Discord.updateRate)
    end
end)
