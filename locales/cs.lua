local Translations = {
    afk = {
        will_kick = 'Si AFK budeš vyhozen za ',
        time_seconds = ' sekund!',
        time_minutes = ' minut(y)!',
        kick_message = 'Byl si vyhozen za AFK'
    },
    wash = {
        in_progress = "Vozidlo se umývé...",
        wash_vehicle = "[E] Umýt vozidlo",
        wash_vehicle_target = "Umýt vozidlo",
        dirty = "Toto vozdilo není špinavé",
        cancel = "Umývání zrušeno..."
    },
    consumables = {
        eat_progress = "Jíš...",
        drink_progress = "Piješ...",
        liqour_progress = "Piješ alkohol...",
        coke_progress = "Rychlé čichání...",
        crack_progress = "Kouříš crack...",
        ecstasy_progress = "Pops Pills",
        healing_progress = "Léčení",
        meth_progress = "Kouríš Meth",
        joint_progress = "Zapalová ní jointu...",
        use_parachute_progress = "Nasazování padáku...",
        pack_parachute_progress = "Sundávání padáku...",
        no_parachute = "Nemáš padák!",
        armor_full = "Už máš na sobě vestu!",
        armor_empty = "Nemáš na sobě vestu...",
        armor_progress = "Nasazování vesty...",
        heavy_armor_progress = "Nasazování vesty...",
        remove_armor_progress = "Sundávní vesty...",
        canceled = "Zrušeno..."
    },
    cruise = {
        unavailable = "Tempomat není k dispozici",
        activated = "Tempomat aktivován",
        deactivated = "Tempomat deaktivován"
    },
    editor = {
        started = "Zahájeno nahrávání!",
        save = "Záznam uložený!",
        delete = "Záznam smazán!",
        editor = "Později!"
    },
    firework = {
        place_progress = "Umístění ohňostroje...",
        canceled = "Zrušeno...",
        time_left = "Odpálení ohňostroje za ~r~"
    },
    seatbelt = {
        use_harness_progress = "Připevnění závodního postroje",
        remove_harness_progress = "Sundávání závodního postroje",
        no_car = "Nejste v autě"
    },
    teleport = {
        teleport_default = 'Použít výtah'
    },
    pushcar = {
        stop_push = "[E] Přestat tlačit"
    }
}

if GetConvar('qb_locale', 'en') == 'cs' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end