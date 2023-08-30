-- Definições de tradução
local Translations = {
    afk = {
        will_kick = 'Você está AFK e será expulso em ',
        time_seconds = ' segundos!',
        time_minutes = ' minuto(s)!',
        kick_message = 'Você foi expulso por estar AFK',
    },
    wash = {
        in_progress = "O veículo está sendo lavado ..",
        wash_vehicle = "[E] Lavar Veículo",
        wash_vehicle_target = "Lavar Veículo",
        dirty = "O veículo não está sujo",
        cancel = "Lavagem cancelada ..",
    },
    consumables = {
        eat_progress = "Comendo..",
        drink_progress = "Bebendo..",
        liqour_progress = "Bebendo licor..",
        coke_progress = "Cheirada rápida..",
        crack_progress = "Fumando crack..",
        ecstasy_progress = "Tomando pílulas",
        healing_progress = "Curando",
        meth_progress = "Fumando metanfetamina",
        joint_progress = "Acendendo um baseado..",
        use_parachute_progress = "Colocando o paraquedas..",
        pack_parachute_progress = "Dobrando o paraquedas..",
        no_parachute = "Você não tem um paraquedas!",
        armor_full = "Você já tem armadura suficiente!",
        armor_empty = "Você não está usando um colete..",
        armor_progress = "Colocando o colete à prova de balas..",
        heavy_armor_progress = "Colocando o colete pesado..",
        remove_armor_progress = "Removendo o colete à prova de balas..",
        canceled = "Cancelado..",
    },
    cruise = {
        unavailable = "Controle de cruzeiro indisponível",
        activated = "Cruzeiro Ativado: ",
        deactivated = "Cruzeiro Desativado",
    },
    editor = {
        started = "Gravação Iniciada!",
        save = "Gravação Salva!",
        delete = "Gravação Excluída!",
        editor = "Até logo, crocodilo!"
    },
    firework = {
        place_progress = "Colocando objeto..",
        canceled = "Cancelado..",
        time_left = "Queima de fogos restante ~r~"
    },
    seatbelt = {
        use_harness_progress = "Colocando Cinto de Corrida",
        remove_harness_progress = "Removendo Cinto de Corrida",
        no_car = "Você não está em um carro."
    },
    teleport = {
        teleport_default = 'Usar Elevador'
    },
    pushcar = {
        stop_push = "[E] Parar de Empurrar"
    }
}

-- Cria um objeto Locale
Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
