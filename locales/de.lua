local Translations = {
    afk = {
        will_kick = 'Du bist AFK und wirst in ',
        time_seconds = ' Sekunden gekickt!',
        time_minutes = ' Minute(n) gekickt!',
        kick_message = 'Du wurdest gekickt, weil du AFK warst'
    },
    wash = {
        in_progress = "Fahrzeug wird gewaschen...",
        wash_vehicle = "[E] Fahrzeug waschen",
        wash_vehicle_target = "Fahrzeug waschen",
        dirty = "Das Fahrzeug ist nicht schmutzig",
        cancel = "Waschen abgebrochen..."
    },
    consumables = {
        eat_progress = "Essen...",
        drink_progress = "Trinken...",
        liqour_progress = "Alkohol trinken...",
        coke_progress = "Kurzer Zug...",
        crack_progress = "Crack rauchen...",
        ecstasy_progress = "Pillen einwerfen",
        healing_progress = "Heilen",
        meth_progress = "Crystal Meth rauchen",
        joint_progress = "Joint anzünden...",
        use_parachute_progress = "Fallschirm anlegen...",
        pack_parachute_progress = "Fallschirm packen...",
        no_parachute = "Du hast keinen Fallschirm!",
        armor_full = "Du hast bereits genug Rüstung an!",
        armor_empty = "Du trägst keine Weste...",
        armor_progress = "Schutzweste anlegen...",
        heavy_armor_progress = "Schwere Schutzweste anlegen...",
        remove_armor_progress = "Schutzweste abnehmen...",
        canceled = "Abgebrochen..."
    },
    cruise = {
        unavailable = "Tempomat nicht verfügbar",
        activated = "Tempomat aktiviert",
        deactivated = "Tempomat deaktiviert"
    },
    editor = {
        started = "Aufnahme gestartet!",
        save = "Aufnahme gespeichert!",
        delete = "Aufnahme gelöscht!",
        editor = "Bis später, Alligator!"
    },
    firework = {
        place_progress = "Feuerwerk platzieren...",
        canceled = "Abgebrochen...",
        time_left = "Feuerwerk startet in ~r~"
    },
    seatbelt = {
        use_harness_progress = "Renngurt anlegen",
        remove_harness_progress = "Renngurt entfernen",
        no_car = "Du bist nicht in einem Auto."
    },
    teleport = {
        teleport_default = 'Aufzug benutzen'
    },
    pushcar = {
        stop_push = "[E] Schieben beenden"
    }
}

if GetConvar('qb_locale', 'en') == 'de' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end

