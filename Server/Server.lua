local empresaSociedad = nil

ESX = nil 

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end) 

for _,v in pairs(Config.Empresas) do
    print("^5[SupremeSystem] ^0Empresas Activas: ^2[" .. v.Name .. "]^0 Propiedad de: ^2["..v.Propietario.."]^0" )
    TriggerEvent('esx_society:registerSociety', v.Job, v.Job, v.Empresasociety, v.Empresasociety, v.Empresasociety, {type = 'public'})
end

ESX.RegisterServerCallback('esx_sup_empresas:getGangsData', function(source,cb)
  local _src = source
  local xPlayer = ESX.GetPlayerFromId(_src)


  for _,empresaID in pairs(Config.Empresas) do
      if CheckJob(xPlayer,empresaID) or CheckOffJob(xPlayer,empresaID) then
          local job = empresaID.Job
          local points = empresaID.Points
          local empresaName = empresaID.Name
          local empresaSociety = empresaID.Empresasociety
          local teleports = empresaID.Teleports
          local items = empresaID.Items
          local coctels = empresaID.Coctels

          cb(job,points,empresaName,empresaSociety,teleports, items, coctels)
      end
  end
end)

function CheckJob(xPlayer,empresaID) 
  if xPlayer.job.name == empresaID.Job then
      return true
  else
      return false
  end
end

function CheckOffJob(xPlayer,empresaID) 
  if xPlayer.job.name == "off"..empresaID.Job then
      return true
  else
      return false
  end
end

RegisterServerEvent('esx_sup_empresas:FabricarCoctel')
AddEventHandler('esx_sup_empresas:FabricarCoctel', function(itemValue, itemA, itemACantidad, itemB, itemBCantidad, itemC, itemCCantidad)
    local _source = source
    local xPlayer        = ESX.GetPlayerFromId(_source)
    local tresItems = false

    local itemACount     = xPlayer.getInventoryItem(itemA).count
    local itemBCount     = xPlayer.getInventoryItem(itemB).count

    if itemC ~= nil then tresItems = true end

  if not tresItems then
    if itemACount < itemACantidad then
        TriggerClientEvent('esx:showNotification', _source, 'No tienes suficientes '..itemA)
    elseif itemBCount < itemBCantidad then
        TriggerClientEvent('esx:showNotification', _source, 'No tienes suficientes '..itemB)
    end

    if itemACount >= itemACantidad and itemBCount >= itemBCantidad then
      TriggerClientEvent('esx:showNotification', _source, 'Preparando '..itemValue)
      TriggerClientEvent('esx_sup_empresas:CoctelAnim', _source)
        SetTimeout(10000, function()

            TriggerClientEvent('esx:showNotification', _source, 'Ya tienes tu '..itemValue)
            xPlayer.removeInventoryItem(itemA, itemACantidad)
            xPlayer.removeInventoryItem(itemB, itemBCantidad)
            xPlayer.addInventoryItem(itemValue, 1)
          end)
    end
  else
    local itemCCount     = xPlayer.getInventoryItem(itemC).count
    if itemACount < itemACantidad then
      TriggerClientEvent('esx:showNotification', _source, 'No tienes suficientes '..itemA)
  elseif itemBCount < itemBCantidad then
      TriggerClientEvent('esx:showNotification', _source, 'No tienes suficientes '..itemB)
  elseif itemCCount < itemCCantidad then
      TriggerClientEvent('esx:showNotification', _source, 'No tienes suficientes '..itemC)
  end

  if itemACount >= itemACantidad and itemBCount >= itemBCantidad and itemCCount >= itemCCantidad then
    TriggerClientEvent('esx:showNotification', _source, 'Preparando '..itemValue)
    TriggerClientEvent('esx_sup_empresas:CoctelAnim', _source)
      SetTimeout(10000, function()

          TriggerClientEvent('esx:showNotification', _source, 'Ya tienes tu '..itemValue)
          xPlayer.removeInventoryItem(itemA, itemACantidad)
          xPlayer.removeInventoryItem(itemB, itemBCantidad)
          xPlayer.removeInventoryItem(itemC, itemCCantidad)
          xPlayer.addInventoryItem(itemValue, 1)
        end)
  end
end
end)