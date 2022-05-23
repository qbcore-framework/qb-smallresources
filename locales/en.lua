local Translations = {
    error = {
        ["afk_time_left_minutes"] = "You are AFK and will be kicked in %{timeLeft} minutes!",
        ["afk_time_left_minute"] = "You are AFK and will be kicked in %{timeLeft} minute!",
        ["afk_time_left_seconds"] = "You are AFK and will be kicked in %{timeLeft} seconds!",
        ["car_wash_canceled"] = "Washing canceled..",
        ["car_wash_notdirty"] = "The vehicle isn't dirty",
        ["cruise_deactivated"] = "Cruise Deactivated",
        ["cruise_unavailable"] = "Cruise control unavailable",
        ["not_in_car"] = "You\'re not in a car.",
        ["dont_have_enough_money"] = "You dont have enough money..",
        ["global_canceled"] = "Canceled..",
    },
    info = {
        ["cruise_activated_mp"] = "Cruise Activated: %{speed} MP/H",
        ["cruise_activated_km"] = "Cruise Activated: %{speed} KM/H",
    },
    progress = {
        ["car_wash_progress"] = "Vehicle is being washed..",
        ["placing_firework"] = "Placing firework..",
        ["attach_race_harness"] = "Attaching Race Harness",
        ["remove_race_harness"] = "Removing Race Harness",
    },
    text = {
        ["afk_kick_message"] = "You Have Been Kicked For Being AFK",
        ["car_wash_text"] = "~g~E~w~ - Washing car ($%{price})",
        ["car_wash_not_available"] = "The car wash is not available..",
        ["time_until_firework"] = "Firework over ~r~%{time}",
        ["push_vehicle"] = "Press [~g~SHIFT~w~] and [~g~E~w~] to push the vehicle",
    },
    editor = {
        ["record"] = "Started Recording!",
        ["save"] = "Saved Recording!",
        ["delete_clip"] = "Deleted Recording!",
        ["editor"] = "Later aligator!",
    }
}
Lang = Locale:new({phrases = Translations, warnOnMissing = true})