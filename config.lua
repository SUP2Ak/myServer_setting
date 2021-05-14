Config = {}
Config.Blacklist    = false                --false TurnOff Blacklist mod, master of {BlacklistCar, BlacklistPed, BlacklistWeapon}
Config.Setting      = {
    noCarJack               = false,    --true:     activera le noCarJack (ps: serveur RP avec achat de véhicule need de check si le véhicule est achetez, se script est pour version Standalone, seulement les véhicule avec Pnj et fermer de base[donc pas possible de briser les vitres]) 
    unStamina               = false,    --true:     activera le sprint illimité
    BlacklistCar            = false,    --true:     activera l'option [forPlayer]    {need Config.Blacklist = true to work} 
    BlacklistPed            = false,    --true:     activera l'option [ForPlayer]    {need Config.Blacklist = true to work} 
    BlacklistWeapon         = false,    --true:     activera l'option [forPlayer]    {need Config.Blacklist = true to work} 
    escMenutext             = false,    --true:     activera l'option du texte menu échap
    densityMultiplier       = false,    --true:     activera la gestion total de la densité pnj/voiture
    densityNpc              = false,    --true:     activera la gestion PNJ uniquement
    densityVeh              = false,    --true:     activera la gestion de la circulation véhicule PNJ uniquement     
    densityVehParked        = false,    --true:     activera la gestion des véhicule spawn (parked) aléatoirement uniquement
    npcRelationship         = false,    --true:     activera le fait que les pnj ne vous attaque pas
    npcNoDropWeapon         = false,    --true:     désactivera le drop des armes pnj
    noRewardVeh             = false,    --true:     déactivera les gain automatique gtaOnline d'armes dans les véhicule type police etc
    npcDispatchService      = false,    --true:     déactivera les amublancier / police etc... en service
    train                   = false,    --true:     activera les train
    afkCamPlayer            = false,    --true:     désactivera le passage de caméra en mode AFK
    hideHudonline           = false,    --true:     désactivera les hud gtaOnline
    HidehudWeapon           = false,    --true:     active {Config.HudWeapon} pour cacher les hud Weapon GTAonline et roue d'arme selon vos parametre
    noCrossHit              = false,    --true:     désactivera les coups de cross
    xMas                    = false,    --true:     activera la neige
    removeAllCopsCarPed     = false,    --true:     désactivera le spawn des véhicule Ped de police autour des joueurs (J'ai réussit a trouver le reglagle le plus opti et fonctionnel a la fois je pense car cette option consomme trop de radius sa pic les ms, wait trop long les vehicule spawn et trop court bouffe de ms xD)
}
--List of message you see in chat
Config.String = {
    BlacklistCar        = "Ce véhicule est blacklist!",
    BlacklistPed        = "Ce ped est blacklist!",
    BlacklistWeapon     = "Cette arme est blacklist",
}
--Your text in escape menu top of the map      (escMenutext        = true)
Config.escText = '~m~Your Text~w~ ~u~| ~g~myServerESX~w~ ~u~| ~p~discord~o~.~p~gg~y~/~c~hYCR2YKgxB~w~'
--Mulitiplier config for npc/vehicle/parked vehicle
Config.npcMultiplier    = 0.4   --(if densityNpc        = true) set 0 to delete npc
Config.npvehMultiplier  = 0.1   --(if densityVeh        = true) set 0 to clear npc driver
Config.pvehMultiplier   = 0.2   --(if densityVehParked  = true) set 0 to clear all veh parked

--List of ... {need Config.Setting.npcRelationshipPeaceful = true}
Config.ListRelationShipTypes = {
    GetHashKey('PLAYER'), 
    GetHashKey('CIVMALE'), GetHashKey('CIVFEMALE'), 
    GetHashKey('GANG_1'), GetHashKey('GANG_2'), GetHashKey('GANG_9'), GetHashKey('GANG_10'), GetHashKey('AMBIENT_GANG_LOST'), GetHashKey('AMBIENT_GANG_MEXICAN'), GetHashKey('AMBIENT_GANG_FAMILY'), GetHashKey('AMBIENT_GANG_BALLAS'), GetHashKey('AMBIENT_GANG_MARABUNTE'), GetHashKey('AMBIENT_GANG_CULT'), GetHashKey('AMBIENT_GANG_SALVA'), GetHashKey('AMBIENT_GANG_WEICHENG'), GetHashKey('AMBIENT_GANG_HILLBILLY'), GetHashKey('DEALER'), 
    GetHashKey('COP'), GetHashKey('PRIVATE_SECURITY'), GetHashKey('SECURITY_GUARD'), GetHashKey('ARMY'), GetHashKey('MEDIC'), GetHashKey('FIREMAN'), GetHashKey('HATES_PLAYER'), GetHashKey('NO_RELATIONSHIP'), GetHashKey('SPECIAL'), GetHashKey('MISSION2'), GetHashKey('MISSION3'), GetHashKey('MISSION4'), GetHashKey('MISSION5'), GetHashKey('MISSION6'), GetHashKey('MISSION7'), GetHashKey('MISSION8')
}
--List of car blacklist {need Config.Setting.BlacklistCar = true}
Config.carBlacklist = {
	--"RHINO",
    --"ADDER"
}
Config.disableallweapons = false
--List of weapon blacklist {need Config.Setting.BlacklistWeapon = true}
Config.weaponblacklist = {
	--"WEAPON_MINIGUN",
	--"WEAPON_STUNGUN",
}
--Default ped if you use ped blacklist {need Config.Setting.BlacklistPed = true}
Config.defaultpedmodel = "a_f_m_fatcult_01"     --I like troll
--List of ped blacklist {need Config.Setting.BlacklistPed = true}
Config.pedblacklist = {
	--"a_f_m_bodybuild_01",                     --just for test
}
--List of Hud Weapon you want hide {need Config.Setting.HidehudWeapon = true}
Config.HudWeapon = {
    hudweapon           = false,     --weapon top-right
    hudcompenents       = false,     --compenent trop-right
    wheel               = false,     --wheel list to get your weapon (+stats of weapon)
    reticle             = false,     --reticle... you know what is that? xD (crosshair)
    icon                = false,     --ammo hud
}

--[[____________Features :____________
    For this resources:
        Only if people want i add something but now havn't idea x)
        Version EN full soonn i prefrer created other repo for commentary code in config, but my english isn't really nice xD
        ESX function maybe if have time but i creat other repo because i prefrer link 2version for people not using ESX stay with this version and they havn't useless code xD
    end
]]

--[[____________Commentary :____________
    For myServerESX:
        But my work : myServerESX is only for french :/ but maybe when have time i update this for you too but change every commentary have make in all scripts for you with my english... but if people with nice english and speak french want work with me why not :D
    For my discord:
        English channel but havn't english peaople on my discord now but maybe soon xD
    end
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

--[[_______________________________________Complete if you need this in cl_setting.lua ...Setting.{} / Config...{}_______________________________________

for Config.Setting.hudonlone == HideHudComponentThisFrame(id)  /
id :  1 = WANTED_STARS                      __________________/
id :  2 = WEAPON_ICON <-----------(used)    |List of vehicle : https://www.se7ensins.com/forums/threads/gta-v-vehicle-hashes-list.988584/
id :  3 = CASH <------------------(used)    |List of weapon  : https://forum.cfx.re/t/wiki-weapons-names-and-their-hash/11647
id :  4 = MP_CASH <---------------(used)    |List of props   : https://gist.github.com/leonardosnt/53faac01a38fc94505e9
id :  5 = MP_MESSAGE                        |List of peds    : https://docs.fivem.net/docs/game-references/ped-models/
id :  6 = VEHICLE_NAME <----------(used)    |
id :  7 = AREA_NAME <-------------(used)    |
id :  8 = VEHICLE_CLASS <---------(used)    | Complete if you want more, or need Google / FiveM xD
id :  9 = STREET_NAME <-----------(used)    |
id : 10 = HELP_TEXT                         |
id : 11 = FLOATING_HELP_TEXT_1              |
id : 12 = FLOATING_HELP_TEXT_2              |
id : 13 = CASH_CHANGE <-----------(used)    |
id : 14 = RETICLE <---------------(used)    |
id : 15 = SUBTITLE_TEXT                     |
id : 16 = RADIO_STATIONS                    |
id : 17 = SAVING_GAME                       |
id : 18 = GAME_STREAM                       |
id : 19 = WEAPON_WHEEL <----------(used)    |
id : 20 = WEAPON_WHEEL_STATS <----(used)    |
id : 21 = HUD_COMPONENTS <--------(used)    |
id : 22 = HUD_WEAPONS <-----------(used)    |
____________________________________________/
]]