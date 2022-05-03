jobName, Points, empresaNombre, empresaSociedad, changing, Teleports, Items, Coctels = nil, nil, nil, nil, false, nil, nil, nil

ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do 
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end) 
        Wait(0) 
    end 

    while ESX.GetPlayerData().job == nil do
		Wait(10)
	end

	getPoints()

    ESX.PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	changing = true
	Wait(50)
	ESX.PlayerData.job = job
	empresaNombre, empresaSociedad, Points, jobName, Teleports, Items, Coctels = nil, nil, nil, nil, nil, nil, nil
	getPoints()
end)

function getPoints()
    Wait(1500)
    ESX.TriggerServerCallback('esx_sup_empresas:getGangsData', function(job,points,empresaName,empresaSociety, teleports, items, coctels)
        if job then
            jobName         = job
            Points          = points
            empresaNombre   = empresaName
            empresaSociedad = empresaSociety
			Teleports       = teleports
			Items           = items
			Coctels         = coctels
            VerPuntos()
        end
    end)
end

VerPuntos = function ()
	changing = false

	Citizen.CreateThread(function()
    	while true do
        	Wait(0)

        	local ped = PlayerPedId()
        	local sleep = true
			if changing then
                break
            end

        	for _,v in pairs(Points) do
            	local coords = GetDistanceBetweenCoords(GetEntityCoords(ped), v.coords.x, v.coords.y, v.coords.z, true) 
            	if (coords < 3) then
					sleep = false
					if exports.esx_sup_funciones:isJob(jobName) then
						if v.recogn == "Ropero" then
							if Notify(v.coords,v.notification) then
								TriggerEvent("esx_sup_funciones:OutfitMenu")
                    		end
						elseif v.recogn == "Tienda" then
							if Notify(v.coords,v.notification) then
								TriggerEvent("esx_sup_funciones:OpenShopMenu", Items, empresaSociedad, empresaNombre)
                    		end
						elseif v.recogn == "Nevera" then
							if Notify(v.coords,v.notification) then
								TriggerEvent('esx_sup_funciones:OpenEmpresaStorage', empresaNombre, empresaSociedad)
                    		end
						elseif v.recogn == "Garaje" then
							if Notify(v.coords,v.notification) then
								if exports.esx_sup_funciones:isBoss() then
									TriggerEvent("esx_sup_funciones:SpawnVeh", empresaNombre, v.vehiclespawn, v.heading, v.models, v.color, v.bossmodels)
								else
									TriggerEvent("esx_sup_funciones:SpawnVeh", empresaNombre, v.vehiclespawn, v.heading, v.models, v.color)
								end
							end
						elseif v.recogn == "CarDeleter" and IsPedInAnyVehicle(ped, true) then
							if Notify(v.coords,v.notification) then
								TriggerEvent("esx_sup_funciones:CarDeleter")
							end
						elseif v.recogn == "Offduty" then
							if Notify(v.coords,v.notification) then
								local grade = ESX.PlayerData.job.grade
								TriggerServerEvent('esx_sup_funciones:OffOnDuty', jobName, grade)
							end
						end
						if exports.esx_sup_funciones:isBoss() then
							if v.recogn == "Boss" then
								if Notify(v.coords,v.notification) then
									TriggerEvent("esx_sup_empresas:bossactions", jobName)
                       			end
							elseif v.recogn == "Storage" then
								if Notify(v.coords,v.notification) then
									TriggerEvent('esx_sup_funciones:OpenStorage', empresaNombre)
                    			end
							end
						end
					elseif exports.esx_sup_funciones:isOffJob(jobName) then
						if v.recogn == "Offduty" then
							if Notify(v.coords,v.notification) then
								local grade = ESX.PlayerData.job.grade
								TriggerServerEvent('esx_sup_funciones:OffOnDuty', jobName, grade)
							end
						end
					end
            	end
        	end

			for i=1, #Teleports do
				local coords = GetDistanceBetweenCoords(GetEntityCoords(ped), Teleports[i].coords, true) 
				if exports.esx_sup_funciones:isJob(jobName) then
					if (coords < 1.5) then
						sleep = false
						if Notify(Teleports[i].coords,Teleports[i].notification) then
							TriggerEvent('esx_sup_empresas:teleportMarkers', Teleports[i].teleport)
						end
					end
				end
			end
        	if sleep then Wait(500) end
    	end
	end)
end

RegisterNetEvent("esx_sup_empresas:bossactions")
AddEventHandler("esx_sup_empresas:bossactions", function(job)
	MenuOn = true

    local options = {
        wash = Config.MoneyWash,
    }
    ESX.UI.Menu.CloseAll()

    TriggerEvent('esx_society:openBossMenu', job, function(data, menu) 
        menu.close()
		MenuOn = false
    end,options)

end)

