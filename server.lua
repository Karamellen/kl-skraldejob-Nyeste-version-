local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")

        RegisterNetEvent("givemoney")
            AddEventHandler("givemoney", function()
        local source = source
        local user_id = vRP.getUserId({source})
            vRP.giveMoney({user_id, 1000})
        TriggerClientEvent("pNotify:SendNotification", source,{text = "Du modtog dine penge" ..antal.. " DKK", type = "error", queue = "global", timeout = 2000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
end)