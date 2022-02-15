QBCore = exports['qb-core']:GetCoreObject()
local citizenid = 0
PlayerData = {}
local isParking = false
local zones = {}
locales = Config.Phrases
local headerDrawn = false

-- Functions

local function saveVehicle(veh, coords, plate, body, engine, carheading)

    local s1, s2 = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
    local street1 = GetStreetNameFromHashKey(s1)
    local street2 = GetStreetNameFromHashKey(s2)
    local street = street1

    local myCar = QBCore.Functions.GetVehicleProperties(veh)

    TriggerServerEvent('dk-parking:server:saveveh', myCar, plate, coords, body, engine, carheading, street)
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
    end, coords, true)
    return vehicle
end

-- Events

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    local id = GetPlayerServerId(PlayerId())
    PlayerData = QBCore.Functions.GetPlayerData()
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
    isParking = true

    QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
        if owned then
            if not state then
                TriggerServerEvent('dk-parking:server:checkstate', vehPlate)
                isParking = false
                return
            end
        else
            TriggerEvent(Config.Notifications.event, locales.you_cant_park_this_vehicle, Config.Notifications.types.bad)
            isParking = false
            return
        end
    end, vehPlate)

    local pedCoords = GetEntityCoords(ped)

    if Config.UseParkingLots and state then
        if not combo:isPointInside(pedCoords) and state ~= 1 then
            TriggerEvent(Config.Notifications.event, locales.you_are_not_in_parking_zone, Config.Notifications.types.bad)
            isParking = false
            return
        end
    end

    local vehCoords, vehHeading = GetEntityCoords(pedVeh), GetEntityHeading(pedVeh)

    if state == 2 then
        local body = GetVehicleBodyHealth(GetVehiclePedIsIn(PlayerPedId()))
        local engine = GetVehicleEngineHealth(GetVehiclePedIsIn(PlayerPedId()))
        saveVehicle(pedVeh, vehCoords, vehPlate, body, engine, vehHeading)
        TaskLeaveVehicle(ped, pedVeh, 0)
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

    local veh = spawnVehicle(model, carcoords, plate, props, engine, body, street)
    Wait(1000)
    if citizenid == 0 or citizenid == nil then
        citizenid = QBCore.Functions.GetPlayerData().citizenid
    end
    if citizenid == vehcid then
        TriggerEvent(Config.VehicleKeyEvent, plate)
    end
end)

RegisterNetEvent('dk-parking:client:addkeys', function(model, plate, vehcid)

    if citizenid == 0 or citizenid == nil then
        citizenid = QBCore.Functions.GetPlayerData().citizenid
    end

    if citizenid == vehcid then
        TriggerEvent(Config.VehicleKeyEvent, plate)
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