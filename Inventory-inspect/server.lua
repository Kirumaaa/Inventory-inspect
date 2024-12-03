

-- Command: /inspectinventory [targetID]
lib.addCommand('inspectinventory', {
    help = 'Öffne das Inventar eines Spielers',
    params = {
        { name = 'playerId', help = 'Die ID des Zielspielers', type = 'number', required = true }
    },
    restricted = 'admin',
    handler = function(source, args)
        local playerId = args.playerId
        local targetPlayer = Ox.GetPlayer(playerId)

        if not targetPlayer then
            lib.notify(source, { type = 'error', description = 'Spieler nicht gefunden!' })
            return
        end

        -- Admin öffnet das Ziel-Inventar
        TriggerClientEvent('ox_inventory:openInventory', source, 'player', targetPlayer.source)
        lib.notify(source, { type = 'success', description = 'Inventar des Spielers geöffnet!' })
    end
})

-- Command: /inspectvehicleinventory [plate]
lib.addCommand('inspectvehicleinventory', {
    help = 'Öffne das Inventar eines Fahrzeugs',
    params = {
        { name = 'plate', help = 'Kennzeichen des Fahrzeugs', type = 'string', required = true }
    },
    restricted = 'admin', 
    handler = function(source, args)
        local plate = args.plate

        -- Admin öffnet das Fahrzeug-Inventar
        TriggerClientEvent('ox_inventory:openInventory', source, 'vehicle', plate)
        lib.notify(source, { type = 'success', description = 'Inventar des Fahrzeugs geöffnet!' })
    end
})

-- Command: /inspectstorageinventory [storage]
lib.addCommand('inspectstorageinventory', {
    help = 'Öffne das Inventar eines Lagers',
    params = {
        { name = 'storage', help = 'Name des Lagers', type = 'string', required = true }
    },
    restricted = 'admin', 
    handler = function(source, args)
        local storage = args.storage

        -- Admin öffnet das Lager-Inventar
        TriggerClientEvent('ox_inventory:openInventory', source, 'stash', storage)
        lib.notify(source, { type = 'success', description = 'Lagerinventar geöffnet!' })
    end
})
