function RegisterCustomFont(dict, name, lang)
    if not Config.FontList[name] then
        Config.FontList[name] = { dict = dict, name = name, lang = lang or 'en', id = nil }
    end

    if not Config.FontList[name].id then
        RegisterFontFile(dict)
        Config.FontList[name].id = RegisterFontId(name)
    end

    return Config.FontList[name].id
end

exports('RegisterCustomFont', RegisterCustomFont)

function GetCustomFontId(name)
    return Config.FontList[name] and Config.FontList[name].id or nil
end

exports('GetCustomFontId', GetCustomFontId)

function GetAvailableFonts()
    return Config.FontList
end

exports('GetAvailableFonts', GetAvailableFonts)

CreateThread(function()
    for _, font in pairs(Config.FontList) do
        RegisterCustomFont(font.dict, font.name, font.lang)
    end
end)
