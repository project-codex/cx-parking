local depotVehicles = {}

QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateCallback('depot:server:getDepotVehicles', function(source, cb)
    cb(depotVehicles)
end)

local function getCid(src)
    local Player = QBCore.Functions.GetPlayer(src)
    local cid = Player.PlayerData.citizenid
    return cid
end

RegisterNetEvent('qb-garage:server:PayDepotPrice', function(vehicle, key)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local cashBalance = Player.PlayerData.money["cash"]
    local bankBalance = Player.PlayerData.money["bank"]
    local result = MySQL.query.await('SELECT * FROM player_vehicles WHERE plate = ?', {vehicle.plate})
    if result[1] then
        if cashBalance >= result[1].depotprice then
            Player.Functions.RemoveMoney("cash", result[1].depotprice, "paid-depot")
            TriggerClientEvent("depot:client:takeOut", src, vehicle, key)
        elseif bankBalance >= result[1].depotprice then
            Player.Functions.RemoveMoney("bank", result[1].depotprice, "paid-depot")
            TriggerClientEvent("depot:client:takeOut", src, vehicle, key)
        else
            TriggerClientEvent('QBCore:Notify', 'Not enough money!', 'error')
        end
    end
    depotVehicles[key] = nil
end)

AddEventHandler("onResourceStart", function(resourceName)
    if ("cx-parking" == resourceName) then
        Wait(1000)
        local result = MySQL.query.await('SELECT * FROM player_vehicles WHERE NOT state = ?', {1})
        for k, v in pairs(result) do
            depotVehicles[#depotVehicles + 1] = v
        end
    end
end)
