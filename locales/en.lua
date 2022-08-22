local Translations = {
    progress = {
        veh_washed = "Vehicle is being washed ..",
        eating = "Eating..",
        driking = "Drinking..",
        drinking_liq = "Drinking liquor..",
        sniff = "Quick sniff..",
        snort_coke = "Smoking crack..",
        pop_pills = "Pops Pills",
        use_oxy = "Healing...",
        snort_meth = "Smoking Ass Meth...",
        smoke_joint = "Lighting joint..",
        use_parachute = "Putting on parachute..",
        reset_parachute = "Packing parachute..",
        use_armor = "Putting on the body armour..",
        remove_armor = "Removing the body armour..",
        spawn_object = "Placing object..",
        harness_equip = "Attaching Race Harness...",
        harness_off = "Removing Race Harness...",
    },
    notify = {
        canceled = "Cancelled..",
        failed = "Failed",
        afk_kickm = "You are AFK and will be kicked in %{value} minute(s)!",
        afk_kicks = "You are AFK and will be kicked in %{value} seconds!",
        veh_wash_canceled = "Washing canceled ..",
        veh_no_dirt = "The vehicle isn't dirty",
        no_parachute = "You dont have a parachute!",
        armor_on = "You already have enough armor on!",
        no_vest = "You\'re not wearing a vest..",
        cruise_mph = "Cruise Activated: %{value} MP/H",
        cruise_kmh = "Cruise Activated: %{value} KM/H",
        cruise_off = "Cruise Deactivated",
        cruise_notavailable = "Cruise control unavailable",
        recording_on = "Started Recording!",
        recording_saved = "Saved Recording!",
        recording_del = "Deleted Recording!",
        editor = "Later aligator!",
        not_in_car = "You\'re not in a car.",
        police_only = "For Police Officer Only",
        your_id = "Your ID is: %{value}",
        not_enough_money = "You dont have enough money..",
    },
    inf_mapping = {
        tog_cruise = "Toggle Cruise Control",
        hu = "Put your hands up",
        point = "Toggles Point",
        seatbelt = "Toggle Seatbelt",
        reset_armor = "Resets Vest (Police Only)",
        test_webh = "Test Your Discord Webhook For Logs (God Only)",
        check_id = "Check Your ID #",
    },
    interaction = {
        veh_wash_int = "~g~E~w~ - Washing car ($ %{value})",
        user_afk_kicked = "You Have Been Kicked For Being AFK'


    },
    label = {
        carwash_notavailable = "The car wash is not available ..",
        fireworks_time = "Firework over ~r~ %{value}",
        veh_push = "Press [~g~SHIFT~w~] and [~g~E~w~] to push the vehicle",
    },

}
Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
