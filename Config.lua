Config = {}

Config.MoneyWash = false -- Enable to the empresas wash money

Config.Empresas = {
    Bahama = {
        Empresasociety = "society_bahamas",
        Name = "Bahama Mamas",
        Job = "bahamas", --job nombre
        Propietario = "Raul",
        Blip = {
            Pos     = { x = -1389.219, y = -585.698, z = 30.22 },
            Sprite  = 93,
            Display = 4,
            Scale   = 0.90,
            Colour  = 8,
        },
        Points = {
            Offduty = {
                coords = vector3(-1385.0816650391,-594.44732666016,30.319261550903), -- Marker coords
                recogn = "Offduty", -- Do not touch this
                notification = "Pulsa ~y~E~w~ para ~g~entrar~w~/~r~salir~w~ de ~y~servicio~w~.", -- Help notification
            },
            Boss = {
                coords = vector3(-1363.6520996094,-623.64251708984,30.32540512085), -- Marker coords
                recogn = "Boss", -- Do not touch this
                notification = "Pulsa ~y~E~w~ para gestionar la ~y~empresa~w~.", -- Help notification
            },
            Storage = {
                coords = vector3(-1364.8186035156,-617.95867919922,30.319417953491), -- Marker coords
                recogn = "Storage", -- Do not touch this
                notification = "Pulsa ~y~E~w~ para abrir el ~y~armario~w~.", -- Help notification
            },
            Ropero = {
                coords = vector3(-1367.5314941406,-613.43920898438,30.31941986084), -- Marker coords   
                recogn = "Ropero", -- Do not touch this
                notification = "Pulsa ~y~E~w~ para abrir el ~y~ropero~w~.", -- Help notification
            },
            Tienda = {
                coords = vector3(-1386.7678222656,-607.05523681641,30.319271087646), -- Marker coords   
                recogn = "Tienda", -- Do not touch this
                notification = "Pulsa ~y~E~w~ para abrir la ~y~tienda~w~.", -- Help notification
            },
            Nevera = {
                coords = vector3(-1388.3688964844,-612.59716796875,30.322214126587), -- Marker coords
                recogn = "Nevera", -- Do not touch this
                notification = "Pulsa ~y~E~w~ para abrir la ~y~nevera~w~.", -- Help notification
            },
            Garaje = { 
                coords = vector3(-1393.1763916016,-631.09307861328,28.695953369141), -- Marker coords 
                vehiclespawn = vector3(-1392.1625976563,-634.6376953125,28.69592666626), -- Coords where vehicle will spawn 
                heading = 114.00, -- Heading of the vehicle when it spawn
                recogn = "Garaje", -- Do not touch this
                color = {255, 255, 255}, -- IN RGB (if the value is not rgb, will not work). Color vehicle spawn.
                notification = "Pulsa ~y~E~w~ para acceder al ~y~garaje~w~.", -- Help notification
                models = { -- Cars that will spawn
				    { model = '',        label = '---VEHICULOS---', upgrades = false},
                    { model = 'windsor2', label = 'Windsor',        upgrades = true},
                    { model = 'stretch', label = 'Limusina',        upgrades = false},
                },
				bossmodels = { -- Cars that will spawn
				    { model = '',        label = '---COCHE BOSS---', upgrades = false},
                    { model = 'zentorno', label = 'Zentorno',        upgrades = true},
                },
            },
            CarDeleter = {
                coords = vector3(-1392.1625976563,-634.6376953125,28.69592666626), -- Marker coords
                recogn = "CarDeleter", -- Do not touch this
                notification = "Pulsa ~y~E~w~ para ~r~guardar~w~ el vehiculo.", -- Help notification
            }
        },
        Teleports = {
            {--TPBarraIn
                coords = vector3(-1396.8139648438,-610.75231933594,30.319246292114), -- Marker coords
                notification = "Pulsa ~y~E~w~ para entrar en la ~y~barra~w~.", -- Help notification
                teleport = vector3(-1394.4826660156,-611.69116210938,30.319242477417), -- Marker coords   
            },
            {--TPBarraOut
                coords = vector3(-1394.4826660156,-611.69116210938,30.319242477417), -- Marker coords     
                notification = "Pulsa ~y~E~w~ para salir de la ~y~barra~w~.", -- Help notification
                teleport = vector3(-1396.8139648438,-610.75231933594,30.319246292114), -- Marker coords      
            },
        },

        Items = {
            {nombre = 'jager',      label = 'Jägermeister',      precio = 3},
            {nombre = 'vodka',      label = 'Vodka',             precio = 4},
            {nombre = 'rhum',       label = 'Ron',               precio = 5},
            {nombre = 'whisky',     label = 'Whisky',            precio = 7},
            {nombre = 'tequila',    label = 'Tequila',           precio = 5},
            {nombre = 'martini',    label = 'Martini',           precio = 5},
            {nombre = 'soda',       label = 'Soda',              precio = 2},
            {nombre = 'jusfruit',   label = 'Zumo de Frutas',    precio = 2},
            {nombre = 'icetea',     label = 'Ice Tea',           precio = 5},
            {nombre = 'energy',     label = 'Bebida Energética', precio = 7},
            {nombre = 'drpepper',   label = 'Dr. Pepper',        precio = 2},
            {nombre = 'limonade',   label = 'Limonada',          precio = 2},
            {nombre = 'ice',        label = 'Hielo',             precio = 1},
            {nombre = 'menthe',     label = 'Menta',             precio = 1}
        },
        Coctels = {
            {nombre = 'jagerbomb',  label = 'JägerBomb',  itemA = 'energy',   itemACantidad = 2, itemB = 'jager',  itemBCantidad = 2},
            {nombre = 'golem',      label = 'Golem',      itemA = 'limonade', itemACantidad = 2, itemB = 'vodka',  itemBCantidad = 2, itemC = 'ice', itemCCantidad = 1},
            {nombre = 'whiskycoca', label = 'Whisky-Cola',itemA = 'soda',     itemACantidad = 2, itemB = 'whisky', itemBCantidad = 2},
            {nombre = 'rhumcoca',   label = 'Ron-Cola',   itemA = 'soda',     itemACantidad = 2, itemB = 'rhum',   itemBCantidad = 2}
        }
    },
    --[[Tequila = {
        Empresasociety = "society_tequila",
        Name = "Tequila",
        Job = "tequila", --job nombre
        Propietario = "El Puto Supre",
        Blip = {
            Pos     = { x = -1389.219, y = -585.698, z = 30.22 },
            Sprite  = 93,
            Display = 4,
            Scale   = 0.90,
            Colour  = 8,
          },
        Points = {
            Offduty = {
                coords = vector3(-1386.6911621094,-589.72381591797,30.319513320923), -- Marker coords
                recogn = "Offduty", -- Do not touch this
                notification = "Pulsa ~y~E~w~ para ~g~entrar~w~/~r~salir~w~ de ~y~servicio~w~.", -- Help notification
            },
            Boss = {
                coords = vector3(-1371.5994873047,-626.13348388672,30.819580078125), -- Marker coords
                recogn = "Boss", -- Do not touch this
                notification = "Pulsa ~y~E~w~ para gestionar la ~y~empresa~w~.", -- Help notification
            },
            Storage = {
                coords = vector3(-1373.5876464844,-627.22943115234,30.819576263428), -- Marker coords
                recogn = "Storage", -- Do not touch this
                notification = "Pulsa ~y~E~w~ para abrir el ~y~armario~w~.", -- Help notification
            },
            Ropero = {
                coords = vector3(-1389.2584228516,-592.14508056641,30.319553375244), -- Marker coords   
                recogn = "Ropero", -- Do not touch this
                notification = "Pulsa ~y~E~w~ para abrir el ~y~ropero~w~.", -- Help notification
            },
            Tienda = {
                coords = vector3(-1390.3522949219,-600.43212890625,30.319562911987), -- Marker coords   
                recogn = "Tienda", -- Do not touch this
                notification = "Pulsa ~y~E~w~ para abrir la ~y~tienda~w~.", -- Help notification
            },
            Nevera = {
                coords = vector3(-1390.8732910156,-606.73095703125,30.319557189941), -- Marker coords
                recogn = "Nevera", -- Do not touch this
                notification = "Pulsa ~y~E~w~ para abrir la ~y~nevera~w~.", -- Help notification
            },
            Garaje = { 
                coords = vector3(-1385.2691650391,-641.84881591797,28.673587799072), -- Marker coords 
                vehiclespawn = vector3(-1375.9307861328,-647.11791992188,28.676122665405), -- Coords where vehicle will spawn 
                heading = 210.00, -- Heading of the vehicle when it spawn
                recogn = "Garaje", -- Do not touch this
                color = {255, 255, 255}, -- IN RGB (if the value is not rgb, will not work). Color vehicle spawn.
                notification = "Pulsa ~y~E~w~ para acceder al ~y~garaje~w~.", -- Help notification
                models = { -- Cars that will spawn
				    { model = '',        label = '---VEHICULOS---', upgrades = false},
                    { model = 'windsor2', label = 'Windsor',        upgrades = true},
                    { model = 'stretch', label = 'Limusina',        upgrades = false},
                },
				bossmodels = { -- Cars that will spawn
				    { model = '',        label = '---COCHE BOSS---', upgrades = false},
                    { model = 'zentorno', label = 'Zentorno',        upgrades = true},
                },
            },
            CarDeleter = {
                coords = vector3(-1379.2236328125,-650.42144775391,28.679300308228), -- Marker coords
                recogn = "CarDeleter", -- Do not touch this
                notification = "Pulsa ~y~E~w~ para ~r~guardar~w~ el vehiculo.", -- Help notification
            }
        },
        Teleports = {
        },
        Items = {

            {nombre = 'menthe',     label = 'Menta',             precio = 1}
        },
        Coctels = {

            {nombre = 'rhumcoca',   label = 'Ron-Cola',   itemA = 'soda',     itemACantidad = 2, itemB = 'rhum',   itemBCantidad = 2}
        }
    }--]]
}
