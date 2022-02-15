THE EVENT FOR PARKING: dk-parking:client:park || You can use this if you want to trigger parking from another script like a radialmenu etc.
!!! THIS RESOURCE IS MADE TO COMPLETELY REPLACE QB-GARAGES !!!

OUR DISCORD: https://discord.gg/y8AjKeAUYX
OUR DISCORD: https://discord.gg/y8AjKeAUYX
OUR DISCORD: https://discord.gg/y8AjKeAUYX
OUR DISCORD: https://discord.gg/y8AjKeAUYX
OUR DISCORD: https://discord.gg/y8AjKeAUYX
OUR DISCORD: https://discord.gg/y8AjKeAUYX
OUR DISCORD: https://discord.gg/y8AjKeAUYX

qb-phone edits:

Navigate to qb-phone/html/index.html
On line 414 Change My Garage to My Vehicles
On line 426 change Garage to Location

qb-vehiclekeys edits:

Protection for parked vehicles so they can't get lockpicked
Navigate to qb-vehiclekeys/client/main.lua
On line 301 replace the event 'lockpicks:UseLockpick' with this:

RegisterNetEvent('lockpicks:UseLockpick', function(isAdvanced)
    QBCore.Functions.TriggerCallback('parking:server:getParkedVehicles', function(vehicles)
        local canLockpick = true
        local closestVehicle = QBCore.Functions.GetClosestVehicle()
        for k, v in pairs(vehicles) do
            if GetVehicleNumberPlateText(closestVehicle) == v then
                QBCore.Functions.Notify('This vehicle cant be lockpicked', 'error')
                canLockpick = false
            end
        end
        if canLockpick then
            LockpickDoor(isAdvanced)
        end
    end)
end)