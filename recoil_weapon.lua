--[[       
####	Title:          	Weaponry - Realistic Gunplay
####	Description:     	FiveM Script that adds Recoil to weapons, ability to toggle the reticle 
####						and removes ammo from the hud
####
####	URL:				https://forum.fivem.net/t/weaponry-realistic-gunplay-recoil-no-ammo-hud-no-reticle/				
####	Author:		 		Lyrad
####	Release date:       15th of July, 2018.
####	Update date:		28th of June, 2019.
####	Contributors:		AdrineX and Spudgun
####	Adapted for my MyServer_setting by SUP2Ak +add mod for setting damage of weapons (15/05/2021) good works for contributors of this script :)
####	Version:        	v1.3  
]]--

local global_wait 		= 300 -- Don't change this
local camera_shake 		= Config.CamShake
local recoils 			= Config.setRecoils
Citizen.CreateThread(function()
	local wait = global_wait
	while true do
		Citizen.Wait(wait)
		if Config.Setting.recoilWeapon == true then
			local ped = PlayerPedId()
			if GetFollowVehicleCamViewMode() == 4 and IsPedInAnyVehicle(ped) then
		    	SetPlayerCanDoDriveBy(PlayerId(), false)
			else
				SetPlayerCanDoDriveBy(PlayerId(), true)
			end
		end
		wait = global_wait
	end
end)
Citizen.CreateThread(function()
	local wait = global_wait
	math.random(GetGameTimer())
	while true do
		Citizen.Wait(wait)
		local ped = PlayerPedId()
		if Config.Setting.recoilWeapon == true then
			if IsPedArmed(PlayerPedId(), 6) then
				wait = 0
				if IsPedShooting(ped) then
					--print(GetCurrentPedWeapon(ped))
							--print(GetCurrentPedWeapon(ped))
					local _, wep = GetCurrentPedWeapon(ped)
					_, cAmmo = GetAmmoInClip(ped, wep)
					if recoils[wep] and recoils[wep] ~= 0 then
						tv = 0
						repeat 
							Wait(0)
							x = GetGameplayCamRelativePitch()
							y = GetGameplayCamRelativeHeading()
							local cx
							local cy
							if GetFollowVehicleCamViewMode() == 4 then
								if IsPedDoingDriveby(ped) then
									cx = math.random(250, 350)/100
									cy = math.random(-100, 100)/100
								else
									cx = math.random(0, 100)/100
									cy = math.random(-100, 100)/100
								end
							else
								if IsPedDoingDriveby(ped) then
									cx = math.random(250, 350)/100
									cy = math.random(-100, 100)/100
								else
									cx = math.random(0, 100)/100
									cy = math.random(-100, 100)/100
								end
							end
							SetGameplayCamRelativePitch(x+cx, 1.0)
							SetGameplayCamRelativeHeading(y+cy)
							ShakeGameplayCam('VIBRATE_SHAKE', camera_shake)
							tv = tv+0.1
						until tv >= recoils[wep]
					end
				end
			else
			wait = global_wait
			end
		end
	end
end)