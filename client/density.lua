DecorRegister('ScriptedPed', 2)
local density = 0.8
local MarkedPeds = {}
local RequiredChecks = 4

local function IsModelValid(ped)
	local eType = GetPedType(ped)
	return eType ~= 0 and eType ~= 1 and eType ~= 3 and eType ~= 28 and not IsPedAPlayer(ped)
end

local function IsPedValid(ped)
	local isScripted = DecorExistOn(ped, 'ScriptedPed')
	return not isScripted and IsModelValid(ped) and not IsEntityAMissionEntity(ped) and NetworkGetEntityIsNetworked(ped) and not IsPedDeadOrDying(ped, 1)  and IsPedStill(ped) and IsEntityStatic(ped) and not IsPedInAnyVehicle(ped) and not IsPedUsingAnyScenario(ped)
end

local function DeleteRoguePed(pPed)
	local owner = NetworkGetEntityOwner(pPed)
	if owner == -1 or owner == PlayerId() then
		DeleteEntity(pPed)
	else
		local netId = NetworkGetNetworkIdFromEntity(pPed)
		return { netId = netId, owner = GetPlayerServerId(owner)}
	end
end

RegisterNetEvent('density:client:delete', function(pNetId)
	local entity = NetworkGetEntityFromNetworkId(pNetId)
	if DoesEntityExist(entity) then
		DeleteEntity(entity)
	end
end)

RegisterNetEvent('density:client:decorset', function(pNetId, pType, pProperty, pValue)
	local entity = NetworkGetEntityFromNetworkId(pNetId)
	if DoesEntityExist(entity) then
		if pType == 1 then
			DecorSetFloat(entity, pProperty, pValue)
		elseif pType == 2 then
			DecorSetBool(entity, pProperty, pValue)
		elseif pType == 3 then
			DecorSetInt(entity, pProperty, pValue)
		end
	end
end)

CreateThread(function()
	while true do
		SetParkedVehicleDensityMultiplierThisFrame(density)
		SetVehicleDensityMultiplierThisFrame(density)
		SetRandomVehicleDensityMultiplierThisFrame(density)
		SetPedDensityMultiplierThisFrame(density)
		SetScenarioPedDensityMultiplierThisFrame(density, density)
		Wait(0)
	end
end)

CreateThread(function()
    while true do
		local idle = 2000
		local success
		local handle, ped = FindFirstPed()
		repeat
		
		if IsPedValid(ped) and not MarkedPeds[ped] then
			MarkedPeds[ped] = 1
		end
		
		success, ped = FindNextPed(handle)
		until not success
		EndFindPed(handle)
		Wait(idle)
    end
end)

CreateThread(function()
    while true do
		local idle = 3000
		local toDelete = {}
		local playerCoords = GetEntityCoords(PlayerPedId())

	for ped, count in pairs(MarkedPeds) do
		if ped and DoesEntityExist(ped) and IsPedValid(ped) then
			local entitycoords = GetEntityCoords(ped)
			if count >= RequiredChecks and #(entitycoords - playerCoords) <= 100.0 then
			local deleteInfo = DeleteRoguePed(ped)
				if deleteInfo then
					toDelete[#toDelete+1] = deleteInfo
				end
			end
			MarkedPeds[ped] = count + 1
        else
			MarkedPeds[ped] = nil
        end
	end
	if #toDelete > 0 then
        TriggerServerEvent('density:server:rogue', toDelete)
	end
		Wait(idle)
    end
end)
