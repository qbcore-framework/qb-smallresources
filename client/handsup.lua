local animDict = "missminuteman_1ig_2"
local anim = "handsup_enter"
local handsup = false

RegisterKeyMapping('hu', 'Put your hands up', 'KEYBOARD', 'X')

RegisterCommand('hu', function()
	RequestAnimDict(animDict)
	while not HasAnimDictLoaded(animDict) do
		Citizen.Wait(100)
	end
    if not handsup then
        TaskPlayAnim(PlayerPedId(), animDict, anim, 8.0, 8.0, -1, 50, 0, false, false, false)
    else
        ClearPedTasks(PlayerPedId())
    end
    handsup = not handsup
end, false)