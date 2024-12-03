RegisterNetEvent('admin:notifyInventoryOpen', function(targetType, targetId)
    local message = string.format("Du hast das %s-Inventar von [%s] geöffnet.", targetType, targetId)
    lib.notify({
        type = 'success',
        description = message
    })
end)
