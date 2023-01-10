local Translations = {
    error = {
        ["afk_time_left_minutes"] = "AFK (away from keyboard) vagy, ezért %{timeLeft} percen belül kirúgnak!",
        ["afk_time_left_minute"] = " AFK (away from keyboard) vagy, ezért %{timeLeft} percen belül kirúgnak!",
        ["afk_time_left_seconds"] = " AFK (away from keyboard) vagy, ezért %{timeLeft} másodpercen belül kirúgnak!",
        ["car_wash_canceled"] = "Mosás megszakítva..",
        ["car_wash_notdirty"] = "Az autó nem annyira koszos..",
        ["cruise_deactivated"] = "Sebességtartó kikapcsolva",
        ["cruise_unavailable"] = "Sebességtartó nem elérhető",
        ["not_in_car"] = "Nem vagy autóban",
        ["dont_have_enough_money"] = "Nincs elég pénzed..",
        ["global_canceled"] = "Megszakítva..",
    },
    info = {
        ["cruise_activated_mp"] = "Sebességtartó aktiválva: %{speed} MP/H",
        ["cruise_activated_km"] = "Sebességtartó aktiválva: %{speed} KM/H",
    },
    progress = {
        ["car_wash_progress"] = "A jármű mosás alatt áll..",
        ["placing_firework"] = "Tűzijáték elhelyezése..",
        ["attach_race_harness"] = "Versenyheveder felszerelése",
        ["remove_race_harness"] = "Versenyheveder eltávolítása",
    },
    text = {
        ["afk_kick_message"] = "Kirúgtak, amiért AFK vagy",
        ["car_wash_text"] = "~g~E~w~ - Autómosás ($%{price})",
        ["car_wash_not_available"] = "Autómosó nem áll rendelkezésre..",
        ["time_until_firework"] = "Tűzijáték ~r~%{time}",
        ["push_vehicle"] = "Nyomd meg a [~g~SHIFT~w~] és [~g~E~w~] gombot a jármű tolásához",
    },
    editor = {
        ["record"] = "Felvétel elindítva!",
        ["save"] = "Felvétel mentve!",
        ["delete_clip"] = "Felvétel törölve!",
        ["editor"] = "Later aligator🐊!",
    }
}

if GetConvar('qb_locale', 'en') == 'hu' then
    Lang = Lang or Locale:new({
        phrases = Translations,
        warnOnMissing = true
    })
end
