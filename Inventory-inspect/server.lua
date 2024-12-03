ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- Prüft, ob ein Spieler Admin ist
local function isAdmin(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer and xPlayer.getGroup() == 'admin' then
        return true
    end
    return false
end

-- Spielerinventar inspizieren
RegisterCommand('inspectinventory', function(source, args, rawCommand)
    if not isAdmin(source) then
        TriggerClientEvent('ox_lib:notify', source, { type = 'error', description = 'Du hast keine Berechtigung, diesen Befehl zu nutzen!' })
        return
    end

    local targetId = tonumber(args[1])
    if not targetId or not GetPlayerName(targetId) then
        TriggerClientEvent('ox_lib:notify', source, { type = 'error', description = 'Ungültige Spieler-ID!' })
        return
    end

    local xTarget = ESX.GetPlayerFromId(targetId)
    if xTarget then
        TriggerClientEvent('ox_inventory:openInventory', source, 'player', targetId)
        TriggerClientEvent('ox_lib:notify', source, { type = 'success', description = 'Inventar des Spielers geöffnet!' })
    else
        TriggerClientEvent('ox_lib:notify', source, { type = 'error', description = 'Spieler nicht gefunden!' })
    end
end, false)

-- Fahrzeuginventar inspizieren
RegisterCommand('inspectvehicleinventory', function(source, args, rawCommand)
    if not isAdmin(source) then
        TriggerClientEvent('ox_lib:notify', source, { type = 'error', description = 'Du hast keine Berechtigung, diesen Befehl zu nutzen!' })
        return
    end

    local plate = args[1]
    if not plate then
        TriggerClientEvent('ox_lib:notify', source, { type = 'error', description = 'Ungültiges Kennzeichen!' })
        return
    end

    TriggerClientEvent('ox_inventory:openInventory', source, 'vehicle', plate)
    TriggerClientEvent('ox_lib:notify', source, { type = 'success', description = 'Fahrzeuginventar geöffnet!' })
end, false)

-- Lagerinventar inspizieren
RegisterCommand('inspectstorageinventory', function(source, args, rawCommand)
    if not isAdmin(source) then
        TriggerClientEvent('ox_lib:notify', source, { type = 'error', description = 'Du hast keine Berechtigung, diesen Befehl zu nutzen!' })
        return
    end

    local storageName = args[1]
    if not storageName then
        TriggerClientEvent('ox_lib:notify', source, { type = 'error', description = 'Ungültiger Lagername!' })
        return
    end

    TriggerClientEvent('ox_inventory:openInventory', source, 'stash', storageName)
    TriggerClientEvent('ox_lib:notify', source, { type = 'success', description = 'Lagerinventar geöffnet!' })
end, false)
