local Translations = {
    afk = {
        will_kick = 'Você está AFK e será expulso em ',
        time_seconds = ' segundos!',
        time_minutes = ' minuto(s)!',
        kick_message = 'Você foi expulso por estar AFK'
    },
    wash = {
        in_progress = "O veículo está sendo lavado...",
        wash_vehicle = "[E] Lavar Veículo",
        wash_vehicle_target = "Lavar Veículo",
        dirty = "O veículo não está sujo",
        cancel = "Lavagem cancelada..."
    },
    consumables = {
        eat_progress = "Comendo...",
        drink_progress = "Bebendo...",
        liqour_progress = "Bebendo licor...",
        coke_progress = "Cheirando rápido...",
        crack_progress = "Fumando crack...",
        ecstasy_progress = "Engolindo pílulas...",
        healing_progress = "Curando",
        meth_progress = "Fumando Metanfetamina",
        joint_progress = "Acendendo um baseado...",
        use_parachute_progress = "Colocando o paraquedas...",
        pack_parachute_progress = "Dobrando o paraquedas...",
        no_parachute = "Você não tem um paraquedas!",
        armor_full = "Você já tem armadura suficiente!",
        armor_empty = "Você não está usando um colete...",
        armor_progress = "Colocando a armadura...",
        heavy_armor_progress = "Colocando armadura pesada...",
        remove_armor_progress = "Removendo a armadura...",
        canceled = "Cancelado..."
    },
    cruise = {
        unavailable = "Controle de cruzeiro indisponível",
        activated = "Cruise Control Ativado",
        deactivated = "Cruise Control Desativado"
    },
    editor = {
        started = "Gravação Iniciada!",
        save = "Gravação Salva!",
        delete = "Gravação Excluída!",
        editor = "Até logo, jacaré!"
    },
    firework = {
        place_progress = "Soltando fogos de artifício...",
        canceled = "Cancelado...",
        time_left = "Fogos de artifício acabaram ~r~"
    },
    seatbelt = {
        use_harness_progress = "Prendendo o Cinto de Corrida",
        remove_harness_progress = "Removendo o Cinto de Corrida",
        no_car = "Você não está em um carro."
    },
    teleport = {
        teleport_default = 'Usar Elevador'
    },
    pushcar = {
        stop_push = "[E] Parar de Empurrar"
    }
}

if GetConvar('qb_locale', 'en') == 'pt-br' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end
