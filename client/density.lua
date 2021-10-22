Citizen.CreateThread(function()
	while true do
		SetVehicleDensityMultiplierThisFrame(0.05)
	    SetPedDensityMultiplierThisFrame(1.0)
	    SetParkedVehicleDensityMultiplierThisFrame(1.0)

		Citizen.Wait(3)
	end
end)
