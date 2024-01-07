local duiCounter = 0
local availableDuis = {}
local duis = {}

local function GetDui(url, width, height)
    width = width or 512
    height = height or 512

    local duiSize = tostring(width) .. "x" .. tostring(height)

    if (availableDuis[duiSize] and #availableDuis[duiSize] > 0) then
        local n, t = pairs(availableDuis[duiSize])
        local nextKey, nextValue = n(t)
        local id = nextValue
        local dictionary = duis[id].textureDictName
        local texture = duis[id].textureName

        nextValue = nil
        table.remove(availableDuis[duiSize], nextKey)
        SetDuiUrl(duis[id].duiObject, url)
        return {id = id, dictionary = dictionary, texture = texture}
    end

    duiCounter = duiCounter + 1
    local generatedDictName = duiSize .. "-dict-" .. tostring(duiCounter)
    local generatedTxtName = duiSize .. "-txt-" .. tostring(duiCounter)
    local duiObject = CreateDui(url, width, height)
    local dictObject = CreateRuntimeTxd(generatedDictName)
    local duiHandle = GetDuiHandle(duiObject)
    local txdObject = CreateRuntimeTextureFromDuiHandle(dictObject, generatedTxtName, duiHandle)

    duis[duiCounter] = {
        duiSize = duiSize,
        duiObject = duiObject,
        duiHandle = duiHandle,
        dictionaryObject = dictObject,
        textureObject = txdObject,
        textureDictName = generatedDictName,
        textureName = generatedTxtName
    }

    return {id = duiCounter, dictionary = generatedDictName, texture = generatedTxtName}
end

exports("GetDui", GetDui)

local function ChangeDuiUrl(id, url)
    if (not duis[id]) then
        return
    end

    local settings = duis[id]
    SetDuiUrl(settings.duiObject, url)
end

exports("ChangeDuiUrl", ChangeDuiUrl)

local function ReleaseDui(id)
    if (not duis[id]) then
        return
    end

    local settings = duis[id]
    local duiSize = settings.duiSize

    SetDuiUrl(settings.duiObject, "about:blank")
    if not availableDuis[duiSize] then
        availableDuis[duiSize] = {}
    end
    availableDuis[duiSize][#availableDuis[duiSize] + 1] = id
end

exports("ReleaseDui", ReleaseDui)
