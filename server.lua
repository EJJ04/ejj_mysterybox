ESX = exports['es_extended']:getSharedObject()

ESX.RegisterUsableItem('mysterybox', function(source)
    TriggerClientEvent('mysterybox:openBox', source)
end)

RegisterNetEvent('mysterybox:giveReward', function()
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.getIdentifier()

    local hasMysteryBox = exports.ox_inventory:Search(source, 'count', 'mysterybox')

    if hasMysteryBox > 0 then
        xPlayer.removeInventoryItem('mysterybox', 1)

        if Config.GiveAllItems then
            for itemName, itemData in pairs(Config.MysteryBoxItems) do
                local quantity = math.random(itemData.min, itemData.max)
                xPlayer.addInventoryItem(itemName, quantity)

                local description = Config.Notify.description:format(itemName, quantity)
                TriggerClientEvent('ox_lib:notify', source, {
                    title = Config.Notify.title,
                    description = description,
                    duration = Config.Notify.duration,
                    type = Config.Notify.type,
                    position = Config.Notify.position,
                    icon = Config.Notify.icon,
                    iconColor = Config.Notify.iconColor,
                    showDuration = Config.Notify.showDuration
                })

                local embed = {
                    {
                        ["color"] = 65280, 
                        ["title"] = Config.LogMessages.rewardTitle,
                        ["description"] = string.format(Config.LogMessages.reward, identifier, itemName, quantity),
                        ["timestamp"] = os.date("!%Y-%m-%dT%H:%M:%S"),
                        ["footer"] = {
                            ["text"] = Config.LogMessages.footerText,
                        }
                    }
                }
                PerformHttpRequest(Config.DiscordWebhook, function(err, text, headers) end, 'POST', json.encode({embeds = embed}), { ['Content-Type'] = 'application/json' })
            end
        else
            local itemList = {}
            for itemName, _ in pairs(Config.MysteryBoxItems) do
                table.insert(itemList, itemName)
            end

            local randomItem = itemList[math.random(1, #itemList)]
            local itemData = Config.MysteryBoxItems[randomItem]
            local randomQuantity = math.random(itemData.min, itemData.max)

            xPlayer.addInventoryItem(randomItem, randomQuantity)

            local description = Config.Notify.description:format(randomItem, randomQuantity)
            TriggerClientEvent('ox_lib:notify', source, {
                title = Config.Notify.title,
                description = description,
                duration = Config.Notify.duration,
                type = Config.Notify.type,
                position = Config.Notify.position,
                icon = Config.Notify.icon,
                iconColor = Config.Notify.iconColor,
                showDuration = Config.Notify.showDuration
            })

            local embed = {
                {
                    ["color"] = 65280, 
                    ["title"] = Config.LogMessages.rewardTitle,
                    ["description"] = string.format(Config.LogMessages.reward, identifier, randomItem, randomQuantity),
                    ["timestamp"] = os.date("!%Y-%m-%dT%H:%M:%S"),
                    ["footer"] = {
                        ["text"] = Config.LogMessages.footerText,
                    }
                }
            }
            PerformHttpRequest(Config.DiscordWebhook, function(err, text, headers) end, 'POST', json.encode({embeds = embed}), { ['Content-Type'] = 'application/json' })
        end
    else
        local embed = {
            {
                ["color"] = 16711680,
                ["title"] = Config.LogMessages.exploitTitle,
                ["description"] = string.format(Config.LogMessages.exploitAttempt, identifier),
                ["timestamp"] = os.date("!%Y-%m-%dT%H:%M:%S"),
                ["footer"] = {
                    ["text"] = Config.LogMessages.footerText,
                }
            }
        }
        PerformHttpRequest(Config.DiscordWebhook, function(err, text, headers) end, 'POST', json.encode({embeds = embed}), { ['Content-Type'] = 'application/json' })

        if Config.CheatKick then
            DropPlayer(source, Config.DropPlayerMessage)
        end
    end
end)