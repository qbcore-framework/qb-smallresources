local inzone = false
local Zones = {}

CreateThread(function()
    while true do
        local coord = GetEntityCoords(PlayerPedId())
        Wait(500)
        for _, zone in pairs(Zones) do
            if Zones[_]:isPointInside(coord) then
                inzone = true
                TriggerEvent("qb-polyzone:enter", _)
                while inzone do
                    local InZoneCoordS = GetEntityCoords(PlayerPedId())

                    if not Zones[_]:isPointInside(InZoneCoordS) then 
                        inzone = false
                    end

                    Wait(250)
                end
                TriggerEvent("qb-polyzone:exit", _)
            end
        end
    end
end)

function AddCircleZone(name, center, radius, options)
    Zones[name] = CircleZone:Create(center, radius, options)
end

function AddBoxZone(name, center, length, width, options)
    Zones[name] = BoxZone:Create(center, length, width, options)
end

function AddPolyZone(name, points, options)
    Zones[name] = PolyZone:Create(points, options)
end
