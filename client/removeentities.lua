local objects = {
    {x = 266.09, y = -349.35, z = 44.74, model = "prop_sec_barier_02b"},
    {x = 285.28, y = -355.78, z = 45.13, model = "prop_sec_barier_02a"},
    {x = 230.92, y = -816.15, z = 30.17, model = "prop_sec_barrier_ld_01a"},
    {x = 230.92, y = -816.15, z = 30.17, model = "prop_sec_barier_base_01"},
    {x = 206.53, y = -803.25, z = 30.95, model = "prop_sec_barrier_ld_01a"},
    {x = 206.53, y = -803.25, z = 30.95, model = "prop_sec_barier_base_01"},
    {x = 224.15, y = -740.13, z = 34.24, model = "prop_sec_barrier_ld_01a"},
    {x = 224.15, y = -740.13, z = 34.24, model = "prop_sec_barier_base_01"},
    {x = 2567.34, y = 2713.8, z = 42.13, model = "prop_sec_barrier_ld_01a"},
    {x = 2567.34, y = 2713.8, z = 42.13, model = "prop_sec_barier_base_01"},
    {x = 180.81, y = -727.87, z = 32.82, model = "prop_sec_barier_03b"},
    {x = 183.95, y = -719.09, z = 32.92, model = "prop_sec_barier_03a"},
    {x = 1039.1, y = -763.2, z = 57.8, model = "prop_sec_barier_02b"},
    {x = 1030.51, y = -758.53, z = 57.87, model = "prop_sec_barier_02b"},
}

CreateThread(function()
    while true do
        for k in pairs(objects) do
            local ent = GetClosestObjectOfType(objects[k].x, objects[k].y, objects[k].z, 2.0, GetHashKey(objects[k].model), false, false, false)

            SetEntityAsMissionEntity(ent, true, true)
            DeleteObject(ent)
            SetEntityAsNoLongerNeeded(ent)
        end

        Wait(5000)
    end
end)
