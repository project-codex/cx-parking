# dk-parking

## This is a Real life-like parking system for the [qb-core](https://github.com/qbcore-framework/qb-core) framework.

### Join My [Discord](https://discord.gg/y8AjKeAUYX) For Support

THIS RESOURCE IS MEANT TO REPLACE QB-GARAGES

# Screenshots
![photo1](https://i.imgur.com/TduohMV.jpeg)
![photo2](https://i.imgur.com/tYpzO8t.jpeg)


# Dependencies
- [oxmysql](https://github.com/overextended/oxmysql/releases/tag/v1.9.3)
- [qb-core](https://github.com/qbcore-framework/qb-core)
- [qb-vehiclekeys](https://github.com/qbcore-framework/qb-vehiclekeys)
- [polyzone](https://github.com/mkafrin/PolyZone)


## Installation
- Download the .zip file and extract it in to your resources folder
- Run the .sql file
- Configure everything in config.lua
- Add ensure dk-parking in your server.cfg

## Extra steps to complete the transition
### Phone changes
Navigate to qb-phone/html/index.html
On line 414 Change My Garage to My Vehicles
On line 426 change Garage to Location
````html
    <div class="garage-app-header">
        My Vehicles
    </div>
````

````html
    <div class="vehicle-garage"><span class="vehicle-detail">Location</span><span class="vehicle-answer">BMW M5</span></div>
````

### qb-vehiclekeys changes (To avoid people lockpicking parked vehicles (optional))

Protection for parked vehicles so they can't get lockpicked
Navigate to qb-vehiclekeys/client/main.lua
On line 301 replace the event 'lockpicks:UseLockpick' with this:

````lua
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
````

### Feel free to make pull requests if you have any improvements in mind!