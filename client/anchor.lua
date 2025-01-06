local QBCore = exports['qb-core']:GetCoreObject()

RegisterCommand('anchor', function(source, args)
    local boat = GetVehiclePedIsIn(PlayerPedId(), false)
    if GetEntitySpeed(boat * 2.236936) < 5.0 then
        if IsPedInAnyBoat(PlayerPedId()) and not IsBoatAnchoredAndFrozen(boat) then
            SetBoatAnchor(boat, true)
            SetForcedBoatLocationWhenAnchored(boat, true)
            SetBoatFrozenWhenAnchored(boat, true)
            QBCore.Functions.Notify('Your Boat is now anchored', 'info')
        elseif IsPedInAnyBoat(PlayerPedId()) and IsBoatAnchoredAndFrozen(boat) then
            SetBoatAnchor(boat, false)
            SetForcedBoatLocationWhenAnchored(boat, false)
            SetBoatFrozenWhenAnchored(boat, false)
            QBCore.Functions.Notify('Your Boat is no longer anchored', 'info')
        else
            QBCore.Functions.Notify('You are not in a boat', 'info')
        end
    else
        QBCore.Functions.Notify('You are going to fast to anchor your boat', 'error')
    end
end)

RegisterKeyMapping('anchor', 'Anchor/Unanchor Boat', 'keyboard', 'F11')
