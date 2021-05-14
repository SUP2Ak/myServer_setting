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
    hideHudWeapon           = false,    --true:     active {Config.HudWeapon} pour cacher les hud Weapon GTAonline et roue d'arme selon vos parametre
    recoilWeapon            = false,    --true:     activera le recul des armes --Work In Progress__ pour ajouter la cette gestion ici de facon opti
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
    hudAmmo             = false,     --hide amooHud everytime (If you turnOn this, turnOff realisticAmmo)
    --Ne pas activé realisticAmmo pour le moment
    --[WIP] realisticAmmo       = false, --[WIP]    --KEEP THAT ON FALSE hide ammoHud only when you use weapon (If you turnOn this, turn off Ammo)
}
--Set CamShake for recoil Weapons {need Config.Setting.recoilWeapon = true}
Config.CamShake	= 0.1  --Set this between 0.0-1.0
--SetRecoil of Weapons {need Config.Setting.recoilWeapon = true}
Config.setRecoils = {
	-- Pistols
	[453432689] 		= 0.3, 		-- PISTOL
	[-1075685676] 		= 0.4, 		-- PISTOL MK2
	[1593441988] 		= 0.3, 		-- COMBAT PISTOL
	[-1716589765] 		= 0.6, 		-- PISTOL .50
	[-1076751822] 		= 0.2, 		-- SNS PISTOL
	[2009644972] 		= 0.25, 	-- SNS PISTOL MK2
	[-771403250] 		= 0.5, 		-- HEAVY PISTOL
	[137902532] 		= 0.4, 		-- VINTAGE PISTOL
	[-598887786] 		= 0.9, 		-- MARKSMAN PISTOL
	[-1045183535] 		= 0.6, 		-- HEAVY REVOLVER
	[-879347409] 		= 0.65, 	-- HEAVY REVOLVER MK2
	[584646201] 		= 0.2, 		-- AP PISTOL
	[911657153]			= 0.05, 	-- STUN GUN
	[1198879012] 		= 0.9, 		-- FLARE GUN
	-- Small Machine Guns (SMG)
	[324215364] 		= 0.2, 		-- MICRO SMG
	[-619010992] 		= 0.3, 		-- MACHINE PISTOL
	[-1121678507]		= 0.2,		-- MINI SMG
	[736523883] 		= 0.2, 		-- SMG
	[2024373456] 		= 0.2,		-- SMG MK2
	[-270015777] 		= 0.2,		-- ASSAULT SMG
	[171789620] 		= 0.2, 		-- COMBAT PDW
	[-1660422300] 		= 0.25, 	-- MG
	[2144741730] 		= 0.25, 	-- COMBAT MG
	[-608341376] 		= 0.25, 	-- COMBAT MG MK2
	[1627465347] 		= 0.2, 		-- GUSENBERG
	-- Assault Rifles (AR)
	[-1074790547] 		= 0.01, 		-- ASSAULT RIFLE
	[961495388]			= 0.2,		 -- ASSAULT RIFLE MK2
	[-2084633992] 		= 0.2, 		-- CARBINE RIFLE 		
	[-86904375] 		= 0.2, 		-- CARBINE RIFLE MK2
	[-1357824103]		= 0.2, 		-- ADVANCED RIFLE
	[-1063057011] 		= 0.2, 		-- SPECIAL CARBINE
	[-1768145561]		= 0.25, 	-- SPECIAL CARBINE MK2
	[2132975508] 		= 0.2, 		-- BULLPUP RIFLE
	[-2066285827]		= 0.25,		 -- BULLPUP RIFLE MK2
	[1649403952] 		= 0.3, 		-- COMPACT RIFLE
	--- Snipers
	[100416529] 		= 0.5, 		-- SNIPER RIFLE
	[205991906] 		= 0.7, 		-- HEAVY SNIPER
	[177293209] 		= 0.7,		-- HEAVY SNIPER MK2
	[3342088282]		= 0.3, 		-- MARKSMAN RIFLE
	[-952879014] 		= 0.35, 	-- MARKSMAN RIFLE MK2
	--- Shotguns
	[487013001] 		= 0.4, 		-- PUMP SHOTGUN
	[1432025498] 		= 0.4, 		-- PUMP SHOTGUN MK2
	[2017895192] 		= 0.7, 		-- SAWNOFF SHOTGUN
	[-1654528753] 		= 0.2, 		-- BULLPUP SHOTGUN
	[-494615257] 		= 0.4, 		-- ASSAULT SHOTGUN
	[-1466123874] 		= 0.7, 		-- MUSKET
	[984333226] 		= 0.4, 		-- HEAVY SHOTGUN
	[4019527611] 		= 2.1, 		-- DOUBLE BARREL SHOTGUN
	[317205821]			= 0.7,		-- SWEEPER SHOTGUN
	--- BIG BANG! MUCH WOW!
	[-1568386805]		= 0.5,		-- GRENADE LAUNCHER
	[1305664598] 		= 1.0, 		-- GRENADE LAUNCHER SMOKE (Unsure if this is the right hash?)
	[-1312131151] 		= 0.2, 		-- RPG
	[1119849093] 		= 0.00001, 	-- MINIGUN
	[2138347493] 		= 0.2, 		-- FIREWORK LAUNCHER
	[1834241177] 		= 1.2, 		-- RAILGUN
	[1672152130] 		= 0.2, 		-- HOMING LAUNCHER
	[125959754] 		= 0.5, 		-- COMPACT GRENADE LAUNCHER	
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