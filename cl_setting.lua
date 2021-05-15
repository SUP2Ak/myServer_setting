

--[[_________local_________]]--
--local iShoot = false
--[[_________Function List_________]]--
--______Function utils______--
function sendForbiddenMessage(message)
	TriggerEvent("chatMessage", "", {0, 0, 0}, "^1" .. message)
end

function _DeleteEntity(entity)
	Citizen.InvokeNative(0xAE3CBE5BF394C9C9, Citizen.PointerValueIntInitialized(entity))
end

--______Function______--
--hud realisticAmmo--[WIP]
--I think creat that with event for more option to get callback in menu or controlpressed [WIP]

--hud weapon reticle--
local scopedWeapons = 
{
    100416529,  -- WEAPON_SNIPERRIFLE
    205991906,  -- WEAPON_HEAVYSNIPER
    3342088282, -- WEAPON_MARKSMANRIFLE
	177293209,  -- WEAPON_HEAVYSNIPER MKII
	1785463520  -- WEAPON_MARKSMANRIFLE_MK2
}
function HashInTable(hash)
    for k, v in pairs(scopedWeapons) do 
        if (hash == v) then 
            return true 
        end 
    end 
    return false 
end 

function ManageReticle()
    local ped = GetPlayerPed(-1)
    local _, hash = GetCurrentPedWeapon(ped, true)
    if not HashInTable(hash) then 
        HideHudComponentThisFrame(14)
	end 
end 
--BlackList Cars--
function checkCar(car)
	if car then
		carModel = GetEntityModel(car)
		carName = GetDisplayNameFromVehicleModel(carModel)
		if isCarBlacklisted(carModel) then
			_DeleteEntity(car)
			sendForbiddenMessage(Config.String.BlacklistCar)
		end
	end
end
function isCarBlacklisted(model)
	for _, blacklistedCar in pairs(Config.carBlacklist) do
		if model == GetHashKey(blacklistedCar) then
			return true
		end
	end
	return false
end
--BlackList Peds--
function isPedBlacklisted(model)
	for _, blacklistedPed in pairs(Config.pedblacklist) do
		if model == GetHashKey(blacklistedPed) then
			return true
		end
	end
	return false
end
--BlackList Weapons--
function isWeaponBlacklisted(model)
	for _, blacklistedWeapon in pairs(Config.weaponblacklist) do
		if model == GetHashKey(blacklistedWeapon) then
			return true
		end
	end
	return false
end
--Drop peds Weapons--
local pedindex = {}
function SetWeaponDrops()
    local handle, ped = FindFirstPed()
    local finished = false
    repeat 
        if not IsEntityDead(ped) then
            pedindex[ped] = {}
        end
        finished, ped = FindNextPed(handle)
    until not finished
    EndFindPed(handle)

    for peds,_ in pairs(pedindex) do
        if peds ~= nil then
            SetPedDropsWeaponsWhenDead(peds, false)
        end
    end
end

--[[_________Thread List_________]]
--Thread Loop (Wait 2000)
Citizen.CreateThread(function()        
    while true do
        Citizen.Wait(2000)
        if Config.Setting.npcNoDropWeapon == true then
            SetWeaponDrops()
        end
        if Config.Setting.afkCamPlayer == true then
            N_0xf4f2c0d4ee209e20() -- Player
            N_0x9e4cfff989258472() -- Veh
        end
        if Config.Setting.npcRelationship == true then
            local relationshipTypes = Config.ListRelationShipTypes
            local playerHash = GetHashKey('PLAYER')
            for k,groupHash in ipairs(relationshipTypes) do
                SetRelationshipBetweenGroups(1, groupHash, playerHash)
            end
        end
        if Config.Blacklist == true then
            local myPed = GetPlayerPed(-1)
            if Config.Setting.BlacklistCar == true then
		        if myPed then
			        checkCar(GetVehiclePedIsIn(myPed, false))

			        x, y, z = table.unpack(GetEntityCoords(myPed, true))
			        for _, blacklistedCar in pairs(Config.carBlacklist) do
				        checkCar(GetClosestVehicle(x, y, z, 100.0, GetHashKey(blacklistedCar), 70))
			        end
		        end
            end
        end
        if Config.Setting.unStamina == true then
            local myPlayerSprint = GetPlayerSprintStaminaRemaining(PlayerId())
            if myPlayerSprint then
                ResetPlayerStamina(PlayerId())
            end
        end
    end
end)

