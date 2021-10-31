Citizen.CreateThread(function()-- https://docs.fivem.net/natives/?_0x6806C51AD12B83B8
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

		Citizen.Wait(4)
    end
end)
