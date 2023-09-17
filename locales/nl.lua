local Translations = {
  afk = {
        will_kick = 'Je bent aFK en je zal gekickt worden in ',
        time_seconds = ' seconden!',
        time_minutes = ' minuten!',
        kick_message = 'Je werd gekickt omdat je AFK was',
    },
    wash = {
        in_progress = "Je voertuig wordt schoongemaakt ..",
        wash_vehicle = "[E] Voertuig wassen",
        wash_vehicle_target = "Was Voertuig",
        dirty = "Het voertuig is niet vies",
        cancel = "Wassen geannuleerd ..",
    },
    consumables = {
        eat_progress = "Eten..",
        drink_progress = "Drinken..",
        liqour_progress = "Alcohol drinken..",
        coke_progress = "Aan het snuiven..",
        crack_progress = "Crack aan het smoken..",
        ecstasy_progress = "Pillen slikken",
        healing_progress = "Aan het genezen",
        meth_progress = "Meth aan het roken",
        joint_progress = "Joint aan het opsteken..",
        use_parachute_progress = "Parachute aan het omdoen..",
        pack_parachute_progress = "Parachute inpakken..",
        no_parachute = "Je hebt geen parachute!",
        armor_full = "Je hebt al genoeg bepansering aan!",
        armor_empty = "Je draagt geen vest..",
        armor_progress = "Kogelvrij vest aan het omdoen..",
        heavy_armor_progress = "Kogelvrij vest aan het omdoen..",
        remove_armor_progress = "Kogelvrij vest aan het afdoen..",
        canceled = "Geannuleerd..",
    },
    cruise = {
        unavailable = "Cruisecontrol niet beschikbaar",
        activated = "Cruise Geactiveerd: ",
        deactivated = "Cruise gedeactiveerd",
    },
    editor = {
        started = "Aan het opnemen!",
        save = "Opname opgeslagen!",
        delete = "Opname verwijder!",
        editor = "Later!"
    },
    firework = {
        place_progress = "Object aan het plaatsen..",
        canceled = "Geannuleerd..",
        time_left = "Vuurwerk over ~r~"
    },
    seatbelt = {
        use_harness_progress = "Raceharnas bevestigen",
        remove_harness_progress = "Raceharnas verwijderen",
        no_car = "Je zit niet in een voertuig."
    },
    teleport = {
        teleport_default = 'Gebruik lift'
    },
    pushcar = {
        stop_push = "[E] Stop met duwen"
    }

}

if GetConvar('qb_locale', 'en') == 'nl' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end
