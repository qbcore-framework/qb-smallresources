local Translations = {
    afk = {
        afk_kick_message = 'Por estar AFK, você foi expulso do servidor.',
        will_kick = 'Você está AFK e será chutado ',
        time_seconds = ' segundos!',
        time_minutes = ' minuto(s)!'
    },
    wash = {
        in_progress = "O veículo está a ser lavado...",
        wash_vehicle = "[E] Lavar Veículo",
        wash_vehicle_target = "Lavar Veículo",
        dont_have_enough_money = "Você não tem dinheiro suficiente para lavar seu veículo.",
        dirty = "O veículo não está sujo",
        cancel = "Lavagem cancelada...",
    },
    consumables = {
        eat_progress = "Comendo..",
        drink_progress = "Bebendo..",
        liqour_progress = "Beber licor..",
        coke_progress = "Cheirar rápido..",
        crack_progress = "Fumar crack..",
        ecstasy_progress = "Pills Pops",
        healing_progress = "Curando",
        meth_progress = "Fumar metanfetamina",
        joint_progress = "Junta de iluminação..",
        use_parachute_progress = "Colocando paraquedas..",
        pack_parachute_progress = "Pára-quedas de embalagem..",
        no_parachute = "voce nao tem paraquedas!",
        armor_full = "Você já tem armadura suficiente!",
        armor_empty = "Você não está vestindo um colete..",
        armor_progress = "Colocando a armadura corporal..",
        heavy_armor_progress = "Colocando a armadura pesada..",
        remove_armor_progress = "Removendo a armadura corporal..",
        canceled = "Cancelado..",
    },
    cruise = {
        unavailable = "Controle de cruzeiro indisponível",
        activated = "Cruzeiro ativado: ",
        deactivated = "Cruzeiro desativado",
    },
    editor = {
        started = "Gravação Iniciada!",
        save = "Gravação salva!",
        delete = "Gravação deletada!",
        editor = "Mais tarde jacaré!"
    },
    firework = {
        place_progress = "Colocar objeto..",
        canceled = "Cancelado..",
        time_left = "Fogo de artifício acabou ~r~"
    },
    seatbelt = {
        use_harness_progress = "Prendendo o Arnês de Corrida",
        remove_harness_progress = "Removendo o arnês de corrida",
        no_car = "Você não está em um carro."
    },
    teleport = {
        teleport_default = 'Usar elevador'
    },
    pushcar = {
        stop_push = "[E] Pare de Empurrar"
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
