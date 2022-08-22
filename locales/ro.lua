local Translations = {
    progress = {
        veh_washed = "Vehiculul este spalat...",
        eating = "Mananci ceva...",
        driking = "Bei ceva...",
        drinking_liq = "Bei ceva alcoolizat...",
        sniff = "Tragi ceva pe nas...",
        snort_coke = "Fumezi niste crack...",
        pop_pills = "Bagi niste pastile...",
        use_oxy = "Te vindeci aparent...",
        snort_meth = "Fumezi metanfetamina...",
        smoke_joint = "Aprinzi un joint...",
        use_parachute = "Pui pe tine parasuta...",
        reset_parachute = "Dai jos parasuta...",
        use_armor = "Pui pe tine vesta antiglont...",
        remove_armor = "Dai jos vesta antiglont...",
        spawn_object = "Pui jos un obiect...",
        harness_equip = "Fixezi hamul de curse...",
        harness_off = "Iti scoti hamul de curse...",
    },
    notify = {
        canceled = "Proces anulat",
        failed = "Nu a functionat",
        afk_kickm = "Esti AFK si in %{value} minute o sa primesti KICK!",
        afk_kicks = "Esti AFK si in %{value} seconde o sa primesti KICK!",
        veh_wash_canceled = "Spalatul masinii oprit...",
        veh_no_dirt = "The vehicle isn't dirty",
        no_parachute = "Nu ai o parasuta!",
        armor_on = "Ai deja vesta antiglont pusa!",
        no_vest = "Nu porti o vesta antiglont..",
        cruise_mph = "Cruise activat la: %{value} MP/H",
        cruise_kmh = "Cruise activat la: %{value} KM/H",
        cruise_off = "Cruise control dezactivat",
        cruise_notavailable = "Vehiculul nu are cruise control",
        recording_on = "Ai pornit o inregistrare!",
        recording_saved = "Ai salvat o inregistrare!",
        recording_del = "Ai sters o inregistrare!",
        editor = "Hopa, ne vedem mai tarziu!",
        not_in_car = "Nu esti intr-un vehicul.",
        police_only = "Doar pentru ofiterii de Politie",
        your_id = "ID-ul tau este: %{value}",
        not_enough_money = "Nu ai suficienti bani...",
    },
    inf_mapping = {
        tog_cruise = "Activezi/Dezactivezi Cruise Control",
        hu = "Ridici mainile sus (cand esti somat)",
        point = "Arati cu degetul",
        seatbelt = "Pui/Scoti centura de siguranta",
        reset_armor = "Resetezi vesta antiglont (Doar pentru politie)",
        test_webh = "Testezi WebHook-ul pentru Discord pentru Logs (God Only)",
        check_id = "Verifici ce ID ai",
    },
    interaction = {
        veh_wash_int = "~g~E~w~ - Spala masina pentru ($ %{value})",
        user_afk_kicked = "Ai primit kick, deoarece erai AFK - Away From Keyboard'


    },
    label = {
        carwash_notavailable = "Spalatoria nu este disponibila ..",
        fireworks_time = "Artificii pentru ~r~ %{value}",
        veh_push = "Apasa [~g~SHIFT~w~] si [~g~E~w~] pentru a impinge vehiculul",
    },

}
Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
