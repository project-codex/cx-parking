
-- OUR DISCORD: https://discord.gg/y8AjKeAUYX
-- OUR DISCORD: https://discord.gg/y8AjKeAUYX

Config = {} -- Don't touch

Config.UseParkingLots = true -- Put this to true if you don't want to let people park cars everywhere.

Config.UseQbMenu = true -- Set to true if you want qb-menu to show up when you drive in to a parking zone. ( Won't work of UseParkingLots is set to false )

Config.ParkingMenu = { -- qb-menu header
    {
        header = 'Parking', -- Header title
        txt = 'Park or unpark your vehicle!', -- Header description
        params = {
            event = 'parking:client:park' -- Don't change
        }
    }
}

Config.DebugPoly = false -- Set this to true if you want to see all the polyzones.

Config.ParkingLots = {
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
        ['name'] = 'Parking Lot',--['name'] = 'Red Parking',
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
        ['coords'] = vector3(-576.95, -1117.46, 21.68),
        ['name'] = 'Parking Lot',--['name'] = 'Blue Parking',
        ['showBlip'] = true
    },
    ['3'] = {
        ['vectors'] = {
            vector2(-364.69653320312, -866.26135253906),
            vector2(-268.81900024414, -889.12109375),
            vector2(-282.29278564453, -923.46887207031),
            vector2(-298.38165283203, -920.12725830078),
            vector2(-301.69165283203, -929.94725830078),
            vector2(-297.78165283203, -932.87725830078),
            vector2(-315.23165283203, -980.56725830078),
            vector2(-293.77165283203, -988.54725830078),
            vector2(-296.28905883789, -995.34439208984),
            vector2(-365.83947753906, -970.10211181641)
        },
        ['coords'] = vector3(-320.24, -921.68, 31.61),
        ['name'] = 'Parking Lot',--['name'] = 'Alta Parking',
        ['showBlip'] = true
    },
    ['4'] = {
        ['vectors'] = {
            vector2(-440.47, -818.08),
            vector2(-440.47, -795.31),
            vector2(-450.58, -795.31),
            vector2(-450.58, -779.31),
            vector2(-443.21, -779.31),
            vector2(-443.21, -763.12),
            vector2(-474.72, -763.12),
            vector2(-474.72, -739.85),
            vector2(-480.41, -739.85),
            vector2(-480.41, -818.08)
        },
        ['coords'] = vector3(-461.31, -772.83, 50.52),
        ['name'] = 'Parking Lot',--['name'] = 'Caesars Parking',
        ['showBlip'] = true
    },
    ['5'] = {
        ['vectors'] = {
            vector2(412.36, -1282.04),
            vector2(414.15, -1279.99),
            vector2(427.52, -1279.99),
            vector2(427.45, -1273.68),
            vector2(414.15, -1273.68),
            vector2(414.14, -1280),
            vector2(406.15, -1289.99),
            vector2(399.4, -1284.27),
            vector2(393.9, -1291.09),
            vector2(389.55, -1287.32),
            vector2(369.82, -1310.58),
            vector2(374.22, -1314.32),
            vector2(368.57, -1321.11),
            vector2(439.51, -1380.51),
            vector2(445.32, -1373.82),
            vector2(449.44, -1377.41),
            vector2(469.11, -1354.17),
            vector2(464.81, -1350.47),
            vector2(470.41, -1343.81),
            vector2(424.34, -1303.77),
            vector2(429.78, -1296.78)
        },
        ['coords'] = vector3(419.57, -1332.54, 46.05),
        ['name'] = 'Parking Lot',--['name'] = 'Medical Center Parking',
        ['showBlip'] = true
    },
    ['6'] = {
        ['vectors'] = {
            vector2(402.43, -1662.68),
            vector2(377.94, -1641.99),
            vector2(373.59, -1647.08),
            vector2(376.59, -1649.76),
            vector2(350.84, -1680.41),
            vector2(346.12, -1687.59),
            vector2(342.01, -1692.59),
            vector2(363.59, -1710.83),
            vector2(367.79, -1705.83),
            vector2(363.62, -1702.18),
            vector2(395.11, -1665.03),
            vector2(398.27, -1667.71)
        },
        ['coords'] = vector3(370.28, -1675.78, 45.68),
        ['name'] = 'Parking Lot',--['name'] = 'Rancho Parking',
        ['showBlip'] = true
    },
    ['7'] = {
        ['vectors'] = {
            vector2(-1541.5, -969.9),
            vector2(-1525.8, -983.2),
            vector2(-1532.4, -991.2),
            vector2(-1525.5, -993.1),
            vector2(-1579.2, -1056.9),
            vector2(-1585.99, -1055.07),
            vector2(-1590.3, -1060.1),
            vector2(-1600.65, -1051.45),
            vector2(-1596.7, -1046.5),
            vector2(-1604.3, -1039.9),
            vector2(-1608.5, -1044.8),
            vector2(-1614, -1040.3),
            vector2(-1592.7, -1015.13),
            vector2(-1598.1, -1013.6),
            vector2(-1593.5, -1007.83),
            vector2(-1587.8, -1009.33),
            vector2(-1556.17, -971.73),
            vector2(-1549.1, -973.5),
            vector2(-1546.1, -975.3)
        },
        ['coords'] = vector3(-1566.17, -1013.3, 17.54),
        ['name'] = 'Parking Lot',--['name'] = 'Del Perro Pier Parking',
        ['showBlip'] = true
    },
    ['8'] = {
        ['vectors'] = {
            vector2(-1641.7, -830.1),
            vector2(-1651.4, -841.3),
            vector2(-1661.9, -832.3),
            vector2(-1720.4, -900.9),
            vector2(-1704.1, -915.1),
            vector2(-1713.2, -922.5),
            vector2(-1710.6, -926.2),
            vector2(-1704.6, -938.8),
            vector2(-1696.7, -935.1),
            vector2(-1695.5, -936.16),
            vector2(-1695.1, -941.7),
            vector2(-1696.7, -947.09),
            vector2(-1667.2, -956.14),
            vector2(-1664.4, -948.01),
            vector2(-1656.24, -946.4),
            vector2(-1645.3, -938.8),
            vector2(-1636.1, -946.1),
            vector2(-1645.2, -956.81),
            vector2(-1631.2, -968.7),
            vector2(-1627.6, -964.7),
            vector2(-1624.4, -955.9),
            vector2(-1578.8, -902.4),
            vector2(-1609.1, -877.2),
            vector2(-1599.9, -866.6)
        },
        ['coords'] = vector3(-1645.32, -905.54, 10.01),
        ['name'] = 'Parking Lot',--['name'] = 'Del Perro Beach Parking',
        ['showBlip'] = true
    },
    ['9'] = {
        ['vectors'] = {
            vector2(164.1, -1085.1),
            vector2(115.7, -1085.1),
            vector2(115.7, -1079.1),
            vector2(117.4, -1072.9),
            vector2(117.4, -1066.9),
            vector2(107.7, -1066.01),
            vector2(102.5, -1063.7),
            vector2(110.1, -1046.7),
            vector2(115.1, -1048.9),
            vector2(107.7, -1066.01),
            vector2(117.4, -1066.9),
            vector2(140.5, -1067.1),
            vector2(140.4, -1072.8),
            vector2(117.4, -1072.9),
            vector2(115.7, -1079.1),
            vector2(164, -1079.15)
        },
        ['coords'] = vector3(127.27, -1069.87, 29.19),
        ['name'] = 'Parking Lot',--['name'] = 'Elgin Parking',
        ['showBlip'] = true
    },
    ['10'] = {
        ['vectors'] = {
            vector2(248.5, -772.1),
            vector2(253.5, -774.1),
            vector2(238.8, -814.9),
            vector2(228.5, -810.9),
            vector2(243.1, -770.2),
            vector2(236.8, -770.9),
            vector2(222.2, -811.4),
            vector2(216.5, -809.2),
            vector2(217.3, -806.7),
            vector2(212.5, -804.6),
            vector2(226.4, -766.6),
            vector2(221.9, -765.5),
            vector2(208.2, -803.2),
            vector2(203, -801.2),
            vector2(217.2, -763.7),
            vector2(221.9, -765.5),
            vector2(226.4, -766.6),
            vector2(236.8, -770.9),
            vector2(243.1, -770.2),
            vector2(248.5, -772.1),
            vector2(265.2, -767.5),
            vector2(271.2, -748.6),
            vector2(233.2, -735.9),
            vector2(231.2, -741.8),
            vector2(221.5, -746.8),
            vector2(219.2, -753.3),
            vector2(265.2, -767.5)            
        },
        ['coords'] = vector3(227.92, -791.93, 30.66),
        ['name'] = 'Parking Lot',--['name'] = 'Legion Sq. Parking',
        ['showBlip'] = true
    },
    ['11'] = {
        ['vectors'] = {
            vector2(-1250.8, -241.7),
            vector2(-1276.6, -259.7),
            vector2(-1286.5, -245.5),
            vector2(-1290.6, -248.2),
            vector2(-1315.7, -212.2),
            vector2(-1311.8, -209.5),
            vector2(-1319.2, -198.8),
            vector2(-1293.3, -180.7),
            vector2(-1285.8, -191.4),
            vector2(-1282.3, -188.8),
            vector2(-1254.5, -228.6),
            vector2(-1258.2, -231.1)
        },
        ['coords'] = vector3(-1285.09, -220.35, 60.65),
        ['name'] = 'Parking Lot',--['name'] = 'Crastenburg Parking',
        ['showBlip'] = true
    },
    ['12'] = {
        ['vectors'] = {
            vector2(-664.7, -729.6),
            vector2(-664.7, -766.7),
            vector2(-722.7, -766.7),
            vector2(-722.7, -729.6)
        },
        ['coords'] = vector3(-693.79, -747.92, 38.61),
        ['name'] = 'Parking Lot',--['name'] = 'Little Seoul Parking',
        ['showBlip'] = true
    },
    ['13'] = {
        ['vectors'] = {
            vector2(663.5, 197.1),
            vector2(649.5, 158.9),--
            vector2(638.8, 162.8),--
            vector2(635.8, 154.1),
            vector2(623.1, 158.8),--
            vector2(614.4, 124.9),--
            vector2(626, 120.6),
            vector2(633.1, 127.3),
            vector2(637.4, 125.7),
            vector2(627, 96.7),
            vector2(622.5, 98.2),
            vector2(633.1, 127.3),
            vector2(626, 120.6),
            vector2(618.1, 98.4),
            vector2(606.3, 102.7),
            vector2(614.4, 124.9),--
            vector2(609.8, 131),--
            vector2(600, 104.1),
            vector2(602.5, 103.2),
            vector2(599.7, 95.8),
            vector2(595.3, 97.6),
            vector2(599.6, 109.7),
            vector2(597.1, 110.7),
            vector2(605.1, 132.7),
            vector2(609.8, 131),--
            vector2(614.4, 124.9),--
            vector2(623.1, 158.8),--
            vector2(616.8, 158.8),--
            vector2(611.9, 160.7),
            vector2(625.9, 199.3),
            vector2(630.7, 197.5),
            vector2(616.8, 158.8),--
            vector2(623.1, 158.8),--
            vector2(632.9, 186.4),
            vector2(645.6, 181.8),
            vector2(638.8, 162.8),--
            vector2(649.5, 158.9),--
            vector2(659,199)
        },
        ['coords'] = vector3(625.8, 140.28, 95.9),
        ['name'] = 'Parking Lot',--['name'] = 'Downtown Vinewood Parking',
        ['showBlip'] = true
    },
    ['14'] = {
        ['vectors'] = {
            vector2(490.1, -17.6),
            vector2(516, -32.7),
            vector2(526.6, -41.2),
            vector2(508.7, -77.9),
            vector2(481.5, -63.5),
            vector2(472.9, -77.6),
            vector2(458.3, -72.3),
        },
        ['coords'] = vector3(-693.79, -747.92, 38.61),
        ['name'] = 'Parking Lot',--['name'] = 'Hawick Parking',
        ['showBlip'] = true
    },
    ['15'] = {
        ['vectors'] = {
            vector2(295.6, -352.3),
            vector2(290, -350.5),
            vector2(291, -346.9),
            vector2(273.6, -340.7),
            vector2(268.5, -334.9),
            vector2(262.7, -332.8),
            vector2(268.8, -316.6),
            vector2(304.1, -329.5)
        },
        ['coords'] = vector3(285.47, -335.92, 44.92),
        ['name'] = 'Parking Lot',--['name'] = 'Occupation St. Parking',
        ['showBlip'] = true
    },
    ['16'] = {
        ['vectors'] = {
            vector2(33.1, -836.5),
            vector2(43.5, -840),
            vector2(41.9, -844.5),
            vector2(51.3, -848.1),
            vector2(53.3, -843.6),
            vector2(65.7, -848.1),
            vector2(60.1, -863.1),
            vector2(63.1, -864.4),
            vector2(59.4, -873.6),
            vector2(53.3, -871.3),
            vector2(48.8, -883.6),
            vector2(55.4, -886.3),
            vector2(52, -894.8),
            vector2(16.7, -882.2),
        },
        ['coords'] = vector3(40.39, -869.1, 30.48),
        ['name'] = 'Parking Lot',--['name'] = 'Power St. Parking',
        ['showBlip'] = true
    },
    ['17'] = {
        ['vectors'] = {
            vector2(-1063.3, -2632.3),
            vector2(-1010.4, -2540.8),
            vector2(-967.2, -2565.7),
            vector2(-1019.9, -2657.3),----
            vector2(-981.6, -2679.4),----
            vector2(-928.7, -2587.8),
            vector2(-885.4, -2612.8),
            vector2(-938.4, -2704.5),
            vector2(-981.6, -2679.4),----
            vector2(-1019.9, -2657.3),----
        },
        ['coords'] = vector3(-971.16, -2617.88, 34.69),
        ['name'] = 'Parking Lot',--['name'] = 'LSIA Parking',
        ['showBlip'] = true
    }, -- TAXI JOB
    ['18'] = {
        ['vectors'] = {
            vector2(914.36322021484, -154.2741241455),
            vector2(904.47937011718, -170.50817871094),--
            vector2(897.9906616211, -177.660446167),--
            vector2(894.2939453125, -183.78871154786),
            vector2(900.76635742188, -192.04022216796),
            vector2(904.56475830078, -194.2610168457),
            vector2(911.83392333984, -182.86926269532),
            vector2(907.00189208984, -179.56385803222),
            vector2(897.9906616211, -177.660446167),--
            vector2(904.47937011718, -170.50817871094),--
            vector2(913.49353027344, -172.8811340332),
            vector2(918.25665283204, -172.11061096192),
            vector2(925.02313232422, -160.85815429688)
        },
        ['coords'] = vector3(-971.16, -2617.88, 34.69),
        ['name'] = 'Parking Lot',--['name'] = 'Taxi Job',
        ['showBlip'] = false
    }, -- MEGA MALL
    ['19'] = {
        ['vectors'] = {
            vector2(21.342403411866, -1779.555053711),
            vector2(27.197547912598, -1772.2279052734),
            vector2(22.782304763794, -1768.6751708984),
            vector2(16.771995544434, -1762.849975586),
            vector2(19.608226776124, -1758.8829345704),
            vector2(30.901918411254, -1767.6534423828),
            vector2(44.486240386962, -1751.9338378906),
            vector2(34.115818023682, -1742.0637207032),
            vector2(36.834999084472, -1738.8510742188),
            vector2(48.64651107788, -1747.0588378906),
            vector2(53.098175048828, -1741.7900390625),
            vector2(42.826110839844, -1731.7370605468),
            vector2(45.671310424804, -1728.2707519532),
            vector2(57.121578216552, -1736.6290283204),
            vector2(61.57262802124, -1731.3197021484),
            vector2(51.312309265136, -1721.1160888672),
            vector2(54.22554397583, -1718.0123291016),
            vector2(66.308532714844, -1726.1064453125),
            vector2(72.659271240234, -1718.4819335938),
            vector2(68.235397338868, -1714.3116455078),
            vector2(60.726718902588, -1722.4116210938),
            vector2(49.683891296386, -1714.2498779296),
            vector2(55.256561279296, -1708.556640625),
            vector2(48.212284088134, -1702.4167480468),
            vector2(38.489185333252, -1706.7791748046),
            vector2(34.369499206542, -1701.1495361328),
            vector2(-8.363018989563, -1718.7813720704),
            vector2(-2.7687900066376, -1732.9451904296),
            vector2(-7.0755891799926, -1738.4643554688),
            vector2(-14.8264169693, -1747.7681884766),
            vector2(-23.898530960084, -1731.435913086),
            vector2(-18.19142150879, -1729.0635986328),
            vector2(-20.274646759034, -1723.8305664062),
            vector2(-44.402046203614, -1733.6765136718),
            vector2(-4.3467273712158, -1766.1927490234),
            vector2(1.7661526203156, -1762.6143798828)
        },
        ['coords'] = vector3(-971.16, -2617.88, 34.69),
        ['name'] = 'Parking Lot',--['name'] = 'Mega Mall',
        ['showBlip'] = false
    },
    ['20'] = {
        ['vectors'] = {
            vector2(-1190.4321289062, -1467.4033203125),
            vector2(-1195.6381835938, -1471.2690429688),
            vector2(-1201.0750732422, -1474.631225586),
            vector2(-1203.4094238282, -1481.3381347656),
            vector2(-1208.6673583984, -1484.7473144532),
            vector2(-1192.8907470704, -1507.107421875),
            vector2(-1188.3201904296, -1504.4412841796),
            vector2(-1184.384765625, -1498.697265625),
            vector2(-1173.8276367188, -1491.3469238282)
        },
        ['coords'] = vector3(-1187.14, -1484.4, 5.04),
        ['name'] = 'Parking Lot',--['name'] = 'Agujas Parking',
        ['showBlip'] = true
    },
    ['21'] = {
        ['vectors'] = {
            vector2(-2067.6220703125, -454.4514465332),
            vector2(-2064.267578125, -450.62579345704),
            vector2(-2068.38671875, -447.34655761718),
            vector2(-2059.5095214844, -437.19024658204),
            vector2(-2055.689453125, -440.58541870118),
            vector2(-2048.7509765625, -432.9439086914),
            vector2(-2031.978881836, -446.7505493164),
            vector2(-2039.2116699218, -455.66827392578),
            vector2(-2018.8857421875, -472.75552368164),
            vector2(-2011.15625, -463.77233886718),
            vector2(-1986.7760009766, -483.91342163086),
            vector2(-1993.0032958984, -492.95642089844),
            vector2(-2000.9598388672, -502.93515014648),
            vector2(-2010.244140625, -496.05252075196),
            vector2(-2013.6369628906, -500.14083862304),
            vector2(-2020.5407714844, -494.19625854492),
            vector2(-2017.355834961, -490.09921264648),
            vector2(-2021.2653808594, -486.7741394043),
            vector2(-2024.5134277344, -490.75134277344),
            vector2(-2036.2618408204, -480.77941894532),
            vector2(-2033.05859375, -476.8837890625),
            vector2(-2037.443725586, -473.20593261718),
            vector2(-2040.7540283204, -477.0825805664),
            vector2(-2052.7380371094, -467.14013671875),
            vector2(-2049.4077148438, -463.11352539062),
            vector2(-2054.2976074218, -458.9741821289),
            vector2(-2057.7543945312, -463.00177001954)
        },
        ['coords'] = vector3(-2030.43, -465.54, 14.51),
        ['name'] = 'Parking Lot',--['name'] = 'Del Perro Freeway Parking',
        ['showBlip'] = true
    },
    ['22'] = {
        ['vectors'] = {
            vector2(73.510940551758, 6408.041015625),
            vector2(68.6263961792, 6403.548828125),
            vector2(63.874267578125, 6411.1625976562),
            vector2(55.653991699218, 6402.583984375),
            vector2(59.148746490478, 6396.9057617188),
            vector2(53.442901611328, 6392.669921875),
            vector2(49.897811889648, 6397.7944335938),
            vector2(33.622581481934, 6381.177734375),
            vector2(37.336524963378, 6375.5073242188),
            vector2(30.1790599823, 6368.7138671875),
            vector2(26.624881744384, 6374.1469726562),
            vector2(5.5523843765258, 6351.5219726562),
            vector2(9.0406513214112, 6346.431640625),
            vector2(2.738249540329, 6340.259765625),
            vector2(-0.70194900035858, 6345.8344726562),
            vector2(-23.0849609375, 6323.8745117188),
            vector2(-20.098197937012, 6318.4921875),
            vector2(-11.148142814636, 6305.2338867188),
            vector2(40.711978912354, 6334.0317382812),
            vector2(55.461372375488, 6341.9243164062),
            vector2(47.825897216796, 6355.4750976562),
            vector2(59.989852905274, 6367.7509765625),
            vector2(67.900230407714, 6363.28515625),
            vector2(69.677047729492, 6356.521484375),
            vector2(83.27057647705, 6363.2158203125),
            vector2(81.789039611816, 6370.2387695312),
            vector2(92.3978805542, 6374.8217773438),
            vector2(93.884948730468, 6368.5361328125),
            vector2(104.60633850098, 6373.3056640625),
            vector2(102.9621887207, 6380.0610351562),
            vector2(84.662887573242, 6386.5947265625),
            vector2(79.476768493652, 6391.41015625),
            vector2(85.139694213868, 6397.0888671875)
        },
        ['coords'] = vector3(57.18, 6371.62, 31.43),
        ['name'] = 'Parking Lot',--['name'] = 'Paleto Bay Parking',
        ['showBlip'] = true
    },
    ['23'] = {
        ['vectors'] = {
            vector2(1953.2453613282, 3705.2255859375),
            vector2(1950.4096679688, 3710.23046875),
            vector2(1697.7742919922, 3565.59765625),
            vector2(1701.1317138672, 3560.3881835938)
        },
        ['coords'] = vector3(1868.8, 3657.42, 33.85),
        ['name'] = 'Parking Lot',--['name'] = 'Sandy Shores Parking',
        ['showBlip'] = true
    },
    ['24'] = {
        ['vectors'] = {
            vector2(3612.1879882812, 3762.8842773438),
            vector2(3611.6818847656, 3775.4533691406),
            vector2(3610.9931640625, 3779.0131835938),
            vector2(3605.9584960938, 3789.3325195312),
            vector2(3594.0107421875, 3784.3176269532),
            vector2(3582.7299804688, 3786.9602050782),
            vector2(3580.3051757812, 3792.1999511718),
            vector2(3580.5432128906, 3798.6926269532),
            vector2(3517.4897460938, 3800.6479492188),
            vector2(3517.0234375, 3785.8146972656),
            vector2(3510.14453125, 3787.0297851562),
            vector2(3508.9919433594, 3780.353515625),
            vector2(3492.6818847656, 3782.9990234375),
            vector2(3491.4138183594, 3776.9428710938),
            vector2(3518.6267089844, 3771.8466796875),
            vector2(3519.6896972656, 3777.7946777344),
            vector2(3535.2133789062, 3774.4926757812),
            vector2(3545.9223632812, 3772.2814941406),
            vector2(3544.2102050782, 3758.7431640625),
            vector2(3590.9643554688, 3754.3916015625),
            vector2(3597.5615234375, 3754.0493164062),
            vector2(3604.2946777344, 3762.7294921875)
        },
        ['coords'] = vector3(1868.8, 3657.42, 33.85),
        ['name'] = 'Parking Lot',--['name'] = 'Humane Labs Parking',
        ['showBlip'] = false
    },
    ['24'] = {
        ['vectors'] = {
            vector2(2759.9401855468, 1327.1364746094),
            vector2(2760.0056152344, 1334.5383300782),
            vector2(2745.27734375, 1334.4669189454),
            vector2(2745.2705078125, 1396.0102539062),
            vector2(2701.2150878906, 1395.8391113282),
            vector2(2701.3525390625, 1371.4595947266),
            vector2(2671.7673339844, 1371.2396240234),
            vector2(2672.0793457032, 1338.357788086),
            vector2(2679.5119628906, 1338.3681640625),
            vector2(2679.4350585938, 1326.5361328125)
        },
        ['coords'] = vector3(1868.8, 3657.42, 33.85),
        ['name'] = 'Parking Lot',--['name'] = 'Power Plant Parking',
        ['showBlip'] = false
    },
    ['25'] = {
        ['vectors'] = {
            vector2(220.1576385498, 1260.0826416016),
            vector2(221.50457763672, 1254.1735839844),
            vector2(225.29075622558, 1254.9599609375),
            vector2(241.77980041504, 1186.5689697266),
            vector2(238.53588867188, 1185.8638916016),
            vector2(227.841796875, 1230.2797851562),
            vector2(202.96440124512, 1224.1846923828),
            vector2(204.75602722168, 1217.3537597656),
            vector2(220.16101074218, 1220.6912841796),
            vector2(229.44021606446, 1182.3395996094),
            vector2(222.61221313476, 1180.9071044922),
            vector2(226.16444396972, 1162.5782470704),
            vector2(233.69345092774, 1164.342163086),
            vector2(239.94723510742, 1138.9822998046),
            vector2(249.54376220704, 1141.307006836),
            vector2(243.93696594238, 1163.77734375),
            vector2(247.01139831542, 1164.4835205078),
            vector2(252.41110229492, 1141.9948730468),
            vector2(230.22360229492, 1136.716430664),
            vector2(214.10856628418, 1219.0576171875),
            vector2(199.18782043458, 1215.9069824218),
            vector2(193.46838378906, 1239.478881836),
            vector2(198.82276916504, 1240.9669189454),
            vector2(204.55143737792, 1250.0288085938),
            vector2(202.95021057128, 1255.870727539)
        },
        ['coords'] = vector3(1868.8, 3657.42, 33.85),
        ['name'] = 'Parking Lot',--['name'] = 'Sisyphus Parking',
        ['showBlip'] = false
    },
    ['26'] = {
        ['vectors'] = {
            vector2(650.62512207032, 587.75750732422),
            vector2(645.16625976562, 589.76397705078),
            vector2(642.9994506836, 584.14025878906),
            vector2(589.37756347656, 603.68280029296),
            vector2(591.44213867188, 609.33837890625),
            vector2(585.91326904296, 611.41357421875),
            vector2(600.27270507812, 651.08917236328),
            vector2(605.74658203125, 649.08190917968),
            vector2(606.36938476562, 650.68768310546),
            vector2(605.5571899414, 653.63586425782),
            vector2(624.92895507812, 658.81616210938),
            vector2(628.60534667968, 648.24871826172),
            vector2(628.30419921875, 642.34521484375),
            vector2(651.87866210938, 633.76580810546),
            vector2(681.46966552734, 622.85217285156),
            vector2(677.47546386718, 610.41802978516),
            vector2(694.83117675782, 604.28155517578),
            vector2(699.11322021484, 616.42858886718),
            vector2(715.94146728516, 610.30670166016),
            vector2(709.6030883789, 592.4517211914),
            vector2(664.79516601562, 608.93139648438),
            vector2(671.23504638672, 626.57843017578),
            vector2(665.8359375, 628.6050415039)
        },
        ['coords'] = vector3(1868.8, 3657.42, 33.85),
        ['name'] = 'Parking Lot',--['name'] = 'Vinewood Bowl',
        ['showBlip'] = false
    },
    ['27'] = {
        ['vectors'] = {
            vector2(881.37725830078, 7.2929863929748),
            vector2(872.93859863282, 12.689555168152),
            vector2(868.96618652344, 6.4841027259826),
            vector2(877.89837646484, 1.762649178505),
            vector2(872.78015136718, -7.0627164840698),
            vector2(869.77490234375, -5.8454151153564),
            vector2(862.5317993164, -17.109786987304),
            vector2(856.08459472656, -13.16395187378),
            vector2(841.49157714844, -36.746631622314),
            vector2(836.27844238282, -44.80693435669),
            vector2(832.4066772461, -49.083457946778),
            vector2(841.82507324218, -59.143272399902),
            vector2(850.05151367188, -66.3286819458),
            vector2(873.9027709961, -81.20475769043),
            vector2(877.08654785156, -76.025108337402),
            vector2(853.80462646484, -61.437404632568),
            vector2(846.20233154296, -54.574424743652),
            vector2(836.50219726562, -44.44690322876),
            vector2(841.47033691406, -36.624164581298),
            vector2(853.36950683594, -44.088382720948),
            vector2(857.66784667968, -50.84213256836),
            vector2(906.1708984375, -81.270309448242),
            vector2(912.85107421875, -84.404190063476),
            vector2(925.0991821289, -91.925216674804),
            vector2(930.41772460938, -83.266693115234),
            vector2(918.28485107422, -75.487182617188),
            vector2(912.19702148438, -71.714042663574),
            vector2(929.8744506836, -43.214206695556),
            vector2(872.60107421875, -7.3032574653626),
            vector2(877.8189086914, 1.810374379158),
            vector2(892.17199707032, -6.7983946800232),
            vector2(895.59997558594, -1.4614876508712),
            vector2(915.8412475586, -14.222187042236),
            vector2(912.720703125, -19.258378982544),
            vector2(928.36291503906, -29.098337173462),
            vector2(931.62731933594, -23.754447937012),
            vector2(943.50952148438, -31.383039474488),
            vector2(940.41693115234, -36.678550720214),
            vector2(940.99908447266, -39.5747756958),
            vector2(945.9585571289, -42.68278503418),
            vector2(936.90753173828, -57.616073608398),
            vector2(935.67993164062, -61.05897140503),
            vector2(935.49237060546, -64.602027893066),
            vector2(936.86895751954, -67.994438171386),
            vector2(939.12896728516, -70.793823242188),
            vector2(942.46905517578, -73.464057922364),
            vector2(945.30963134766, -78.552192687988),
            vector2(946.1058959961, -84.82462310791),
            vector2(943.95050048828, -91.137489318848),
            vector2(942.17022705078, -93.397911071778),
            vector2(928.90130615234, -105.6120376587),
            vector2(923.11254882812, -108.0352859497),
            vector2(916.40161132812, -107.59442901612),
            vector2(914.40167236328, -106.81209564208),
            vector2(891.4662475586, -92.205863952636),
            vector2(894.72454833984, -87.220581054688),
            vector2(918.142578125, -101.37950134278),
            vector2(921.83331298828, -101.71369934082),
            vector2(925.185546875, -100.14741516114),
            vector2(928.06280517578, -97.497169494628),
            vector2(930.59155273438, -95.226615905762),
            vector2(933.1298828125, -92.925392150878),
            vector2(935.62768554688, -90.602020263672),
            vector2(938.29205322266, -87.960144042968),
            vector2(939.60675048828, -84.260009765625),
            vector2(939.26776123046, -80.637878417968),
            vector2(937.16326904296, -77.73023223877),
            vector2(934.57983398438, -75.341102600098),
            vector2(932.4243774414, -73.009407043458),
            vector2(930.48095703125, -69.671440124512),
            vector2(929.40887451172, -66.771347045898),
            vector2(929.05212402344, -63.758571624756),
            vector2(929.30187988282, -60.770824432374),
            vector2(929.67694091796, -58.568649291992),
            vector2(930.88305664062, -55.46473312378),
            vector2(940.9697265625, -39.5475730896),
            vector2(940.42901611328, -36.70331954956),
            vector2(928.36413574218, -29.132678985596),
            vector2(912.76788330078, -19.256994247436),
            vector2(892.11279296875, -6.7968530654908),
            vector2(877.88330078125, 1.749119400978)
        },
        ['coords'] = vector3(1868.8, 3657.42, 33.85),
        ['name'] = 'Parking Lot',--['name'] = 'Diamond Casino',
        ['showBlip'] = false
    }
}

Config.Depot = { -- You can only have 1 depot.
    ['Hayes Depot'] = {
        label = "Hayes Depot",
        takeVehicle = vector4(491.0, -1314.69, 29.25, 304.5),
        showBlip = true
    }
}
