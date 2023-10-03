local mp_pointing = false

local function startPointing()
    local ped = PlayerPedId()
    RequestAnimDict("anim@mp_point")
    while not HasAnimDictLoaded("anim@mp_point") do
        Wait(10)
    end
    SetPedCurrentWeaponVisible(ped, 0, true, true, true)
    SetPedConfigFlag(ped, 36, 1)
    TaskMoveNetworkByName(ped, 'task_mp_pointing', 0.5, false, 'anim@mp_point', 24)
    RemoveAnimDict("anim@mp_point")
end

local function stopPointing()
    local ped = PlayerPedId()
    if not IsPedInjured(ped) then
        RequestTaskMoveNetworkStateTransition(ped, 'Stop')
        ClearPedSecondaryTask(ped)
        if not IsPedInAnyVehicle(ped, 1) then
            SetPedCurrentWeaponVisible(ped, 1, true, true, true)
        end
        SetPedConfigFlag(ped, 36, false)
    end
end

RegisterCommand('point', function()
    local ped = PlayerPedId()
    if not IsPedInAnyVehicle(ped, false) then
        mp_pointing = not mp_pointing
        if mp_pointing then
            startPointing()
        else
            stopPointing()
        end
        while mp_pointing do
            local camPitch = GetGameplayCamRelativePitch()
            local camHeading = GetGameplayCamRelativeHeading()
            local cosCamHeading = Cos(camHeading)
            local sinCamHeading = Sin(camHeading)
            camPitch = math.max(-70.0, math.min(42.0, camPitch))
            camPitch = (camPitch + 70.0) / 112.0
            camHeading = math.max(-180.0, math.min(180.0, camHeading))
            camHeading = (camHeading + 180.0) / 360.0

            local coords = GetOffsetFromEntityInWorldCoords(ped, (cosCamHeading * -0.2) - (sinCamHeading * (0.4 * camHeading + 0.3)), (sinCamHeading * -0.2) + (cosCamHeading * (0.4 * camHeading + 0.3)), 0.6)
            local ray = StartShapeTestCapsule(coords.x, coords.y, coords.z - 0.2, coords.x, coords.y, coords.z + 0.2, 0.4, 95, ped, 7)
            local _, blocked = GetRaycastResult(ray)
            SetTaskMoveNetworkSignalFloat(ped, "Pitch", camPitch)
            SetTaskMoveNetworkSignalFloat(ped, "Heading", camHeading * -1.0 + 1.0)
            SetTaskMoveNetworkSignalBool(ped, "isBlocked", blocked)
            SetTaskMoveNetworkSignalBool(ped, "isFirstPerson", GetCamViewModeForContext(GetCamActiveViewModeContext()) == 4)
            Wait(0)
        end
    end
end, false)

RegisterKeyMapping('point', 'Toggles Point', 'keyboard', 'B')
