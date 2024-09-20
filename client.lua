ESX = exports['es_extended']:getSharedObject()

RegisterNetEvent('mysterybox:openBox', function()
    if lib.progressBar({
        duration = Config.ProgressBar.duration,
        label = Config.ProgressBar.label,
        useWhileDead = Config.ProgressBar.useWhileDead,
        canCancel = Config.ProgressBar.canCancel,
        anim = Config.ProgressBar.anim,
        disable = Config.ProgressBar.disable
    }) then
        TriggerServerEvent('mysterybox:giveReward')
    end
end)