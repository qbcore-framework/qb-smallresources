

CreateThread(function()
    for _, v in pairs(QBCore.Shared.Vehicles) do
        local text
        local name = string.lower(v.name)
        local brand = string.lower(v.brand)
        if v.brand and string.match(name, brand) then
            local nameWithoutBrand = string.gsub(name, brand, "")
            text = v.brand .. ' ' .. nameWithoutBrand
        else
            text = v.name
        end
        if v.hash and v.hash ~= 0 then
            AddTextEntryByHash(v.hash, text)
        end
    end
end)