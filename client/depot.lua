local depotVehicles = {}

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

local function ClearMenu()
	TriggerEvent("qb-menu:closeMenu")
end

local function closeMenuFull()
    ClearMenu()
end

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = QBCore.Functions.GetPlayerData()
    cid = PlayerData.citizenid

    QBCore.Functions.TriggerCallback('depot:server:getDepotVehicles', function(vehicles)
        for k, v in pairs(vehicles) do
            if cid == v.citizenid then
                depotVehicles[#depotVehicles + 1] = v
            end
        end
    end)    
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    depotVehicles = {}
end)

RegisterNetEvent('depot:client:takeOut', function(vehicle, key)
    local vehPlate = vehicle.plate
    local engine, body = vehicle.engine, vehicle.body

    for k, v in pairs(Config.Depots) do
        coords = v.takeVehicle
    end

    QBCore.Functions.SpawnVehicle(vehicle.vehicle, function(veh)
        SetVehicleNumberPlateText(veh, vehPlate)
        SetEntityHeading(veh, coords.w)
        SetVehicleOnGroundProperly(veh)
        SetVehicleNumberPlateText(veh, vehPlate)
        TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
        QBCore.Functions.SetVehicleProperties(veh, json.decode(vehicle.mods))
        doCarDamage(veh, engine, body)
        TriggerEvent(Config.VehicleKeyEvent, vehPlate)
    end, coords, true)
    depotVehicles[key] = nil
end)

local function menuDepot()
    local MenuDepotOptions = {{
        header = "Depot",
        isMenuHeader = true
    }}
    for k, v in pairs(depotVehicles) do

        enginePercent = round(v.engine / 10, 0)
        bodyPercent = round(v.body / 10, 0)
        currentFuel = v.fuel
        vname = QBCore.Shared.Vehicles[v.vehicle].name
        if v.state == 0 then
            v.state = "Impound"
        end

        MenuDepotOptions[#MenuDepotOptions + 1] = {
            header = vname .. " [" .. v.depotprice .. "]",
            txt = "Plate: " .. v.plate .. "<br>Fuel: " .. currentFuel .. " | Engine: " .. enginePercent .. " | Body: " ..
                bodyPercent,
            params = {
                event = "qb-garages:client:TakeOutDepotVehicle",
                args = {
                    value = v,
                    key = k
                }
            }
        }
    end

    MenuDepotOptions[#MenuDepotOptions + 1] = {
        header = "⬅ Leave Depot",
        txt = "",
        params = {
            event = "qb-menu:closeMenu"
        }
    }

    exports['qb-menu']:openMenu(MenuDepotOptions)
    headerDrawn = true
end

RegisterNetEvent('qb-garages:client:TakeOutDepotVehicle', function(data)
    local vehicle = data.value
    local key = data.key
    headerDrawn = false

    if vehicle.state == "Impound" then
        TriggerServerEvent("qb-garage:server:PayDepotPrice", vehicle, key)
        Wait(1000)
    end
end)

CreateThread(function()
    Wait(1000)
    while true do
        Wait(5)
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)
        local inGarageRange = false
        for k, v in pairs(Config.Depots) do
            local depottakeDist = #(pos - vector3(Config.Depots[k].takeVehicle.x, Config.Depots[k].takeVehicle.y, Config.Depots[k].takeVehicle.z))
            if depottakeDist <= 15 then
                inGarageRange = true
                DrawMarker(2, Config.Depots[k].takeVehicle.x, Config.Depots[k].takeVehicle.y,
                    Config.Depots[k].takeVehicle.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 200, 0, 0, 222, false,
                    false, false, true, false, false, false)
                if depottakeDist <= 1.5 then
                    if not IsPedInAnyVehicle(ped) then
                        DrawText3Ds(Config.Depots[k].takeVehicle.x, Config.Depots[k].takeVehicle.y,
                            Config.Depots[k].takeVehicle.z + 0.5, '~g~E~w~ - Garage')
                        if IsControlJustPressed(0, 38) then
                            menuDepot()
                            headerDrawn = true
                        end
                    end
                end
                if depottakeDist >= 4 then
                    closeMenuFull()
                end
            end
        end
        if not inGarageRange then
            Wait(5000)
        end
    end
end)

CreateThread(function()
    for k, v in pairs(Config.Depots) do
        if v.showBlip then
            local Depot = AddBlipForCoord(Config.Depots[k].takeVehicle.x, Config.Depots[k].takeVehicle.y, Config.Depots[k].takeVehicle.z)
            SetBlipSprite(Depot, 68)
            SetBlipDisplay(Depot, 4)
            SetBlipScale(Depot, 0.7)
            SetBlipAsShortRange(Depot, true)
            SetBlipColour(Depot, 5)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentSubstringPlayerName(Config.Depots[k].label)
            EndTextCommandSetBlipName(Depot)
        end
    end
end)