local pedboneid = 31086
local defaultflag = 30
local defaultradius = 0.2

-- Function to get the forward vector based on rotation
function GetForwardVector(rotation)
    local rot = (math.pi / 180.0) * rotation
    return vector3(-math.sin(rot.z) * math.abs(math.cos(rot.x)), math.cos(rot.z) * math.abs(math.cos(rot.x)), math.sin(rot.x))
end

exports('GetForwardVector', GetForwardVector)

-- Function to perform a swept sphere raycast
function RayCast(origin, target, options, ignoreEntity, radius)
    local handle = StartShapeTestSweptSphere(origin.x, origin.y, origin.z, target.x, target.y, target.z, radius, options, ignoreEntity, 0)
    return GetShapeTestResult(handle)
end

exports('RayCast', RayCast)

-- Function to get the entity the player is looking at
function GetEntityPlayerIsLookingAt(distance, radius, flag, ignore)
    local distanceToCheck = distance or 3.0
    local playerCoords = GetPedBoneCoords(PlayerPedId(), pedboneid)
    local cameraCoords = GetGameplayCamCoord()
    local forwardVectors = GetForwardVector(GetGameplayCamRot(0))

    if not forwardVectors then return end

    local distanceToPlayer = #(playerCoords - cameraCoords)
    local forwardCoords = cameraCoords + (forwardVectors * (distanceToPlayer + (IsInVehicle and distance + 1.5 or distance)))
    local _, hit, targetCoords, _, targetEntity = RayCast(cameraCoords, forwardCoords, flag or defaultflag, ignore, radius or defaultradius)

    if not hit and targetEntity == 0 then return end

    local entityType = GetEntityType(targetEntity)
    CurrentTargetCoords = targetCoords

    return targetEntity, entityType, targetCoords
end

exports('GetEntityPlayerIsLookingAt', GetEntityPlayerIsLookingAt)