--Thread Loop (wait 750) only for Option EAT A LOT ms x) fuck this fucking native!!!! I think my setting is the best... call me on my discord is not nice x) (look credit for my discord)
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(750)
        --myServer_setting get +0.03ms for that whitout this config, this scope use more CPU client +0.10ms easy
        if Config.Setting.removeAllCopsCarPed == true then
            local myPed         = GetPlayerPed(-1)
            local myPedCoord    = GetEntityCoords(myPed)
            ClearAreaOfCops(myPedCoord.x, myPedCoord.y, myPedCoord.z, 100.0)
        end
    end
end)

--Thread Loop (Wait 0) [this script work only with loop get wait 0 so this myServer_setting get +0.03ms for that]
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if Config.Blacklist == true then
            local myPed = GetPlayerPed(-1)
            if Config.Setting.BlacklistPed == true then
                if myPed then
                    playerModel = GetEntityModel(myPed)
                    if not prevPlayerModel then
                        if isPedBlacklisted(prevPlayerModel) then
                            SetPlayerModel(PlayerId(), GetHashKey(Config.defaultpedmodel))
                        else
                            prevPlayerModel = playerModel
                        end
                    else
                        if isPedBlacklisted(playerModel) then
                            SetPlayerModel(PlayerId(), prevPlayerModel)

                            sendForbiddenMessage(Config.String.BlacklistPed)
                        end
                        prevPlayerModel = playerModel
                    end
                end
            end
            if Config.Setting.BlacklistWeapon == true then
                if myPed then
                    nothing, weapon = GetCurrentPedWeapon(myPed, true)      
                    if Config.disableallweapons then
                        RemoveAllPedWeapons(myPed, true)
                    else
                        if isWeaponBlacklisted(weapon) then
                            RemoveWeaponFromPed(myPed, weapon)
                            sendForbiddenMessage(Config.String.BlacklistWeapon)
                        end
                    end
                end
            end
        end
    end
end)

