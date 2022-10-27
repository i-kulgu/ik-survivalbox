local Translations = {
    error = {
        nomoney = 'You don\'t have enoug money!'
    },
    info = {
        opening = 'Opening'
    },
    target = {
        shop = 'Survival Shop',
    },
    menu = {
        header = 'Survival Shop',
        close = '❌ Close',
        ssb = '🎁 Small Survival Box',
        ssbd = 'Small box of basic items',
        msb = '🎁 Medium Survival Box',
        msbd = 'Medium box with commonly needed items',
        bsb = '📦 Big Survival Box',
        bsbd = 'Big box with some rare items'
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})