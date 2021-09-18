local objects = {
    {x = 266.09, y = -349.35, z = 44.74, model = "prop_sec_barier_02b"}, 
    {x = 285.28, y = -355.78, z = 45.13, model = "prop_sec_barier_02a"}, 

    -- Pillbox Hospital Parking Barriers
    -- Barrier has two props on each side we remove both of them
    {x = 207.14, y = -803.35, z = 30.98, model = "prop_sec_barrier_ld_01a"},
    {x = 207.14, y = -803.35, z = 30.98, model = "prop_sec_barier_base_01"},
    -- Second Barrier
    {x = 231.08, y = -815.61, z = 30.35, model = "prop_sec_barrier_ld_01a"},
    {x = 231.08, y = -815.61, z = 30.35, model = "prop_sec_barier_base_01"},

    -- Airport Parking Barriers
    {x = -793.63, y = -2024.67, z = 8.99, model = "prop_sec_barier_02b"},
    {x = -798.29, y = -2021.48, z = 9.05, model = "prop_sec_barier_02b"},
}

Citizen.CreateThread(function()
    while true do
        for k, v in pairs(objects) do
            local ent = GetClosestObjectOfType(objects[k].x, objects[k].y, objects[k].z, 2.0, GetHashKey(objects[k].model), false, false, false)

            SetEntityAsMissionEntity(ent, 1, 1)
            DeleteObject(ent)
            SetEntityAsNoLongerNeeded(ent)
        end

        Citizen.Wait(5000)
    end
end)
