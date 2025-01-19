local debugMode = false
local vehicleAirTime = 0
local brokenWheelIndex = nil

local excludedVehicles = {
    "bifta",
    "sandking",
    "rebel",
    "monster",
}

local function debugPrint(...) 
    if debugMode then
        print(...)
    end
end

CreateThread(function()
    while true do
        Wait(100)

        local player = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(player, false)

        if vehicle ~= 0 and GetPedInVehicleSeat(vehicle, -1) == player then
  
            local vehicleClass = GetVehicleClass(vehicle)
            local vehicleModel = GetEntityModel(vehicle)

            local isExcluded = false
            for _, model in ipairs(excludedVehicles) do
                if GetHashKey(model) == vehicleModel then
                    isExcluded = true
                    debugPrint('Vehicle is excluded from wheel breaking')
                    break
                end
            end

            if not (isExcluded or vehicleClass == 8 or vehicleClass == 9 or vehicleClass == 14 or vehicleClass == 15 or vehicleClass == 16 or vehicleClass == 20 or vehicleClass == 21 or vehicleClass == 22 or vehicleClass == 13) then
                if IsEntityInAir(vehicle) then
                    vehicleAirTime = vehicleAirTime + 0.1
                    debugPrint('Vehicle air time = ' .. vehicleAirTime)
                elseif vehicleAirTime > 1.0 then
                    debugPrint('Breaking wheel off vehicle')
                    brokenWheelIndex = math.random(0, 3)
                    BreakOffVehicleWheel(vehicle, brokenWheelIndex, true, false, false, false)
                    vehicleAirTime = 0
                else
                    vehicleAirTime = 0
                end

                if GetEntityHealth(vehicle) >= 1000 then
                    brokenWheelIndex = nil
                end
            else
                vehicleAirTime = 0 
            end
        else
            vehicleAirTime = 0
            brokenWheelIndex = nil
        end
    end
end)