local Translations = {
    error = {
        nomoney = 'Je hebt niet genoeg geld!'
    },
    info = {
        opening = 'Openen'
    },
    target = {
        shop = 'Survival Winkel',
    },
    menu = {
        header = 'Survival Winkel',
        close = '❌ Sluiten',
        ssb = '🎁 Kleine Survival Doos',
        ssbd = 'Kleine doos met basis items',
        msb = '🎁 Medium Survival Doos',
        msbd = 'Medium doos met algemeen benodigde items',
        bsb = '📦 Groot Survival Doos',
        bsbd = 'Grote doos met bijzondere items'
    }
}

if GetConvar('qb_locale', 'en') == 'nl' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end