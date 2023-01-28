local QBCore = exports['qb-core']:GetCoreObject()
local webHooks = SvrConfig.webHooks
local addToWebhooks = function(newWebHooks)
    if not newWebHooks then return end
    if next(newWebHooks) then
        for k,v in pairs(newWebHooks) do
            webHooks[k] = v
        end
    end
    return
end
exports("addToWebhooks",addToWebhooks)

RegisterNetEvent('qb-log:server:CreateLog', function(name, title, color, message, tagEveryone)
    local tag = tagEveryone or false
    local webHook = webHooks[name] or webHooks['default']
    local embedData = {
        {
            ['title'] = title,
            ['color'] = SvrConfig.webHookColors[color] or SvrConfig.webHookColors['default'],
            ['footer'] = {
                ['text'] = os.date('%c'),
            },
            ['description'] = message,
            ['author'] = {
                ['name'] = 'QBCore Logs',
                ['icon_url'] = 'https://media.discordapp.net/attachments/870094209783308299/870104331142189126/Logo_-_Display_Picture_-_Stylized_-_Red.png?width=670&height=670',
            },
        }
    }
    PerformHttpRequest(webHook, function() end, 'POST', json.encode({ username = 'QB Logs', embeds = embedData}), { ['Content-Type'] = 'application/json' })
    Citizen.Wait(100)
    if tag then
        PerformHttpRequest(webHook, function() end, 'POST', json.encode({ username = 'QB Logs', content = '@everyone'}), { ['Content-Type'] = 'application/json' })
    end
end)

QBCore.Commands.Add('testwebhook', 'Test Your Discord Webhook For Logs (God Only)', {}, false, function()
    TriggerEvent('qb-log:server:CreateLog', 'testwebhook', 'Test Webhook', 'default', 'Webhook setup successfully')
end, 'god')
