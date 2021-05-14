--[[_________Function List_________]]
--Fonction BlackList...

--Fonction drop d'arme
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
--Thread (Wait 2000)
Citizen.CreateThread(function()        
    while true do
        Citizen.Wait(2000)
        if Config.Setting.npcDropWeapon == false then
            SetWeaponDrops()
        end
        if Config.Setting.playerAfkCam == false then
            N_0xf4f2c0d4ee209e20() -- Joueur
            N_0x9e4cfff989258472() -- Véhicule
        end
        if Config.Setting.npcRelationship == true then
            local relationshipTypes = Config.ListRelationShipTypes
            local playerHash = GetHashKey('PLAYER')
            for k,groupHash in ipairs(relationshipTypes) do
                SetRelationshipBetweenGroups(1, playerHash, groupHash)
                SetRelationshipBetweenGroups(1, groupHash, playerHash)
            end
        end
    end
end)

--Thread (Wait 1)
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        if Config.Setting.hudonline == false then
            HideHudComponentThisFrame(7)
            HideHudComponentThisFrame(9)
            HideHudComponentThisFrame(3)
            HideHudComponentThisFrame(4)
            HideHudComponentThisFrame(13)
        end
        if Config.Setting.densityMultiplier == true then
            local npcMultiplier     = Config.npcMultiplier
            local npvehMultiplier   = Config.npvehMultiplier
            local pvehMultiplier    = Config.pvehMultiplier
            if Config.Setting.densityNpc == true then
                SetScenarioPedDensityMultiplierThisFrame(npcMultiplier)
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
        if Config.Setting.rewardVeh == false then
            DisablePlayerVehicleRewards(PlayerId())
        end
        if Config.Setting.npcDispatchService == false then
            for dispatchService = 1, 15 do
                EnableDispatchService(dispatchService, false) --Liste des dispatchService sur FivemNative description de la native (EnableDispatchService)
            end
        end
        if Config.Setting.crossHit == false then
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
    end
end)

--Thread Without Wait()
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


--[[					__SUP2Ak__                            
    /Discord SUP2Ak FiveM-Dev : https://discord.gg/hYCR2YKgxB    /  
    /GitHub : https://github.com/SUP2Ak	                        /   
    /Youtube : https://www.youtube.com/SUPAAkHD                /
    __________________________________________________________/
    |                   __MyProject__
    |    /Serveur RP : AlphaV RP
 ___|    /FiveM      : myServerESX (qui est dans le liens Discord : FiveM-Dev)					  
]]