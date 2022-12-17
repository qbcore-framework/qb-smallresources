local entPoly = {}

CreateThread(function()
    for _, v in pairs(Config.Objects) do
        entPoly[#entPoly + 1] = BoxZone:Create(v.coords, v.length, v.width, {
            name = v.model,
            debugPoly = false,
            heading = 0,
        })
    end

    local entCombo = ComboZone:Create(entPoly, { name = "entcombo", debugPoly = false })
    entCombo:onPlayerInOut(function(isPointInside)
        if isPointInside then
            for _,v in pairs(Config.Objects) do
                local ent = GetClosestObjectOfType(v.coords.x, v.coords.y, v.coords.z, 2.0, GetHashKey(v.model), false, false, false)
                SetEntityAsMissionEntity(ent, true, true)
                DeleteObject(ent)
                SetEntityAsNoLongerNeeded(ent)
            end
        end
    end)
end)