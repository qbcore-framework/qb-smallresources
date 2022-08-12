-- 1 : WANTED_STARS | 4 : MP_CASH | 13 : CASH_CHANGE | 21 : HUD_COMPONENTS
-- 2 : WEAPON_ICON | 7 : AREA_NAME | 14 : RETICLE | 22 : HUD_WEAPONS
-- 3 : CASH | 9 : STREET_NAME | 17 : SAVING_GAME

local DISABLED_COMPONENTS <const> = {1, 2, 3, 4, 7, 9, 13, 14, 17, 21, 22}
CreateThread(function()
    while true do
      for i = 1, #DISABLED_COMPONENTS do
        HideHudComponentThisFrame(DISABLED_COMPONENTS[i])
      end

      -- Disable weapon wheel input
      HudWeaponWheelIgnoreSelection()
      DisableControlAction(1, 37)
      DisplayAmmoThisFrame(true)

      Wait(0)
    end
end)
