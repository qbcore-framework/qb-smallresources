local animDict = "missminuteman_1ig_2"
local anim = "handsup_base"
local handsup = false

RegisterKeyMapping('hu', 'Put your hands up', 'KEYBOARD', 'X')

RegisterCommand('hu', function()
    local ped = PlayerPedId()
	RequestAnimDict(animDict)
	while not HasAnimDictLoaded(animDict) do
		Wait(100)
	end
    handsup = not handsup
    if exports['qb-policejob']:IsHandcuffed() then return end
    if handsup then
        TaskPlayAnim(ped, animDict, anim, 8.0, 8.0, -1, 50, 0, false, false, false)
        if IsPedInAnyVehicle(ped, false) then
            local vehicle = GetVehiclePedIsIn(ped, false)
            if GetPedInVehicleSeat(vehicle, -1) == ped then
                CreateThread(function()
                    while handsup do
                        Wait(1)
                        DisableControlAction(0, 59, true) -- Disable steering in vehicle
                    end
                end)
            end
        end
    else
        ClearPedTasks(ped)
    end
end, false)
