local reticle = false
local aiming = true

CreateThread(
    function()
        while true do
            Wait(100)
            if reticle then
                if aiming then
                    SendNUIMessage({display = "aimIn"})
                else
                    SendNUIMessage({display = "aimOut"})
                end
            else
                SendNUIMessage({display = "aimOut"})
            end
        end
    end
)

CreateThread(
    function()
        while true do
            Wait(0)
            if IsPedArmed(PlayerPedId(), 6) then
                if (IsPlayerFreeAiming(PlayerId())) then
                    HideHudComponentThisFrame(14)
                    aiming = true
                    reticle = true
                    wait = 100
                else
                    aiming = false
                    Wait(100)
                end
            else
                aiming = false
                SendNUIMessage({display = "aimOut"})
                Wait(100)
            end
        end
    end
)
