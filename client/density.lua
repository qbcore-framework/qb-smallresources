local density = 0.8
CreateThread(function()
	while true do
		SetParkedVehicleDensityMultiplierThisFrame(density)
		SetVehicleDensityMultiplierThisFrame(density)
		SetRandomVehicleDensityMultiplierThisFrame(density)
		SetPedDensityMultiplierThisFrame(density)
		SetScenarioPedDensityMultiplierThisFrame(density, density) -- Walking NPC Density
		Wait(0)
	end
end)
