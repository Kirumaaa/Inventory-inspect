-- Event: Benachrichtigt den Admin, dass ein Inventar geöffnet wurde
RegisterNetEvent('admin:notifyInventoryOpen', function(targetType, targetIdentifier)
    local message = ''

    if targetType == 'player' then
        message = string.format("Du hast das Spielerinventar [%s] geöffnet.", targetIdentifier)
    elseif targetType == 'vehicle' then
        message = string.format("Du hast das Fahrzeuginventar [%s] geöffnet.", targetIdentifier)
    elseif targetType == 'stash' then
        message = string.format("Du hast das Lagerinventar [%s] geöffnet.", targetIdentifier)
    else
        message = "Inventar geöffnet."
    end

    -- Zeigt eine Benachrichtigung an (OxLib)
    lib.notify({
        type = 'success',
        description = message
    })
end)

-- Debug-Command (optional): Teste clientseitige Benachrichtigungen
RegisterCommand('testinventorynotify', function()
    TriggerEvent('admin:notifyInventoryOpen', 'player', '1234') -- Beispiel-Daten
end, false)
