local QBCore = exports['qb-core']:GetCoreObject()
local conf = Config.Discord;

CreateThread(function()
    while conf.IsEnabled do
        SetDiscordAppId(conf.ApplicationId)
        SetDiscordRichPresenceAsset(conf.IconLarge)
        SetDiscordRichPresenceAssetText(conf.IconLargeHoverText)
        SetDiscordRichPresenceAssetSmall(conf.IconSmall)
        SetDiscordRichPresenceAssetSmallText(conf.IconSmallHoverText)

        if conf.PlayerCount.IsEnabled then
            QBCore.Functions.TriggerCallback('smallresources:server:GetCurrentPlayers', function(result)
                SetRichPresence('Players: ' .. result..'/64')
            end)
        end

        if conf.Buttons.IsEnabled then
            for i,v in pairs(conf.Buttons) do
                SetDiscordRichPresenceAction(i - 1,
                    v.text,
                    v.url
                )
            end
        end

        Wait(conf.UpdateRate)
    end
end)