RegisterCommand('openmenuempresa', function ()
	if exports.esx_sup_funciones:isJob(jobName) then

		local elements = {}
		table.insert(elements, {label = 'Factura',    value = 'billing'})
		table.insert(elements, {label = 'Hacer Mezcla',    value = 'mezcla'})
  
		ESX.UI.Menu.CloseAll()
  
		ESX.UI.Menu.Open(
	  	'default', GetCurrentResourceName(), 'bahama_actions',
	  	{
			title    = empresaNombre,
			align    = 'bottom-right',
			elements = elements
	  	},
	  	function(data, menu)
  
			if data.current.value == 'billing' then
		  		OpenBillingMenu()
			end
  
			if data.current.value == 'mezcla' then
				local elements = {}
				for i=1, #Coctels do
					local coctel = Coctels[i]
					table.insert(elements, {
						label             = coctel.label,
						value             = coctel.nombre,
						itemA             = coctel.itemA,
						itemACantidad     = coctel.itemACantidad,
						itemB             = coctel.itemB,
						itemBCantidad     = coctel.itemBCantidad,
						itemC             = coctel.itemC,
						itemCCantidad     = coctel.itemCCantidad
					})
				end
					
				ESX.UI.Menu.Open(
					'default', GetCurrentResourceName(), 'menu_crafting',
					{
						title = 'Hacer Mezcla',
						align = 'bottom-right',
						elements = elements
					},
					function(data2, menu2)
				  
					TriggerServerEvent('esx_sup_empresas:FabricarCoctel', 
					  data2.current.value,
					  data2.current.itemA, 
					  data2.current.itemACantidad, 
					  data2.current.itemB, 
					  data2.current.itemBCantidad, 
					  data2.current.itemC, 
					  data2.current.itemCCantidad
					)
					end,
					function(data2, menu2)
						menu2.close()
					end
				)
			end
	   
	  	end,
	  	function(data, menu)
  
			menu.close()
  
	  	end
		)
	end
end, false)

RegisterKeyMapping('openmenuempresa', ('EmpresasMenu'), 'keyboard', 'F6')

AddEventHandler('esx_sup_empresas:teleportMarkers', function(position)
	SetEntityCoords(GetPlayerPed(-1), position.x, position.y, position.z)
end)

animsAction = function(animObj)
    Citizen.CreateThread(function()
        if not playAnim then
            local playerPed = GetPlayerPed(-1);
            if DoesEntityExist(playerPed) then -- Check if ped exist
                dataAnim = animObj

                -- Play Animation
                RequestAnimDict(dataAnim.lib)
                while not HasAnimDictLoaded(dataAnim.lib) do
                    Wait(0)
                end
                if HasAnimDictLoaded(dataAnim.lib) then
                    local flag = 0
                    if dataAnim.loop ~= nil and dataAnim.loop then
                        flag = 1
                    elseif dataAnim.move ~= nil and dataAnim.move then
                        flag = 49
                    end

                    TaskPlayAnim(playerPed, dataAnim.lib, dataAnim.anim, 8.0, -8.0, -1, flag, 0, 0, 0, 0)
                    playAnimation = true
                end

                -- Wait end animation
                while true do
                    Wait(0)
                    if not IsEntityPlayingAnim(playerPed, dataAnim.lib, dataAnim.anim, 3) then
                        playAnim = false
                        TriggerEvent('ft_animation:ClFinish')
						ESX.ShowNotification('Has terminado la mezcla!')
                        break
                    end
                end
            end -- end ped exist
        end
    end)
end

RegisterNetEvent('esx_sup_empresas:CoctelAnim')
AddEventHandler('esx_sup_empresas:CoctelAnim', function()
	animsAction({ lib = "mini@drinking", anim = "shots_barman_b" })
	exports['progressBars']:startUI(10000, 'Mezclando...')
end)

Citizen.CreateThread(function()
	for k,v in pairs(Config.Empresas) do
		local blip = AddBlipForCoord(v.Blip.Pos.x, v.Blip.Pos.y, v.Blip.Pos.z)

		SetBlipSprite (blip, v.Blip.Sprite)
		SetBlipDisplay(blip, v.Blip.Display)
		SetBlipScale  (blip, v.Blip.Scale)
		SetBlipColour (blip, v.Blip.Colour)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName('STRING')
		AddTextComponentString(v.Name)
		EndTextCommandSetBlipName(blip)
	end
end)

-- Notificacion
Notify = function(position, text)
	local playerPed = PlayerPedId()
	local playerCoords = GetEntityCoords(playerPed)
	
	if #(playerCoords - position) < 1.0 then
		TriggerEvent("esx_sup_funciones:SupremeNotify", text, true, position)
	    	if IsControlJustReleased(0, 38) then
				TriggerEvent("esx_sup_funciones:SupremeNotify", text, false, position)
			    return true
			end
	elseif #(GetEntityCoords(PlayerPedId()) - position) > 1.0 then
		TriggerEvent("esx_sup_funciones:SupremeNotify", text, false, position)
	end
end