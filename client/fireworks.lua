
local fireworkTime = 0
local fireworkLoc = nil
local fireworkList = {
    ['proj_xmas_firework'] = {
        'scr_firework_xmas_ring_burst_rgw',
        'scr_firework_xmas_burst_rgw',
        'scr_firework_xmas_repeat_burst_rgw',
        'scr_firework_xmas_spiral_burst_rgw',
        'scr_xmas_firework_sparkle_spawn'
    },
    ['scr_indep_fireworks'] = {
        'scr_indep_firework_sparkle_spawn',
        'scr_indep_firework_starburst',
        'scr_indep_firework_shotburst',
        'scr_indep_firework_trailburst',
        'scr_indep_firework_trailburst_spawn',
        'scr_indep_firework_burst_spawn',
        'scr_indep_firework_trail_spawn',
        'scr_indep_firework_fountain'
    },
    ['proj_indep_firework'] = {
        'scr_indep_firework_grd_burst',
        'scr_indep_launcher_sparkle_spawn',
        'scr_indep_firework_air_burst',
        'proj_indep_flare_trail'
    },
    ['proj_indep_firework_v2'] = {
        'scr_firework_indep_burst_rwb',
        'scr_firework_indep_spiral_burst_rwb',
        'scr_xmas_firework_sparkle_spawn',
        'scr_firework_indep_ring_burst_rwb',
        'scr_xmas_firework_burst_fizzle',
        'scr_firework_indep_repeat_burst_rwb'
    }
}


local function startFirework(asset, coords)
    fireworkTime = Config.Fireworks.delay
    fireworkLoc = { x = coords.x, y = coords.y, z = coords.z }
    local pedCoords = GetEntityCoords(PlayerPedId())
    CreateThread(function()
        while fireworkTime > 0 do
            if #(pedCoords - vector3(coords.x, coords.y, coords.z)) < 50.0 then
               exports['qb-core']:DrawText(Lang:t('firework.time_left') .. ' ' .. fireworkTime)
            end
            Wait(1000)
            fireworkTime -= 1
        end
        exports['qb-core']:HideText()
        UseParticleFxAssetNextCall('scr_indep_fireworks')
        for _ = 1, math.random(5, 10), 1 do
            local firework = fireworkList[asset][math.random(1, #fireworkList[asset])]
            UseParticleFxAssetNextCall(asset)
            StartNetworkedParticleFxNonLoopedAtCoord(firework, fireworkLoc.x, fireworkLoc.y, fireworkLoc.z + 42.5, 0.0, 0.0, 0.0, math.random() * 0.3 + 0.5, false, false, false)
            Wait(math.random() * 500)
        end
        fireworkLoc = nil
    end)
end

CreateThread(function()
    local assets = {
        'scr_indep_fireworks',
        'proj_xmas_firework',
        'proj_indep_firework_v2',
        'proj_indep_firework'
    }

    for i = 1, #assets do
        local asset = assets[i]
        if not HasNamedPtfxAssetLoaded(asset) then
            RequestNamedPtfxAsset(asset)
            while not HasNamedPtfxAssetLoaded(asset) do
                Wait(10)
            end
        end
    end
end)

RegisterNetEvent('fireworks:client:UseFirework', function(itemName, assetName)
    QBCore.Functions.Progressbar('spawn_object', Lang:t('firework.place_progress'), 3000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = 'anim@narcotics@trash',
        anim = 'drop_front',
        flags = 16,
    }, {}, {}, function() -- Done
        StopAnimTask(PlayerPedId(), 'anim@narcotics@trash', 'drop_front', 1.0)
        TriggerServerEvent('consumables:server:UseFirework', itemName)
        TriggerEvent('qb-inventory:client:ItemBox', QBCore.Shared.Items[itemName], 'remove')
        local pos = GetEntityCoords(PlayerPedId())
        startFirework(assetName, pos)
    end, function() -- Cancel
        StopAnimTask(PlayerPedId(), 'anim@narcotics@trash', 'drop_front', 1.0)
        QBCore.Functions.Notify(Lang:t('firework.canceled'), 'error')
    end)
end)
