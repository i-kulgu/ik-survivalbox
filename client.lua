local QBCore = exports['qb-core']:GetCoreObject()
local SurvivalPed = nil

--##### Threads #####--

CreateThread(function()
    -- create ped
    RequestModel(Config.Ped.model)
    while not HasModelLoaded(Config.Ped.model) do Wait(1) end
    SurvivalPed = CreatePed(2, Config.Ped.model, Config.Ped.location, false, false)
    SetPedFleeAttributes(SurvivalPed, 0, 0)
    SetEntityInvincible(SurvivalPed, true)
    TaskStartScenarioInPlace(SurvivalPed, "WORLD_HUMAN_TOURIST_MAP", 0, true)
    SetBlockingOfNonTemporaryEvents(SurvivalPed, true)
    FreezeEntityPosition(SurvivalPed, true)
    local label = Lang:t("target.shop")
    exports['qb-target']:AddTargetEntity(SurvivalPed, {
        options = {{ num = 1, event = "ik-survivalbox:client:OpenMenu", icon = 'fas fa-box-full', label = label,}},
        distance = 2.5,
    })
end)

--##### Menu #####--

RegisterNetEvent("ik-survivalbox:client:OpenMenu", function()
    local ShopMenu = {}
    ShopMenu[#ShopMenu+1] = {header = Lang:t('menu.header'), isMenuHeader = true}
    ShopMenu[#ShopMenu+1] = {header = "", txt = Lang:t('menu.close'), params = {event = "ik-survivalbox:client:closeMenu"}}

    for k,v in pairs(Config.Boxes) do
        ShopMenu[#ShopMenu+1] = {header = Lang:t(v.name), txt = Lang:t(v.desc), params = {event = "ik-survivalbox:client:buyItem", args =  { box = k, price = v.price}}}
    end
    exports["qb-menu"]:openMenu(ShopMenu)
end)

--##### Events #####--

RegisterNetEvent("ik-survivalbox:client:buyItem", function(data)
    TriggerServerEvent("ik-survivalbox:server:buyBox",data.box, data.price)
end)

RegisterNetEvent("ik-survivalbox:client:openBox", function(itemname)
    local playerPed = PlayerPedId()
    local coords    = GetEntityCoords(playerPed)
    local forward   = GetEntityForwardVector(playerPed)
    local x, y, z   = table.unpack(coords + forward * 1.0)
    local text = QBCore.Shared.Items[itemname].label

    local model = Config.Boxes[itemname].prop
    RequestModel(model)
    while (not HasModelLoaded(model)) do
        Wait(1)
    end
    local box = CreateObject(model, x, y, z, true, true, false)
    PlaceObjectOnGroundProperly(box)

    TriggerEvent('animations:client:EmoteCommandStart', {"mechanic4"})
    QBCore.Functions.Progressbar('boxopening', Lang:t('info.opening')..' '..text..'...', 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@',
        anim = 'machinic_loop_mechandplayer',
        flags = 16,
    }, {}, {}, function()
        StopAnimTask(PlayerPedId(),'anim@amb@clubhouse@tutorial@bkr_tut_ig3@','machinic_loop_mechandplayer',1.0)
        DeleteEntity(box)
        TriggerServerEvent("ik-survivalbox:server:giveItems", itemname)
    end)
end)

RegisterNetEvent("ik-survivalbox:client:closeMenu", function() exports["qb-menu"]:closeMenu() end)

AddEventHandler('onResourceStop', function(resource) if resource ~= GetCurrentResourceName() then return end
	exports['qb-target']:RemoveTargetEntity(SurvivalPed)
	DeletePed(SurvivalPed)
end)
