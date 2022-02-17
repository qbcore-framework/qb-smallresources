local gates = {
	'p_barier_test_s',
	'prop_sec_barier_01a',
	'prop_sec_barier_02a',
	'prop_sec_barier_02b',
	'prop_sec_barier_03a',
	'prop_sec_barier_03b',
	'prop_sec_barier_04a',
	'prop_sec_barier_04b',
	'prop_sec_barier_base_01',
	'prop_sec_barrier_ld_01a',
	'prop_sec_barrier_ld_02a',
	'prop_gate_airport_01',
	'prop_facgate_01',
	'prop_facgate_03_l',
	'prop_facgate_03_r',
	'prop_gate_docks_ld'
}

CreateThread(function()
    while true do
		for i=1, #gates do
			Wait(1)
			local coords = GetEntityCoords(PlayerPedId(), false)
			local gate = GetClosestObjectOfType(coords.x, coords.y, coords.z, 100.0, GetHashKey(gates[i]), 0, 0, 0)
			if gate ~= 0 then
				SetEntityAsMissionEntity(gate, 1, 1)
				DeleteObject(gate)
				SetEntityAsNoLongerNeeded(gate)
			end
		end
	   Wait(10000)
    end
end)
