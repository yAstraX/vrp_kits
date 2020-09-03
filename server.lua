  ----------------------------------
---    |  DESENVOLVIDA POR    |   ----  
---    |     ASTRAX           |   ----
  ----------------------------------
  
  -------------------------------------------------------
--- https://github.com/yAstraX/Fivem-Scripts/tree/master ---
  -------------------------------------------------------

local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

-----------------------------------------------------------------------------------------------------------------------------------------
-- SEGUNDOS
-----------------------------------------------------------------------------------------------------------------------------------------
local segundos = {}
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		for k,v in pairs(segundos) do
			if v > 0 then
				segundos[k] = v - 1
			end
		end
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- /kit
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('kit', function(source,args,rawCommand)
	TriggerClientEvent("givekit",source,args[1])
end)

RegisterCommand('kits', function(source,args,rawCommand)
	TriggerClientEvent("Notify",source,"sucesso","Kits disponiveis: <b>iniciante</b> ,<b>comida</b>.",8000)
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- /darkit
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('darkit', function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"admin.permissao") then
		local nplayer = vRPclient.getNearestPlayer(source,2)
		if nplayer then
			TriggerClientEvent("givekit",nplayer,args[1])
		end
	end
end)

RegisterNetEvent('giveinc')
AddEventHandler('giveinc',function()
	local source = source
	local user_id = vRP.getUserId(source)
		if segundos[user_id] == 0 or not segundos[user_id] then
	-- ITEMS QUE VIRÃO NO KIT
			vRP.giveInventoryItem(user_id,"wbody|WEAPON_KNIFE",1)         
			vRP.giveInventoryItem(user_id,"wbody|WEAPON_FLASHLIGHT",1)
	--
			segundos[user_id] = 540	
			TriggerClientEvent("Notify",source,"sucesso","Kit <b>Iniciante</b> resgatado com sucesso!.",8000)
		else
			TriggerClientEvent("Notify",source,"aviso","Espere <b>"..segundos[user_id].."</b> segundos até que o kit seja liberado!.",8000)
	end
end)

RegisterNetEvent('givecomida')
AddEventHandler('givecomida',function()
    local source = source
	local user_id = vRP.getUserId(source)
		if segundos[user_id] == 0 or not segundos[user_id] then
	-- ITEMS QUE VIRÃO NO KIT
			vRP.giveInventoryItem(user_id,"mre",1)
			vRP.giveInventoryItem(user_id,"garrafadeagua",1)
	--
			segundos[user_id] = 540
			TriggerClientEvent("Notify",source,"sucesso","Kit <b>Comida</b> regastado com sucesso!.",8000)
		else
			TriggerClientEvent("Notify",source,"aviso","Espere <b>"..segundos[user_id].."</b> segundos até que o kit seja liberado!.",8000)
	end
end)

RegisterNetEvent('nc')
AddEventHandler('nc',function()
local user_id = vRP.getUserId(source)
	TriggerClientEvent("Notify",source,"aviso","Kit não encontrado de /kits para ver os kits disponiveis!!",8000)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PANO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("tryclean")
AddEventHandler("tryclean",function(nveh)
	TriggerClientEvent("syncclean",-1,nveh)
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- BANDAGEM
-----------------------------------------------------------------------------------------------------------------------------------------
local segundos = {}
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		for k,v in pairs(segundos) do
			if v > 0 then
				segundos[k] = v - 1
			end
		end
	end
end)
