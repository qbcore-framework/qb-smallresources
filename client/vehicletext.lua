local QBCore = exports['qb-core']:GetCoreObject()

CreateThread(function()
    for _, v in pairs(QBCore.Shared.Vehicles) do
        local text
        if v.brand then
            text = v.brand..' '..v.name
        else
            text = v.name
        end
        if v.hash and v.hash ~= 0 then
            AddTextEntryByHash(v.hash, text)
        end
    end
end)