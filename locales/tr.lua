local Translations = {
    error = {
        nomoney = 'Yeterli paran yok!'
    },
    info = {
        opening = 'Açılıyor'
    },
    target = {
        shop = 'Survival Dükkanı',
    },
    menu = {
        header = 'Survival Dükkanı',
        close = '❌ Kapat',
        ssb = '🎁 Küçük Survival Kutusu',
        ssbd = 'Küçük bir temel eşya kutusu',
        msb = '🎁 Orta Boy Survival Kutusu',
        msbd = 'Sık ihtiyaç duyulan öğelerin bulunduğu kutu',
        bsb = '📦 Büyük Survival Kutusu',
        bsbd = 'Nadir eşyaların olduğu büyük kutu'
    }
}

if GetConvar('qb_locale', 'en') == 'tr' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end