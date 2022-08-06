local disableShuffle = true

CreateThread(function()
    while true do
        local ped = PlayerPedId()
        local veh = GetVehiclePedIsIn(ped)
            if IsPedInAnyVehicle(ped, false) and disableShuffle then
                if GetPedInVehicleSeat(veh, false, 0) == ped then
                    if GetIsTaskActive(ped, 165) then
                        SetPedIntoVehicle(ped, veh, 0)
                        SetPedConfigFlag(ped, 184, true)
                    end
                end
            end
        Wait(5)
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

RegisterCommand("shuff", function()
    TriggerEvent("SeatShuffle")
end, false)
