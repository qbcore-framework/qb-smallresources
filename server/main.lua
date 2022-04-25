local VehicleNitrous = {}

RegisterNetEvent('tackle:server:TacklePlayer', function(playerId)
    TriggerClientEvent("tackle:client:GetTackled", playerId)
end)

RegisterNetEvent('esx-carwash:server:washCar', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    if xPlayer.getMoney() >= Config.DefaultPrice then
        xPlayer.removeMoney(Config.DefaultPrice)
        TriggerClientEvent('esx-carwash:client:washCar', src)
    else
        xPlayer.showNotification('You dont have enough money!')
    end
end)

ESX.RegisterServerCallback('smallresources:server:GetCurrentPlayers', function(source, cb)
    local TotalPlayers = #(ESX.GetExtendedPlayers())
    cb(TotalPlayers)
end)
