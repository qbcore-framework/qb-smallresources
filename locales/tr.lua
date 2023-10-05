local Translations = {
    afk = {
        will_kick = 'AFK durumundasınız ve ',
        time_seconds = ' saniye sonra atılacaksınız!',
        time_minutes = ' dakika sonra atılacaksınız!',
        kick_message = 'AFK olduğunuz için atıldınız'
    },
    wash = {
        in_progress = "Araç yıkanıyor...",
        wash_vehicle = "[E] Araçı Yıka",
        wash_vehicle_target = "Araçı Yıka",
        dirty = "Araç kirli değil",
        cancel = "Yıkama iptal edildi..."
    },
    consumables = {
        eat_progress = "Yeniyor...",
        drink_progress = "İçiliyor...",
        liqour_progress = "Alkol İçiliyor...",
        coke_progress = "Hızlı kokain çekiliyor...",
        crack_progress = "Crack içiliyor...",
        ecstasy_progress = "Hap içiliyor",
        healing_progress = "İyileştiriliyor",
        meth_progress = "Metamfetamin içiliyor",
        joint_progress = "Joint yakılıyor...",
        use_parachute_progress = "Paraşüt giyiliyor...",
        pack_parachute_progress = "Paraşüt paketleniyor...",
        no_parachute = "Paraşütünüz yok!",
        armor_full = "Zaten yeterince zırhınız var!",
        armor_empty = "Zırh giymiyorsunuz...",
        armor_progress = "Vücut zırhı giyiliyor...",
        heavy_armor_progress = "Zırh giyiliyor...",
        remove_armor_progress = "Vücut zırhı çıkarılıyor...",
        canceled = "İptal edildi..."
    },
    cruise = {
        unavailable = "Seyir kontrolü kullanılamıyor",
        activated = "Seyir kontrolü etkinleştirildi",
        deactivated = "Seyir kontrolü devre dışı bırakıldı"
    },
    editor = {
        started = "Kayıt Başladı!",
        save = "Kayıt Kaydedildi!",
        delete = "Kayıt Silindi!",
        editor = "Sonra görüşürüz!"
    },
    firework = {
        place_progress = "Füze yerleştiriliyor...",
        canceled = "İptal edildi...",
        time_left = "Füze fırlatma zamanı ~r~"
    },
    seatbelt = {
        use_harness_progress = "Yarış kemerini takıyor...",
        remove_harness_progress = "Yarış kemerini çıkarıyor...",
        no_car = "Bir araçta değilsiniz."
    },
    teleport = {
        teleport_default = 'Asansörü Kullan'
    },
    pushcar = {
        stop_push = "[E] İtmeyi Durdur"
    }
}


if GetConvar('qb_locale', 'en') == 'tr' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end
