
-- OUR DISCORD: https://discord.gg/y8AjKeAUYX
-- OUR DISCORD: https://discord.gg/y8AjKeAUYX

Config = {} -- Don't touch

Config.UseParkingLots = true -- Put this to true if you don't want to let people park cars everywhere.

Config.UseQbMenu = true -- Set to true if you want qb-menu to show up when you drive in to a parking zone. ( Won't work of UseParkingLots is set to false )

Config.VehicleKeyEvent = 'vehiclekeys:client:SetOwner' -- Don't touch if you're not using another vehiclekey system.

Config.Notifications = { -- Don't modify if you don't know what you're doing. If you're having issues- Join my discord and create a ticket.
    ['event'] = 'QBCore:Notify', -- The event notification
    ['types'] = {
        ['good'] = 'success', -- The good/green type
        ['bad'] = 'error' -- The bad/red type
    }
}

Config.ParkingMenu = { -- qb-menu header
    {
        header = 'Parking', -- Header title
        txt = 'Park or unpark your vehicle!', -- Header description
        params = {
            event = 'dk-parking:client:park' -- Don't change
        }
    }
}

Config.DebugPoly = false -- Set this to true if you want to see all the polyzones.

Config.ParkingLots = { -- Create a ticket on discord if you're unsure how to do these zones.
    ['1'] = {
        ['vectors'] = {
            vector2(-265.52224731445, -752.78411865234),
            vector2(-276.49160766602, -777.06677246094),
            vector2(-284.95486450195, -774.57147216797),
            vector2(-289.12078857422, -784.21063232422),
            vector2(-319.15814208984, -773.93432617188),
            vector2(-335.52655029297, -787.63275146484),
            vector2(-335.45526123047, -792.39379882812),
            vector2(-362.92642211914, -792.30969238281),
            vector2(-363.0451965332, -751.48718261719),
            vector2(-359.57531738281, -746.93621826172),
            vector2(-360.78924560547, -726.58422851562),
            vector2(-355.55081176758, -727.20971679688),
            vector2(-355.66015625, -709.26098632812),
            vector2(-355.54187011719, -707.77020263672),
            vector2(-350.4609375, -707.95776367188),
            vector2(-349.09564208984, -712.43273925781)
        },
        ['coords'] = vector3(-332.58, -759.5, 35.81),
        ['name'] = 'Red Garage',
        ['showBlip'] = true
    },
    ['2'] = {
        ['vectors'] = {
            vector2(-571.55474853516, -1167.9885253906),
            vector2(-560.74426269531, -1123.7308349609),
            vector2(-558.39019775391, -1108.1878662109),
            vector2(-558.26678466797, -1101.1785888672),
            vector2(-555.52624511719, -1101.2495117188),
            vector2(-555.25598144531, -1094.7706298828),
            vector2(-556.1689453125, -1088.4525146484),
            vector2(-590.29736328125, -1087.6552734375),
            vector2(-599.29724121094, -1079.7904052734),
            vector2(-622.7001953125, -1079.7532958984),
            vector2(-624.24230957031, -1166.8181152344)
        },
        ['name'] = 'Blue Parking',
        ['showBlip'] = true
    },
    ['3'] = {
        ['vectors'] = {
            vector2(-364.69653320312, -866.26135253906),
            vector2(-268.81900024414, -889.12109375),
            vector2(-282.29278564453, -923.46887207031),
            vector2(-298.38165283203, -920.12725830078),
            vector2(-316.87905883789, -985.56439208984),
            vector2(-365.83947753906, -970.10211181641)
        },
        ['name'] = 'Alta Parking',
        ['showBlip'] = true
    }
}


Config.Phrases = { -- Notification Phrases.
    ['you_are_not_in_parking_zone'] = 'You are not in a parking lot!',
    ['not_enough_money'] = 'Not enough money!',
    ['you_cant_park_this_vehicle'] = 'You can only park vehicles that you own!',
    
}

Config.Depots = { -- You can only have 1 depot.
    ['Hayes Depot'] = {
        label = "Hayes Depot",
        takeVehicle = vector4(491.0, -1314.69, 29.25, 304.5),
        showBlip = true
    }
}