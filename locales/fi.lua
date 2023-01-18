local Translations = {
    afk = {
        will_kick = 'Olet AFK sinut kickataan ajassa ',
        time_seconds = ' sekunttia!',
        time_minutes = ' minuuttia(s)!'
    },
    wash = {
        in_progress = "Ajoneuvo pesty ..",
        wash_vehicle = "[E] Pese ajoneuvo",
        wash_vehicle_target = "Pese ajoneuvo",
        dirty = "Tämä ajoneuvo ei ole likainen",
        cancel = "Pesu peruutettu ..",
    },
    consumables = {
        eat_progress = "Syödään..",
        drink_progress = "Juodaan..",
        liqour_progress = "Juodaan viinaa..",
        coke_progress = "Nopeet sniffit..",
        crack_progress = "Poltellaas paukut..",
        ecstasy_progress = "Popataas pillerit",
        healing_progress = "Hoidetaan",
        meth_progress = "Poltellaas metaa",
        joint_progress = "Sytytetääs jointti..",
        use_parachute_progress = "Laitetaan laskuvarjoa..",
        pack_parachute_progress = "Pakataan laskuvarjoa..",
        no_parachute = "Sinulla ei ole laskuvarjoa!",
        armor_full = "Sinulla on jo armorit!",
        armor_empty = "Sinulla ei ole armoreita..",
        armor_progress = "Laitetaas luotiliivit päälle..",
        heavy_armor_progress = "Laitetaas raskaat luotiliivit päälle..",
        remove_armor_progress = "Otetaan luotiliivei pois..",
        canceled = "Peruutettu..",
    },
    cruise = {
        unavailable = "Et saanu laitettua vakionopeudensäädintä",
        activated = "Vakionopeudensäädin päällä: ",
        deactivated = "Vakionopeudensäädin pois:",
    },
    editor = {
        started = "Aloitit kuvaamaan!",
        save = "Kuvaus tallennettu!",
        delete = "Poistit kuvauksen!",
        editor = "Myöhemmin alligaattori!"
    },
    firework = {
        place_progress = "Asetellaas paikoillee..",
        canceled = "Peruutettu..",
        time_left = "Aikaa jäljellä ~r~"
    },
    seatbelt = {
        use_harness_progress = "Kilpavaljaiden kiinnitys",
        remove_harness_progress = "Kilpavaljaiden irrottaminen",
        no_car = "Et ole autossa."
    },
    teleport = {
        teleport_default = 'Käytä hissiä'
    },
    pushcar = {
        stop_push = "[E] Lopeta työntäminen"
    }


}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
