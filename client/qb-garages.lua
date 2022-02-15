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
