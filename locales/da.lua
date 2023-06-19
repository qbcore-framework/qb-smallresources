local Translations = {
    afk = {
        will_kick = 'Du er AFK og vil blive smidt ud om',
        time_seconds = ' sekunder!',
        time_minutes = ' minutter!'
    },
    wash = {
        in_progress = "Køretøjet bliver vasket ..",
        wash_vehicle = "[E] Vask Køretøj",
        wash_vehicle_target = "Vask Køretøj",
        dirty = "Køretøjet er ikke beskidt",
        cancel = "Vask annulleret ..",
    },
    consumables = {
        eat_progress = "Spiser..",
        drink_progress = "Drikker..",
        liqour_progress = "Drikker spiritus..",
        coke_progress = "Hurtig Snus..",
        crack_progress = "Ryger crack..",
        ecstasy_progress = "Tager piller",
        healing_progress = "Helbredelse",
        meth_progress = "Ryger Meth",
        joint_progress = "Tænder joint..",
        use_parachute_progress = "Tager faldskærm på..",
        pack_parachute_progress = "Pakker faldskærm..",
        no_parachute = "Du har ikke nogen faldskærm!",
        armor_full = "Du har allerede en vest på!",
        armor_empty = "Du har ikke en vest på..",
        armor_progress = "Tager vest på..",
        heavy_armor_progress = "Tager vest på..",
        remove_armor_progress = "Tager vest af..",
        canceled = "Annulleret..",
    },
    cruise = {
        unavailable = "Fartpilot ikke tilgængelig",
        activated = "Fartpilot Aktiveret: ",
        deactivated = "Fartpilot Deaktiveret",
    },
    editor = {
        started = "Startet optagelse!",
        save = "Gemt optagelse!",
        delete = "Slettet optagelse!",
        editor = "Senere alligator!"
    },
    firework = {
        place_progress = "Placerer objekt..",
        canceled = "Annulleret..",
        time_left = "Fyrværkeri forbi ~r~"
    },
    seatbelt = {
        use_harness_progress = "Tager racersele på",
        remove_harness_progress = "Tager racersele af",
        no_car = "Du er ikke i et køretøj."
    },
    teleport = {
        teleport_default = 'Brug Elevator'
    },
    pushcar = {
        stop_push = "[E] Stop med at skubbe"
    }


}
if GetConvar('qb_locale', 'en') == 'da' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end
