Config = {
    Ped = {
        model = `a_m_m_genfat_02`,
        location = vector4(198.85, -950.92, 29.09, 68.52),
    },

    -- random = is it a random item, set false to give 1 of that item as default
    -- min = if it is a random item, set this as a minimum amount
    -- max = if it is a random item, set this as a maximum amount
    -- luck = if you want to give the item with a luck percentage then fill in the percentage here between 1 and 100
    Boxes = {
        ["small_survivalbox"] = {
            name = 'menu.ssb',
            desc = 'menu.ssbd',
            price = 200,
            prop = `prop_cs_box_clothes`,
            items = {
                ['phone'] = {random = false},
                ['sandwich'] = {random = true, min = 1, max = 5, luck = 0},
                ['water'] = {random = true, min = 1, max = 5, luck = 0},
            }
       },
        ["medium_survivalbox"] = {
            name = 'menu.msb',
            desc = 'menu.msbd',
            price = 500,
            prop = `prop_cs_cardbox_01`,
            items = {
                ['phone'] = {random = false},
                ['radio'] = {random = false},
                ['sandwich'] = {random = true, min = 3, max = 7, luck = 0},
                ['water'] = {random = true, min = 3, max = 7, luck = 0},
                ['lockpick'] = {random = true, min = 1, max = 3, luck = 20},
                ['bandage'] = {random = true, min = 1, max = 3, luck = 50},
            }
        },
        ["big_survivalbox"] = {
            name = 'menu.bsb',
            desc = 'menu.bsbd',
            price = 1500,
            prop = `prop_cs_rub_box_01`,
            items = {
                ['phone'] = {random = false},
                ['radio'] = {random = false},
                ['sandwich'] = {random = true, min = 3, max = 7, luck = 0},
                ['water'] = {random = true, min = 3, max = 7, luck = 0},
                ['lockpick'] = {random = true, min = 1, max = 3, luck = 20},
                ['bandage'] = {random = true, min = 1, max = 3, luck = 50},
                ['armor'] = {random = false, min = 1, max = 1, luck = 10},
                ['gatecrack'] = {random = false, min = 1, max = 1, luck = 5},
            }
        },
    },
}
