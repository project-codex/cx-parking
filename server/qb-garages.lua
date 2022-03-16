QBCore.Functions.CreateCallback("qb-garage:server:checkVehicleOwner", function(source, cb, plate)
    local src = source
    local pData = QBCore.Functions.GetPlayer(src)
    local result = MySQL.query.await('SELECT * FROM player_vehicles WHERE plate = ? AND citizenid = ?', {plate, pData.PlayerData.citizenid})
    if result[1] then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback("qb-garage:server:GetVehicleProperties", function(source, cb, plate)
    local src = source
    local properties = {}
    local result = MySQL.query.await('SELECT mods FROM player_vehicles WHERE plate = ?', {plate})
    if result[1] then
        properties = json.decode(result[1].mods)
    end
    cb(properties)
end)

QBCore.Functions.CreateCallback('qb-garage:server:GetPlayerVehicles', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    local Vehicles = {}

    local result = MySQL.query.await('SELECT * FROM player_vehicles WHERE citizenid = ?', {Player.PlayerData.citizenid})

    if result[1] then
        for k, v in pairs(result) do
            local VehicleData = QBCore.Shared.Vehicles[v.vehicle]

            local vehStreet = v.street

            if not vehStreet then
                vehStreet = 'Unknown'
            end

            if v.state == 0 then
                v.state = Lang:t("status.out")
            elseif v.state == 1 then
                v.state = Lang:t("status.parked")
            elseif v.state == 2 then
                v.state = Lang:t("status.impound")
            end
            
            local fullname 
            if VehicleData["brand"] ~= nil then
                fullname = VehicleData["brand"] .. " " .. VehicleData["name"]
            else
                fullname = VehicleData["name"]
            end    
            Vehicles[#Vehicles+1] = {
                fullname = fullname,
                brand = VehicleData["brand"],
                model = VehicleData["name"],
                plate = v.plate,
                garage = vehStreet,
                state = v.state,
                fuel = v.fuel,
                engine = v.engine,
                body = v.body
            }
        end
        cb(Vehicles)
    else
        cb(nil)
    end
end)
