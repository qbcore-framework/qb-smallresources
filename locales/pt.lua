local Translations = {
    afk = {
        will_kick = 'Estás AFK e vais ser kickado em ',
        time_seconds = ' segundo(s)!',
        time_minutes = ' minuto(s)!'
    },
    wash = {
        in_progress = "A lavar o veículo ..",
        wash_vehicle = "[E] Lavar Veículo",
        wash_vehicle_target = "Lavar Vehicle",
        dirty = "O veículo não está sujo",
        cancel = "Lavagem Cancelada ..",
    },
    consumables = {
        eat_progress = "A comer..",
        drink_progress = "A beber..",
        liqour_progress = "A beber alcool..",
        coke_progress = "Cheirar uma linha..",
        crack_progress = "A fumar crack..",
        ecstasy_progress = "A ingerir pastilhas",
        healing_progress = "A curar...",
        meth_progress = "Smoking Ass Meth",
        joint_progress = "A fumar metanfetamina...",
        use_parachute_progress = "A colocar pára-quedas..",
        pack_parachute_progress = "A preparar pára-quedas...",
        no_parachute = "Não possui pára-quedas!",
        armor_full = "Já tem armadura suficiente no seu colete",
        armor_empty = "Não está a usar o colete...",
        armor_progress = "A colocar armadura",
        heavy_armor_progress = "A colocar armadura pesada..",
        remove_armor_progress = "A removere armadura..",
        canceled = "Cancelado..",
    },
    cruise = {
        unavailable = "Cruise control não disponivel",
        activated = "Cruise control activado: ",
        deactivated = "Cruise control desactivado",
    },
    editor = {
        started = "A gravar!",
        save = "Gravação guardada",
        delete = "Gravação apagada!",
        editor = "Até logo!"
    },
    firework = {
        place_progress = "A colocar objecto..",
        canceled = "Cancelado..",
        time_left = "Fogo de artificio terminado ~r~"
    },
    seatbelt = {
        use_harness_progress = "A colocar o arnês de corrida",
        remove_harness_progress = "A remover o arnês de corrida",
        no_car = "Não se encontra num veículo"
    },
    teleport = {
        teleport_default = 'Usar Elevador'
    },
    pushcar = {
        stop_push = "[E] Para de Empurrar"
    }
}

if GetConvar('qb_locale', 'en') == 'pt' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end
