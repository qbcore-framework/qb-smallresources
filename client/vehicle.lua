local QBCore = exports['qb-core']:GetCoreObject()

local CachedNames = {}

function GetModelName(ModelHash)
    if not CachedNames[ModelHash] then
        CachedNames[ModelHash] = GetLabelText(GetDisplayNameFromVehicleModel(ModelHash))
    end

    return CachedNames[ModelHash]
end

local function GetVehicleClassification(VehicleModel)
	local vehicleClass = GetVehicleClassFromName(VehicleModel)
	if vehicleClass == 13 then
		return "bicycle"
	elseif vehicleClass == 14 then
		return "boat"
	else
		return "car"
	end
end

CreateThread(function()
	for i, v in pairs(QBCore.Shared.Vehicles) do
		local text
		if v["brand"] then
			text = v["brand"] .. " " .. v["name"]
		else
			text = v["name"]
		end
		AddTextEntryByHash(v["hash"],text)
	end
end)
