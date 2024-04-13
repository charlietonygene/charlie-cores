local VORPcore = exports.vorp_core:GetCore()


RegisterNetEvent("charliecores:scale")
AddEventHandler("charliecores:scale", function(HealthMultiplier, StaminaMultiplier)
    print(HealthMultiplier)
    print(StaminaMultiplier)

        ------ fill health ring to level ------
        local a2 = DataView.ArrayBuffer(12 * 8)
        local a3 = DataView.ArrayBuffer(12 * 8)
        Citizen.InvokeNative("0xCB5D11F9508A928D", 1, a2:Buffer(), a3:Buffer(), GetHashKey("UPGRADE_HEALTH_TANK_1"), 1084182731, HealthMultiplier, 752097756)
        ----------------- ~ -----------------


        ------ fill stamina ring to level ------
        local a2 = DataView.ArrayBuffer(12 * 8)
        local a3 = DataView.ArrayBuffer(12 * 8)
        Citizen.InvokeNative("0xCB5D11F9508A928D", 1, a2:Buffer(), a3:Buffer(), GetHashKey("UPGRADE_STAMINA_TANK_1"), 1084182731, StaminaMultiplier, 752097756)
        ------------------ ~ -----------------
end)
