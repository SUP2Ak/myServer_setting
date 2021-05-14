Config = {}

Config.Setting = {
    escMenutext         = true,     --false:    désactivera l'option du texte menu échap
    densityMultiplier   = true,     --false:    désactivera la gestion total de la densité pnj/voiture
    densityNpc          = true,     --false:    désactivera la gestion PNJ uniquement
    densityVeh          = true,     --false:    désactivera la gestion de la circulation véhicule PNJ uniquement     
    densityVehParked    = true,     --false:    désactivera la gestion des véhicule spawn (parked) aléatoirement uniquement
    npcRelationship     = true,     --false:    désactivera la gestion des rélation entre les joueurs et NPC (comportement d'attaque des NPC envers les joueurs)
    npcDropWeapon       = false,    --true:     activera le drop des armes pnj
    rewardVeh           = false,    --true:     activera les gain automatique gtaOnline d'armes dans les véhicule type police etc
    npcDispatchService  = false,    --true:     activera les amublancer / police etc... en véhicle npc
    train               = false,    --true:     activera les train
    playerAfkCam        = false,    --true:     activera le passage de caméra en mode AFK
    hudonline           = false,    --true:     vous activerez les hud gtaOnline
    crossHit            = false,    --true:     activera les coups de cross
    xMas                = false,    --true:     activera la neige
}

--Votre texte Menu escape       (escMenutext        = true)
Config.escText = '~m~Votre Texte~w~ ~u~| ~g~myServerESX~w~ ~u~| ~p~discord~o~.~p~gg~y~/~c~hYCR2YKgxB~w~'

--Multiplier configuration plus les chiffres sont elever plus il y aura de drop
Config.npcMultiplier = 0.9     --(densityNpc        = true)
Config.npvehMultiplier = 0.2   --(densityVeh        = true)
Config.pvehMultiplier  = 0.1   --(densityVehParked  = true)

--La liste des PNJ ci dessous ne vous attaqueront pas même si vous les attaquez (npcRelationship = true)
Config.ListRelationShipTypes = {
    GetHashKey('PLAYER'), 
    GetHashKey('CIVMALE'), GetHashKey('CIVFEMALE'), 
    GetHashKey('GANG_1'), GetHashKey('GANG_2'), GetHashKey('GANG_9'), GetHashKey('GANG_10'), GetHashKey('AMBIENT_GANG_LOST'), GetHashKey('AMBIENT_GANG_MEXICAN'), GetHashKey('AMBIENT_GANG_FAMILY'), GetHashKey('AMBIENT_GANG_BALLAS'), GetHashKey('AMBIENT_GANG_MARABUNTE'), GetHashKey('AMBIENT_GANG_CULT'), GetHashKey('AMBIENT_GANG_SALVA'), GetHashKey('AMBIENT_GANG_WEICHENG'), GetHashKey('AMBIENT_GANG_HILLBILLY'), GetHashKey('DEALER'), 
    GetHashKey('COP'), GetHashKey('PRIVATE_SECURITY'), GetHashKey('SECURITY_GUARD'), GetHashKey('ARMY'), GetHashKey('MEDIC'), GetHashKey('FIREMAN'), GetHashKey('HATES_PLAYER'), GetHashKey('NO_RELATIONSHIP'), GetHashKey('SPECIAL'), GetHashKey('MISSION2'), GetHashKey('MISSION3'), GetHashKey('MISSION4'), GetHashKey('MISSION5'), GetHashKey('MISSION6'), GetHashKey('MISSION7'), GetHashKey('MISSION8')
}


--[[
    ____________Features :____________
    -BlackList des véhicule
    -BlackList des ped
    -BlackList des armes
    ...etc dépends des idées
]]


--[[					__SUP2Ak__                            
    /Discord SUP2Ak FiveM-Dev : https://discord.gg/hYCR2YKgxB    /  
    /GitHub : https://github.com/SUP2Ak	                        /   
    /Youtube : https://www.youtube.com/SUPAAkHD                /
    __________________________________________________________/
    |                   __MyProject__
    |    /Serveur RP : AlphaV RP
 ___|    /FiveM      : myServerESX (qui est dans le liens Discord : FiveM-Dev)					  
]]