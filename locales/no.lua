local Translations = {
    afk = {
        will_kick = 'Du er AFK og vil bli sparket om ',
        time_seconds = ' sekund(er)!',
        time_minutes = ' minutt(er)!',
        kick_message = 'Du ble sparket for å være AFK'
    },
    wash = {
        in_progress = "Kjøretøy blir vasket...",
        wash_vehicle = "[E] Vask kjøretøy",
        wash_vehicle_target = "Vask kjøretøy",
        dirty = "Kjøretøyet er ikke skittent",
        cancel = "Vasking avbrutt..."
    },
    consumables = {
        eat_progress = "Spiser...",
        drink_progress = "Drikker...",
        liqour_progress = "Drikker alkohol...",
        coke_progress = "Tar en rask stripe...",
        crack_progress = "Røyker crack kokain...",
        ecstasy_progress = "Popper pilleboks og svelger pille",
        healing_progress = "Sår gror",
        meth_progress = "Røyker meth",
        joint_progress = "Tenner joint...",
        use_parachute_progress = "Tar på fallskjerm...",
        pack_parachute_progress = "Pakker ned fallskjerm...",
        no_parachute = "Du har ikke en fallskjerm!",
        armor_full = "Du har maks armor buff kapasitet!",
        armor_empty = "Du har ingen vest på...",
        armor_progress = "Tar på kroppsbeskyttelse (Stikkvest)...",
        heavy_armor_progress = "Tar på kroppsbeskyttelse (Kevlarvest)...",
        remove_armor_progress = "Fjerner kroppsbeskyttelse...",
        canceled = "Handling avbrutt..."
    },
    cruise = {
        unavailable = "Kruisekontroll: Utilgjengelig",
        activated = "Kruisekontroll: Aktivert",
        deactivated = "Kruisekontroll: Deaktivert"
    },
    editor = {
        started = "Startet opptak!",
        save = "Lagret opptak!",
        delete = "Slettet opptak!",
        editor = "Avslutt Rockstar Editor!"
    },
    firework = {
        place_progress = "Plasserer fyrverkeriet...",
        canceled = "Handling avbrutt...",
        time_left = "Fyrverkeri eksploderer om: ~r~"
    },
    seatbelt = {
        use_harness_progress = "Fester 4-punkt sele",
        remove_harness_progress = "Fjerner 4-punkt sele",
        no_car = "Du er ikke i et kjøretøy."
    },
    teleport = {
        teleport_default = 'Bruk heis'
    },
    pushcar = {
        stop_push = "[E] Stopp dytting"
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})