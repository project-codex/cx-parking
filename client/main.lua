QBCore = exports['qb-core']:GetCoreObject()
local citizenid = 0
local isParking = false
local zones = {}
local headerDrawn = false
local vehicleEntities = {}

-- Functions

local DrawText3Ds = function(x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x, y, z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0 + 0.0125, 0.017 + factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

function round(number, decimals)
    local scale = 10 ^ decimals
    local c = 2 ^ 52 + 2 ^ 51
    return ((number * scale + c) - c) / scale
end

function doCarDamage(currentVehicle, engine, body)
    smash = false
    damageOutside = false
    damageOutside2 = false
    local engine = engine + 0.0
    local body = body + 0.0
    if engine < 200.0 then
        engine = 200.0
    end
    
    if engine > 1000.0 then
        engine = 1000.0
    end
    
    if body < 150.0 then
        body = 150.0
    end
    if body < 900.0 then
        smash = true
    end
    
    if body < 800.0 then
        damageOutside = true
    end
    
    if body < 500.0 then
        damageOutside2 = true
    end
    
    Wait(100)
    SetVehicleEngineHealth(currentVehicle, engine)
    if smash then
        SmashVehicleWindow(currentVehicle, 0)
        SmashVehicleWindow(currentVehicle, 1)
        SmashVehicleWindow(currentVehicle, 2)
        SmashVehicleWindow(currentVehicle, 3)
        SmashVehicleWindow(currentVehicle, 4)
    end
    if damageOutside then
        SetVehicleDoorBroken(currentVehicle, 1, true)
        SetVehicleDoorBroken(currentVehicle, 6, true)
        SetVehicleDoorBroken(currentVehicle, 4, true)
    end
    if damageOutside2 then
        SetVehicleTyreBurst(currentVehicle, 1, false, 990.0)
        SetVehicleTyreBurst(currentVehicle, 2, false, 990.0)
        SetVehicleTyreBurst(currentVehicle, 3, false, 990.0)
        SetVehicleTyreBurst(currentVehicle, 4, false, 990.0)
    end
    if body < 1000 then
        SetVehicleBodyHealth(currentVehicle, 985.1)
    end
end

local function getStreet(coords)
    local s1 = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
    local street1 = GetStreetNameFromHashKey(s1)
    local street = street1

    return street
end

local function spawnVehicle(model, coords, plate, props, engine, body)
    local coords = coords
    local vehicle
    QBCore.Functions.SpawnVehicle(model, function(veh)
        vehicle = veh
        SetVehicleNumberPlateText(veh, plate)
        SetEntityHeading(veh, coords.h)
        SetVehicleOnGroundProperly(veh)
        SetEntityCanBeDamaged(veh, false)
        SetEntityInvincible(veh, true)
        FreezeEntityPosition(veh, true)
        SetVehicleDoorsLocked(veh, 2)
        SetVehicleNumberPlateText(veh, plate)
        SetEntityAsMissionEntity(veh, true, true)
        QBCore.Functions.SetVehicleProperties(veh, json.decode(props))
        doCarDamage(veh, engine, body)
        vehicleEntities[#vehicleEntities + 1] = veh
    end, coords, true)
    return vehicle
end

-- Events

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    local id = GetPlayerServerId(PlayerId())
    local PlayerData = QBCore.Functions.GetPlayerData()
    citizenid = PlayerData.citizenid
    TriggerServerEvent('dk-parking:server:onjoin', id, citizenid)
end)

RegisterNetEvent('dk-parking:client:park', function(state)

    if Config.UseQbMenu then
        headerDrawn = false
        exports['qb-menu']:closeMenu()
    end

    local ped = PlayerPedId()
    local pedVeh = GetVehiclePedIsIn(ped, false)
    local vehPlate = GetVehicleNumberPlateText(pedVeh)

    if isParking or not IsPedInAnyVehicle(ped) then
        return
    end

    if GetEntitySpeed(ped) > 1 then
        QBCore.Functions.Notify('Slow down before parking.')
        return
    end

    isParking = true

    QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
        if owned then
            if not state then
                TriggerServerEvent('dk-parking:server:checkstate', vehPlate)
                isParking = false
                return
            end
        else
            QBCore.Functions.Notify('You can only park vehicles that you own!', 'error')
            isParking = false
            return
        end
    end, vehPlate)

    local pedCoords = GetEntityCoords(ped)

    if Config.UseParkingLots and state then
        if not combo:isPointInside(pedCoords) and state ~= 1 then
            QBCore.Functions.Notify('You are not in a parking area!', 'error')
            isParking = false
            return
        end
    end

    local vehCoords, vehHeading = GetEntityCoords(pedVeh), GetEntityHeading(pedVeh)

    if state == 2 then
        local vehBody = GetVehicleBodyHealth(GetVehiclePedIsIn(ped))
        local vehEngine = GetVehicleEngineHealth(GetVehiclePedIsIn(ped))
        local vehMods = QBCore.Functions.GetVehicleProperties(pedVeh)
        local vehStreet = getStreet(vehCoords)
        TaskLeaveVehicle(ped, pedVeh, 0)

        TriggerServerEvent('dk-parking:server:saveveh', vehMods, vehPlate, vehCoords, vehBody, vehEngine, vehHeading, vehStreet)
        Wait(2500)
        TriggerServerEvent('dk-parking:server:update', pedVeh, vehPlate)
        isParking = false
    end

    if state == 1 then
        TriggerServerEvent('dk-parking:server:unpark', pedVeh, vehPlate)
        isParking = false
    end
end)

