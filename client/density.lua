local Density = {
    ['Parked'] = 0.8,
    ['Vehicle'] = 0.8,
    ['Multiplier'] = 0.8,
    ['Peds'] = 0.8,
    ['Scenario'] = 0.8,
}

CreateThread(function()
	while true do
		SetParkedVehicleDensityMultiplierThisFrame(Density['Parked'])
		SetVehicleDensityMultiplierThisFrame(Density['Vehicle'])
		SetRandomVehicleDensityMultiplierThisFrame(Density['Multiplier'])
		SetPedDensityMultiplierThisFrame(Density['Peds'])
		SetScenarioPedDensityMultiplierThisFrame(Density['Scenario'], Density['Scenario']) -- Walking NPC Density
		Wait(0)
	end
end)
