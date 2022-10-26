local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent("ik-survivalbox:server:buyBox", function(item, price)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local bankamount = Player.PlayerData.money.bank
    local cashamount = Player.PlayerData.money.cash

    if bankamount >= price then
        if Player.Functions.AddItem(item, 1) then
            Player.Functions.RemoveMoney("bank", price)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add")
            TriggerClientEvent("ik-survivalbox:client:OpenMenu", src)
        end
    elseif cashamount >= price then
        if Player.Functions.AddItem(item, 1) then
            Player.Functions.RemoveMoney("cash", price)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add")
            TriggerClientEvent("ik-survivalbox:client:OpenMenu", src)
        end
    else
        TriggerClientEvent('QBCore:Notify', src, "You don't have enoug money!", 'error', 3000)
    end
end)

for k,_ in pairs(Config.Boxes) do
    QBCore.Functions.CreateUseableItem(k, function(source, item)
        local Player = QBCore.Functions.GetPlayer(source)
        if Player.Functions.GetItemBySlot(item.slot) ~= nil then
            TriggerClientEvent('ik-survivalbox:client:openBox', source, item.name)
        end
    end)
end

RegisterNetEvent("ik-survivalbox:server:giveItems", function(boxname)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local chance = math.random(1,100)
    local amount = 0
    local useluck = false

    if Player.Functions.RemoveItem(boxname, 1) then
        for k,v in pairs(Config.Boxes[boxname].items) do
            if v.random then amount = math.random(v.min, v.max) else amount = 1 end
            if v.luck and v.luck > 0 then useluck = true else useluck = false end
            if useluck then
                if v.luck <= chance then
                    if Player.Functions.AddItem(k, amount) then
                        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[k], "add")
                    end
                end
            else
                if Player.Functions.AddItem(k, amount) then
                    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[k], "add")
                end
            end
        end
    end
end)
