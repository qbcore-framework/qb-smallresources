local Translations = {
    afk = {
        will_kick = 'Estás AFK y serás expulsado en ',
        time_seconds = ' segundos!',
        time_minutes = ' minuto(s)!',
        kick_message = 'Fuiste expulsado por estar AFK'
    },
    wash = {
        in_progress = "Vehículo en proceso de lavado...",
        wash_vehicle = "[E] Lavar vehículo",
        wash_vehicle_target = "Lavar vehículo",
        dirty = "El vehículo no está sucio",
        cancel = "Lavado cancelado..."
    },
    consumables = {
        eat_progress = "Comiendo...",
        drink_progress = "Bebiendo...",
        liqour_progress = "Bebiendo licor...",
        coke_progress = "Esnifando rápidamente...",
        crack_progress = "Fumando crack...",
        ecstasy_progress = "Tomando pastillas",
        healing_progress = "Curando",
        meth_progress = "Fumando metanfetamina...",
        joint_progress = "Encendiendo porro...",
        use_parachute_progress = "Poniéndose el paracaídas...",
        pack_parachute_progress = "Empacando el paracaídas...",
        no_parachute = "¡No tienes un paracaídas!",
        armor_full = "¡Ya tienes suficiente chaleco!",
        armor_empty = "No llevas un chaleco...",
        armor_progress = "Poniéndose la chaleco...",
        heavy_armor_progress = "Poniéndose la chaleco...",
        remove_armor_progress = "Quitándose la chaleco...",
        canceled = "Cancelado..."
    },
    cruise = {
        unavailable = "Control de crucero no disponible",
        activated = "Control de crucero activado",
        deactivated = "Control de crucero desactivado",
        not_Enough_Fuel = "No hay suficiente combustible"
    },
    editor = {
        started = "¡Grabación iniciada!",
        save = "¡Grabación guardada!",
        delete = "¡Grabación eliminada!",
        editor = "¡Chao pescao'!"
    },
    firework = {
        place_progress = "Colocando fuegos artificiales...",
        canceled = "Cancelado...",
        time_left = "Lanzamiento de fuegos artificiales en "
    },
    seatbelt = {
        use_harness_progress = "Colocando arnés de carrera",
        remove_harness_progress = "Quitando arnés de carrera",
        no_car = "No estás en un coche."
    },
    teleport = {
        teleport_default = 'Usar ascensor'
    },
    pushcar = {
        stop_push = "[E] Dejar de empujar",
        notDamaged = "¡El vehículo no está lo suficientemente dañado para empujar!"
    }
}

if GetConvar('qb_locale', 'en') == 'es' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end
