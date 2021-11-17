function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())

    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 255)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
  end

tekst = true 
tekst1 = false

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        if tekst == true then
            if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),-354.80868530273,-1536.7419433594,27.708282470703, true ) <  2 then
                DrawMarker(27,-354.80868530273,-1536.7419433594,27.708282470703, 0, 0, 0, 0, 0, 0, 1.4, 1.4, 0.5001, 83, 255, 87, 200, 0, 0, 0, 50)
                DrawText3Ds(-354.80868530273,-1536.7419433594,27.708282470703, "[~p~E~w~] Start skraldejob")
                if IsControlPressed(1, 38) then 
                    TriggerServerCallback('checkJob', function(Job)    
                        if Job == true then
                    Citizen.Wait(200)
                    local vehiclehash = GetHashKey("Rubble")
                    RequestModel(vehiclehash)
                    while not HasModelLoaded(vehiclehash) do
                        RequestModel(vehiclehash)
                        Citizen.Wait(1)
                    end
                    local coords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0, 15.0, 0)
                    Citizen.Wait(6100)
                    local spawned_car = CreateVehicle(-1705304628, -320.47454833984,-1524.7318115234,27.550001144409, 0.99,true,false)
                    SetEntityAsMissionEntity(spawned_car, true, true)
                    SetPedIntoVehicle(PlayerPedId(),spawned_car,-1)
                    SetNewWaypoint(-157.75051879883,-1666.1040039062,33.050079345703) -- -1082.61889648438, y = 456.733764648438, z = 76.3031158447266
                    tekst = false
                    tekst1 = true
                    Citizen.Wait(100)
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        if tekst1 == true then
            if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), -157.75051879883,-1666.1040039062,33.050079345703, true ) < 2 then
                DrawText3Ds(-157.75051879883,-1666.1040039062,33.050079345703, "[~p~E~w~] Tag skraldet")
                if IsControlPressed(1, 38) then 
                    local dict, anim = 'mini@repair', 'fixing_a_player'
            RequestAnimDict(dict)
            while not HasAnimDictLoaded(dict) do
                Citizen.Wait(0)
            end
            TaskPlayAnim(GetPlayerPed(-1), 'mini@repair', 'fixing_a_player', 8.0, -8, -1, 49, 0, 0, 0, 0)
                    TriggerServerEvent("givemoney")
                    Citizen.Wait(5000)
                        ClearPedSecondaryTask(GetPlayerPed(-1))
                    Citizen.Wait(200)
                    tekst1 = false
                    tekst = true
                end
            end
        end
    end
end)