--Thread Loop (Wait 1)
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        if Config.Setting.noCarJack == true then
            if DoesEntityExist(GetVehiclePedIsTryingToEnter(PlayerPedId())) then
                local veh = GetVehiclePedIsTryingToEnter(PlayerPedId())
                local isLock = GetVehicleDoorLockStatus(veh)
                local ped = GetPedInVehicleSeat(veh, -1)
                if ped then
                    SetPedCanBeDraggedOut(ped, false)
                end
                if isLock == 2 or isLock == 7 or isLock == 8 then
                    SetVehicleDoorsLockedForPlayer(veh, PlayerId(), true)
                end
            end
        end
        if Config.Setting.hideHudonline == true then
            HideHudComponentThisFrame(3)        --CASH
            HideHudComponentThisFrame(4)        --MP_CASH
            HideHudComponentThisFrame(6)        --VEHICLE_NAME
            HideHudComponentThisFrame(7)        --AREA_NAME
            HideHudComponentThisFrame(9)        --STREET_NAME
            HideHudComponentThisFrame(8)       --VEHICLE_NAME
            HideHudComponentThisFrame(13)       --CASH_CHANGE
        end
        if Config.Setting.hideHudWeapon == true then
            if Config.HudWeapon.hudweapon == true then
                HideHudComponentThisFrame(22)   --HUD_WEAPONS
            end
            if Config.HudWeapon.hudcompenents == true then
                HideHudComponentThisFrame(21)   --HUD_COMPONENTS
            end
            if Config.HudWeapon.wheel == true then
                HideHudComponentThisFrame(20)   --WEAPON_WHEEL_STATS
                HideHudComponentThisFrame(19)   --WEAPON_WHEEL
            end
            if Config.HudWeapon.reticle == true then
                ManageReticle()                   ----RETICLE + noHideScope
            end
            if Config.HudWeapon.hudAmmo == true then
                HideHudComponentThisFrame(2)    --WEAPON_ICON
            end
        end
        if Config.Setting.densityMultiplier == true then
            local npcMultiplier     = Config.npcMultiplier
            local npvehMultiplier   = Config.npvehMultiplier
            local pvehMultiplier    = Config.pvehMultiplier
            if Config.Setting.densityNpc == true then
                SetPedDensityMultiplierThisFrame(npcMultiplier)
                SetScenarioPedDensityMultiplierThisFrame(npcMultiplier, npcMultiplier)                    
            end
            if Config.Setting.densityVeh == true then
                SetVehicleDensityMultiplierThisFrame(npvehMultiplier)
                SetRandomVehicleDensityMultiplierThisFrame(npvehMultiplier)
            end
            if Config.Setting.densityVehParked == true then
                SetParkedVehicleDensityMultiplierThisFrame(pvehMultiplier)
            end
        end
        if Config.Setting.noRewardVeh == true then
            DisablePlayerVehicleRewards(PlayerId())
        end
        if Config.Setting.npcDispatchService == true then
            for dispatchService = 1, 15 do
                EnableDispatchService(dispatchService, false) --Liste des dispatchService sur FivemNative description de la native (EnableDispatchService)
            end
        end
        if Config.Setting.noCrossHit == true then
            if  IsPedArmed(PlayerPedId(), 6) then
                DisableControlAction(1, 140, true)
                DisableControlAction(1, 141, true)
                DisableControlAction(1, 142, true)
            end
        end
        if Config.Setting.xMas == true then
            SetWeatherTypePersist("XMAS")
            SetWeatherTypeNowPersist("XMAS")
            SetWeatherTypeNow("XMAS")
            SetOverrideWeather("XMAS")
        end
        if Config.Setting.setDamage == true then
            for _, v in pairs(Config.Setdamage) do
                for i = 1, #v.setting, 1 do
                    local weapon = GetHashKey(v.setting[i].weaponhash)
                    local values = v.setting[i].value
                    if(v.Type == 1)then --cac
                        N_0x4757f00bc6323cfe(weapon, values)
                    else
                        N_0x4757f00bc6323cfe(weapon, values)
                    end
                end
            end
        end
        if Config.noCritikHits == true then
            local ply = PlayerPedId()
            SetPedSuffersCriticalHits(ply, false)
        end
    end
end)

--Thread Without Loop Wait()
Citizen.CreateThread(function()    
    if Config.Setting.train == true then
        SwitchTrainTrack(0, true) -- Train.
        SwitchTrainTrack(3, true) -- Metro.
        N_0x21973bbf8d17edfa(0, 120000)
        SetRandomTrains(1)
    end
    if Config.Setting.escMenutext == true then
        AddTextEntry('FE_THDR_GTAO', Config.escText) --Text menu escap
    end
end)


--______Thread for my test______--
--[[
Citizen.CreateThread(function()

end)
--]]

--[[					__SUP2Ak__                            
    /Discord SUP2Ak FiveM-Dev : https://discord.gg/hYCR2YKgxB    /  
    /GitHub : https://github.com/SUP2Ak	                        /   
    /Youtube : https://www.youtube.com/SUPAAkHD                /
    __________________________________________________________/
    |                   __MyProject__
    |    /Serveur RP : AlphaV RP
 ___|    /FiveM      : myServerESX (qui est dans le liens Discord : FiveM-Dev)					  
]]