RegisterNetEvent('dk-parking:client:unpark', function(veh, body, engine)
    SetEntityCanBeDamaged(veh, false)
    SetEntityInvincible(veh, false)
    FreezeEntityPosition(veh, false)

    for k, v in pairs(vehicleEntities) do
        if v == veh then
            vehicleEntities[k] = nil
        end
    end
end)

RegisterNetEvent('dk-parking:client:onjoin', function(result)

    local mods, model, plate, owner, coords, hash, engine, body

    for k, v in pairs(result) do
        mods = v.mods
        plate = v.plate
        owner = v.citizenid
        coords = v.coords
        model = v.vehicle
        engine = v.engine
        body = v.body

        TriggerEvent('dk-parking:client:update', nil, model, mods, plate, coords, engine, body, owner, true)
    end
end)

RegisterNetEvent('dk-parking:client:update', function(hash, model, props, plate, coords, engine, body, vehcid, onspawn)

    local carcoords = json.decode(coords)
    local hashkey = GetHashKey(model)

    if onspawn == false then
        DeleteEntity(hash)
    end

    local veh = spawnVehicle(model, carcoords, plate, props, engine, body)
    Wait(1000)
    if citizenid == 0 or citizenid == nil then
        citizenid = QBCore.Functions.GetPlayerData().citizenid
    end
    if citizenid == vehcid then
        TriggerEvent('vehiclekeys:client:SetOwner', plate)
    end
end)

RegisterNetEvent('dk-parking:client:addkeys', function(model, plate, vehcid)

    if citizenid == 0 or citizenid == nil then
        citizenid = QBCore.Functions.GetPlayerData().citizenid
    end

    if citizenid == vehcid then
        TriggerEvent('vehiclekeys:client:SetOwner', plate)
    end
end)

CreateThread(function()
    while true do
        for k, v in pairs(vehicleEntities) do
            if DoesEntityExist(v) then
                local vehPos = GetEntityCoords(v)
                local pos = GetEntityCoords(PlayerPedId())
                if #(vehPos - pos) < 75 then
                    SetVehicleOnGroundProperly(v)
                    SetEntityCoords(vehPos)
                end
            end
        end
        Wait(5000)
    end
end)

if Config.UseParkingLots then
    for k, v in pairs(Config.ParkingLots) do

        zones[#zones + 1] = PolyZone:Create({table.unpack(v.vectors)}, {
            name = v.name,
        })

        zones[#zones + 1] = zone
    end

    combo = ComboZone:Create(zones, {
        name = "parkingCombo",
        debugPoly = Config.DebugPoly
    })

    CreateThread(function()
        Wait(1000)
        while true do
            if LocalPlayer.state.isLoggedIn then
                local pos = GetEntityCoords(PlayerPedId())
                local isPointInside = combo:isPointInside(pos)
                if isPointInside and IsPedInAnyVehicle(PlayerPedId(), false) then
                    if not headerDrawn then
                        headerDrawn = true
                        exports['qb-menu']:showHeader(Config.ParkingMenu)
                    end
                else
                    if headerDrawn then
                        headerDrawn = false
                        exports['qb-menu']:closeMenu()
                    end
                end
            end
            Wait(3000)
        end
    end)
end

CreateThread(function()
    for k, v in pairs(Config.ParkingLots) do
        if v.showBlip then
            local Parking = AddBlipForCoord(v.coords)
            SetBlipSprite(Parking, 357)
            SetBlipDisplay(Parking, 4)
            SetBlipScale(Parking, 0.7)
            SetBlipAsShortRange(Parking, true)
            SetBlipColour(Parking, 3)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentSubstringPlayerName(v.name)
            EndTextCommandSetBlipName(Parking)
        end
    end
end)
