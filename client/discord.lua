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
            SetDiscordRichPresenceAction(0,
                conf.Buttons[1].text,
                conf.Buttons[1].url
            )
            SetDiscordRichPresenceAction(1,
                conf.Buttons[2].text,
                conf.Buttons[2].url
            )
        end

        Wait(conf.UpdateRate)
    end
end)
