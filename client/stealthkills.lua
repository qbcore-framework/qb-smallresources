local stealthKills = {
    "ACT_stealth_kill_a",
    "ACT_stealth_kill_weapon",
    "ACT_stealth_kill_b",
    "ACT_stealth_kill_c",
    "ACT_stealth_kill_d",
    "ACT_stealth_kill_a_gardener"
}

CreateThread(function()
    if not Config.Disable.stealthKills then return end
    for i = 1, #stealthKills do
        RemoveStealthKill(joaat(stealthKills[i]), false)
    end
end)