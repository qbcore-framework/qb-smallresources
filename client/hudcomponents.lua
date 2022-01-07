CreateThread(function()-- https://docs.fivem.net/natives/?_0x6806C51AD12B83B8
    while true do
		HideHudComponentThisFrame(1) -- 1 : WANTED_STARS
		HideHudComponentThisFrame(2) -- 2 : WEAPON_ICON
		HideHudComponentThisFrame(3) -- 3 : CASH
		HideHudComponentThisFrame(4) -- 4 : MP_CASH
		-- HideHudComponentThisFrame(5)			-- 5 : MP_MESSAGE
		-- HideHudComponentThisFrame(6)			-- 6 : VEHICLE_NAME
		HideHudComponentThisFrame(7) -- 7 : AREA_NAME
		-- HideHudComponentThisFrame(8)			-- 8 : VEHICLE_CLASS
		HideHudComponentThisFrame(9) -- 9 : STREET_NAME
		-- HideHudComponentThisFrame(10)		-- 10 : HELP_TEXT
		-- HideHudComponentThisFrame(11)		-- 11 : FLOATING_HELP_TEXT_1
		-- HideHudComponentThisFrame(12)		-- 12 : FLOATING_HELP_TEXT_2
		HideHudComponentThisFrame(13) -- 13 : CASH_CHANGE
		HideHudComponentThisFrame(14) -- 14 : RETICLE
		-- HideHudComponentThisFrame(15)		-- 15 : SUBTITLE_TEXT
		-- HideHudComponentThisFrame(16)		-- 16 : RADIO_STATIONS
		HideHudComponentThisFrame(17) -- 17 : SAVING_GAME
		-- HideHudComponentThisFrame(18)		-- 18 : GAME_STREAM
		HideHudComponentThisFrame(19) -- 19 : WEAPON_WHEEL
		HideHudComponentThisFrame(20) -- 20 : WEAPON_WHEEL_STATS
		HideHudComponentThisFrame(21) -- 21 : HUD_COMPONENTS
		HideHudComponentThisFrame(22) -- 22 : HUD_WEAPONS
		DisableControlAction(1, 37)
		DisplayAmmoThisFrame(true)

		Wait(4)
    end
end)


			-- ped controls
			-- DisableControlAction(0, 12, true) -- WeaponWheelUpDown
			-- DisableControlAction(0, 13, true) -- WeaponWheelLeftRight
			-- DisableControlAction(0, 14, true) -- WeaponWheelNext
			-- DisableControlAction(0, 15, true) -- WeaponWheelPrev
			-- DisableControlAction(0, 16, true) -- SelectNextWeapon
			-- DisableControlAction(0, 17, true) -- SelectPrevWeapon
			-- DisableControlAction(0, 21, true) -- disable sprint
			-- DisableControlAction(0, 22, true) -- disable jump
			-- DisableControlAction(0, 23, true) -- disable enter vehicle
			-- DisableControlAction(0, 24, true) -- disable attack
			-- DisableControlAction(0, 25, true) -- disable aim
			-- DisableControlAction(1, 24, true) -- disable attack
			-- DisableControlAction(1, 25, true) -- disable aim
			-- DisableControlAction(0, 36, true) -- disable sneak/duck
			-- DisableControlAction(0, 37, true) -- disable select weapon
			-- DisableControlAction(0, 38, true) -- disable pickup (E)
			-- DisableControlAction(0, 44, true) -- disable cover
			-- DisableControlAction(0, 45, true) -- disable reload
			-- DisableControlAction(0, 47, true) -- disable detonate
			-- DisableControlAction(0, 49, true) -- disable "arrest" (pull driver out)
			-- DisableControlAction(0, 50, true) -- disable accurate aim
			-- DisableControlAction(0, 51, true) -- disable context dpad right
			-- DisableControlAction(0, 52, true) -- disable context dpad left
			-- DisableControlAction(0, 55, true) -- disable dive
			-- DisableControlAction(0, 56, true) -- disable drop weapon
			-- DisableControlAction(0, 57, true) -- disable drop ammo
			-- DisableControlAction(0, 58, true) -- disable throw grenade

			-- vehicle controls
			-- DisableControlAction(0, 59, true) -- disable move vehicle left/right (A/D)
			-- DisableControlAction(0, 60, true) -- disable move vehicle up/down ([LEFT]SHIFT/[LEFT]CTRL)
			-- DisableControlAction(0, 65, true) -- disable vehicle special
			-- DisableControlAction(0, 68, true) -- disable vehicle aim
			-- DisableControlAction(0, 71, true) -- disable vehicle accelerate (A)
			-- DisableControlAction(0, 72, true) -- disable vehicle brake/reverse (S)
			-- DisableControlAction(0, 73, true) -- disable vehicle ducking
			-- DisableControlAction(0, 74, true) -- disable vehicle headlights
			-- DisableControlAction(0, 75, true) -- disable vehicle exiting
			-- DisableControlAction(0, 76, true) -- disable vehicle handbrake
			-- DisableControlAction(0, 77, true) -- disable vehicle hotwire left
			-- DisableControlAction(0, 78, true) -- disable vehicle hotwire right
			-- DisableControlAction(0, 80, true) -- disable vehicle cinematic camera
			-- DisableControlAction(0, 81, true) -- disable vehicle next radio station
			-- DisableControlAction(0, 82, true) -- disable vehicle prev radio station
			-- DisableControlAction(0, 83, true) -- disable vehicle next radio track
			-- DisableControlAction(0, 84, true) -- disable vehicle prev radio track
			-- DisableControlAction(0, 85, true) -- disable vehicle radio wheel
			-- DisableControlAction(0, 86, true) -- disable vehicle horn
			-- DisableControlAction(0, 87, true) -- disable vehicle fly throttle up
			-- DisableControlAction(0, 88, true) -- disable vehicle fly throttle down
			-- DisableControlAction(0, 89, true) -- disable vehicle fly yaw left
			-- DisableControlAction(0, 90, true) -- disable vehicle fly yaw right
			-- DisableControlAction(0, 91, true) -- disable vehicle passenger aim
			-- DisableControlAction(0, 92, true) -- disable vehicle passenger attack
			-- DisableControlAction(0, 99, true) -- disable vehicle next weapon
			-- DisableControlAction(0, 100, true) -- disable vehicle prev weapon
			-- DisableControlAction(1, 91, true) -- disable vehicle passenger aim
			-- DisableControlAction(1, 92, true) -- disable vehicle passenger attack
			-- DisableControlAction(1, 99, true) -- disable vehicle next weapon
			-- DisableControlAction(1, 100, true) -- disable vehicle prev weapon
			-- DisableControlAction(0, 101, true) -- disable vehicle roof (convertible?)
			-- DisableControlAction(0, 102, true) -- disable vehicle jump (Ruiner 2000?)
			-- DisableControlAction(0, 103, true) -- disable vehicle grappling hook (deploy, cargobob)
			-- DisableControlAction(0, 104, true) -- disable vehicle shuffle
			-- DisableControlAction(0, 105, true) -- disable vehicle drop projectile
			-- DisableControlAction(0, 106, true) -- VehicleMouseControlOverride
			-- DisableControlAction(0, 107, true) -- disable vehicle fly roll left/right
			-- DisableControlAction(0, 110, true) -- disable vehicle fly pitch up/down
			-- DisableControlAction(0, 114, true) -- disable vehicle fly attack
			-- DisableControlAction(0, 115, true) -- disable vehicle fly next weapon
			-- DisableControlAction(0, 116, true) -- disable vehicle fly prev weapon
			-- DisableControlAction(0, 117, true) -- disable vehicle fly target left
			-- DisableControlAction(0, 118, true) -- disable vehicle fly target right
			-- DisableControlAction(0, 119, true) -- disable vehicle fly VTOL mode
			-- DisableControlAction(0, 120, true) -- disable vehicle fly duck
			-- DisableControlAction(0, 123, true) -- disable vehicle sub turn left/right
			-- DisableControlAction(0, 126, true) -- disable vehicle sub pitch up/down
			-- DisableControlAction(0, 129, true) -- disable vehicle sub throttle up (W)
			-- DisableControlAction(0, 130, true) -- disable vehicle sub throttle down (S)
			-- DisableControlAction(0, 131, true) -- disable vehicle sub ascend (LeftShift)
			-- DisableControlAction(0, 132, true) -- disable vehicle sub descend (LeftCtrl)
			-- DisableControlAction(0, 136, true) -- disable bicycle pedal
			-- DisableControlAction(0, 137, true) -- disable bicycle sprint (CapsLock)

			-- ped combat controls
			-- DisableControlAction(0, 140, true) -- disable melee light
			-- DisableControlAction(0, 141, true) -- disable melee heavy
			-- DisableControlAction(0, 142, true) -- disable melee alternate
			-- DisableControlAction(0, 143, true) -- disable melee block
			-- DisableControlAction(0, 257, true) -- disable attack2
			-- DisableControlAction(0, 263, true) -- disable melee attack1
			-- DisableControlAction(0, 264, true) -- disable melee attack2
			-- DisableControlAction(0, 282, true) -- disable vehicle gun left
			-- DisableControlAction(0, 283, true) -- disable vehicle gun right
			-- DisableControlAction(0, 284, true) -- disable vehicle gun up
			-- DisableControlAction(0, 285, true) -- disable vehicle gun down

			-- vehicle hydraulics
			-- DisableControlAction(0, 337, true) -- disable vehicle hydraulics control toggle
			-- DisableControlAction(0, 338, true) -- disable vehicle hydraulics control left
			-- DisableControlAction(0, 339, true) -- disable vehicle hydraulics control right
			-- DisableControlAction(0, 340, true) -- disable vehicle hydraulics control up
			-- DisableControlAction(0, 341, true) -- disable vehicle hydraulics control down
			-- DisableControlAction(0, 342, true) -- disable vehicle hydraulics control up/down
			-- DisableControlAction(0, 343, true) -- disable vehicle hydraulics control left/right
