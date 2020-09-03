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

RegisterNetEvent('givekit')
AddEventHandler('givekit',function(nome)
	if nome == "iniciante" then
			TriggerServerEvent("giveinc",source)			
	
	elseif nome == "comida" then
		TriggerServerEvent("givecomida",source)
		
	else
		TriggerServerEvent("nc",source)
	end
end)