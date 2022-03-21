QBCore = exports['qb-core']:GetCoreObject()
local firstJoin = false
local parkedVehicles = {}

local function getPlayers()
    local TotalPlayers = 0
    for k, v in pairs(QBCore.Functions.GetPlayers()) do
        TotalPlayers = TotalPlayers + 1
    end

    return TotalPlayers
end

local function round(number, decimals)
    local scale = 10 ^ decimals
    local c = 2 ^ 52 + 2 ^ 51
    return ((number * scale + c) - c) / scale
end

RegisterCommand('park', function(source)
    TriggerClientEvent('parking:client:park', source)
end, false)

RegisterNetEvent('parking:server:checkstate', function(plate)
    local src = source
    local plate = plate
    local state = MySQL.Sync.fetchScalar('SELECT state FROM player_vehicles WHERE plate = ? LIMIT 1', {plate});
    
    local id = 2

    if state == 1 then
        id = 1
    end

    TriggerClientEvent('parking:client:park', src, id)
end)

RegisterNetEvent('parking:server:saveveh', function(myCar, plate, coords, body, engine, carheading, street)
    local mods = json.encode(myCar)

    local carcoords = {}
    carcoords.x = round(coords.x, 2)
    carcoords.y = round(coords.y, 2)
    carcoords.z = round(coords.z, 2)
    carcoords.h = round(carheading, 2)
    local finalcoords = json.encode(carcoords)
    local parked = 1

    MySQL.Async.execute(
        'UPDATE player_vehicles SET coords = ?, mods = ?, engine = ?, body = ?, state = ?, street = ? WHERE plate = ?',
        {finalcoords, mods, engine, body, parked, street, plate})
end)

RegisterNetEvent('parking:server:update', function(hash, plate)
    local plate = plate
    local src = source
    local result = MySQL.query.await('SELECT * FROM player_vehicles WHERE plate = ?', {plate})
    Wait(500)
    for k, v in pairs(result) do
        info = v
    end
    parkedVehicles[#parkedVehicles + 1] = plate

    local mods = info.mods
    local coords = info.coords
    local model = info.vehicle
    local engine = info.engine
    local body = info.body
    local citizenid = info.citizenid

    if coords ~= nil then
        TriggerClientEvent('parking:client:update', src, hash, model, mods, plate, coords, engine, body, citizenid, false)
    else
        TriggerEvent('parking:server:update', hash, plate)
    end
end)

RegisterNetEvent('parking:server:unpark', function(hash, plate)
    local src = source
    local bodydamage = MySQL.query.await('SELECT body FROM player_vehicles WHERE plate = ?', {plate})
    local enginedamage = MySQL.query.await('SELECT engine FROM player_vehicles WHERE plate = ?', {plate})

    for k, v in pairs(bodydamage) do
        bodydamage = v.bodydamage
    end
    for k, v in pairs(enginedamage) do
        bodydamage = v.enginedamage
    end
    local state = 0

    MySQL.Async.execute('UPDATE player_vehicles SET state = ?, street = ? WHERE plate = ?', {state, 'Unknown', plate})
    TriggerClientEvent('parking:client:unpark', src, hash, bodydamage, enginedamage)

    for k, v in pairs(parkedVehicles) do
        if v == plate then
            parkedVehicles[k] = nil
        end
    end
end)

RegisterNetEvent('parking:server:onjoin', function(id, cid)
    local players = getPlayers()
    local result = MySQL.query.await('SELECT * FROM player_vehicles WHERE state = ?', {1})

    if players <= 1 then
        local src = source
        TriggerClientEvent('parking:client:onjoin', id, result)
        firstJoin = true
    else
        local plate, owner, model

        for k, v in pairs(result) do
            plate = v.plate
            owner = v.citizenid
            model = v.vehicle
            if cid == owner then
                TriggerClientEvent('parking:client:addkeys', id, model, plate, owner)
            end
        end
    end
end)

QBCore.Functions.CreateCallback('parking:server:isVehicleParked', function(source, cb, vehPlate)
    local state = MySQL.query.await('SELECT state FROM player_vehicles WHERE plate = ?', {vehPlate})

    if state == 1 then
        cb(true)
    end
end)

AddEventHandler("onResourceStart", function(resourceName)
	if ("cx-parking" == resourceName) then
        Wait(1000)
        local result = MySQL.query.await('SELECT * FROM player_vehicles WHERE state = ?', {1})
        for k, v in pairs(result) do
            parkedVehicles[#parkedVehicles + 1] = v.plate
        end
    end
end)

QBCore.Functions.CreateCallback('parking:server:getParkedVehicles', function(source, cb)
    cb(parkedVehicles)
end)
