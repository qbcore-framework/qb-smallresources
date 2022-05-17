local QBCore = exports['qb-core']:GetCoreObject()

local Webhooks = {
    ['default'] = '',
    ['testwebhook'] = nil,
    ['playermoney'] = nil,
    ['playerinventory'] = nil,
    ['robbing'] = nil,
    ['cuffing'] = nil,
    ['drop'] = nil,
    ['trunk'] = nil,
    ['stash'] = nil,
    ['glovebox'] = nil,
    ['banking'] = nil,
    ['vehicleshop'] = nil,
    ['vehicleupgrades'] = nil,
    ['shops'] = nil,
    ['dealers'] = nil,
    ['storerobbery'] = nil,
    ['bankrobbery'] = nil,
    ['powerplants'] = nil,
    ['death'] = nil,
    ['joinleave'] = nil,
    ['ooc'] = nil,
    ['report'] = nil,
    ['me'] = nil,
    ['pmelding'] = nil,
    ['112'] = nil,
    ['bans'] = nil,
    ['anticheat'] = nil,
    ['weather'] = nil,
    ['moneysafes'] = nil,
    ['bennys'] = nil,
    ['bossmenu'] = nil,
    ['robbery'] = nil,
    ['casino'] = nil,
    ['traphouse'] = nil,
    ['911'] = nil,
    ['palert'] = nil,
    ['house'] = nil,
}

local Colors = { -- https://www.spycolor.com/
    ['default'] = 14423100,
    ['blue'] = 255,
    ['red'] = 16711680,
    ['green'] = 65280,
    ['white'] = 16777215,
    ['black'] = 0,
    ['orange'] = 16744192,
    ['yellow'] = 16776960,
    ['pink'] = 16761035,
    ["lightgreen"] = 65309,
}

RegisterNetEvent('qb-log:server:CreateLog', function(name, title, color, message, tagEveryone)        
    local tag = tagEveryone or false
    local webHook = Webhooks[name] or Webhooks['default']
    local embedData = {
        {
            ['title'] = title,
            ['color'] = Colors[color] or Colors['default'],
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
    PerformHttpRequest(webHook, function(err, text, headers) end, 'POST', json.encode({ username = 'QB Logs', embeds = embedData}), { ['Content-Type'] = 'application/json' })
    Citizen.Wait(100)
    if tag then
        PerformHttpRequest(webHook, function(err, text, headers) end, 'POST', json.encode({ username = 'QB Logs', content = '@everyone'}), { ['Content-Type'] = 'application/json' })
    end
end)

QBCore.Commands.Add('testwebhook', 'Test Your Discord Webhook For Logs (God Only)', {}, false, function(source, args)
    TriggerEvent('qb-log:server:CreateLog', 'testwebhook', 'Test Webhook', 'default', 'Webhook setup successfully')
end, 'god')
