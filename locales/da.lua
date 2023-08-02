local Translations = {
    afk = {
        will_kick = 'Du er AFK og vil modtage et kick om ',
        time_seconds = ' sekunder!',
        time_minutes = ' minut(ter)!',
        kick_message = 'Du modtog et kick for at være AFK',
    },
    wash = {
        in_progress = "Køretøjet bliver vasket ..",
        wash_vehicle = "[E] Vask køretøj",
        wash_vehicle_target = "Vask Køretøj",
        dirty = "Køretøjet er ikke beskidt",
        cancel = "Vask blev afbrudt ..",
    },
    consumables = {
        eat_progress = "Spiser..",
        drink_progress = "Drikker..",
        liqour_progress = "Drikker alkohol..",
        coke_progress = "Hurtigt sniff..",
        crack_progress = "Ryger crack..",
        ecstasy_progress = "Popper piller",
        healing_progress = "Healing", -----
        meth_progress = "Ryger meth",
        joint_progress = "Tænder en joint..",
        use_parachute_progress = "Tager faldskærm på..",
        pack_parachute_progress = "Pakker faldskærm..",
        no_parachute = "Du har ikke en faldskærm!",
        armor_full = "Du har allerede nok armor på!",
        armor_empty = "Du har ikke en vest på..",
        armor_progress = "Tager armor på..",
        heavy_armor_progress = "Tager skudsikkervest på..",
        remove_armor_progress = "Tager skudsikkervest af..",
        canceled = "Afbrudt..",
    },
    cruise = {
        unavailable = "Fartpilot ikke tilgængelig",
        activated = "Fartpilot aktiveret: ",
        deactivated = "Fartpilot deaktiveret",
    },
    editor = {
        started = "Optagelse startet!",
        save = "Optagelse gemt!",
        delete = "Optagelse slettet!",
        editor = "Ses i baren!"
    },
    firework = {
        place_progress = "Placere objekt..",
        canceled = "Afbrudt..",
        time_left = "Fyrværkeri er slut ~r~"
    },
    seatbelt = {
        use_harness_progress = "Fastgøring af racersele",
        remove_harness_progress = "Fjernelse af racersele",
        no_car = "Du er ikke i et køretøj."
    },
    teleport = {
        teleport_default = 'Brug elevator'
    },
    pushcar = {
        stop_push = "[E] Afbryd skub"
    }


}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
