local disableShuffle = true

RegisterNetEvent('QBCore:Client:EnteredVehicle', function(data)
    local ped = PlayerPedId()
    while IsPedInAnyVehicle(ped, false) do
        local sleep = 100
        if disableShuffle and GetPedInVehicleSeat(data.vehicle, 0) == ped and GetIsTaskActive(ped, 165) then
            sleep = 0
            SetPedIntoVehicle(ped, data.vehicle, 0)
            SetPedConfigFlag(ped, 184, true)
        end
        Wait(sleep)
    end
end)

RegisterNetEvent('SeatShuffle', function()
    local ped = PlayerPedId()
    if IsPedInAnyVehicle(ped, false) then
        disableShuffle = false
        SetPedConfigFlag(ped, 184, false)
        Wait(3000)
        disableShuffle = true
    else
        CancelEvent()
    end
end)

RegisterCommand('shuff', function()
    TriggerEvent('SeatShuffle')
end, false)
