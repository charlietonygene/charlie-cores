local VORPcore = exports.vorp_core:GetCore()

RegisterServerEvent("charliecores:initiate")
AddEventHandler("charliecores:initiate", function(source)
    local User = VORPcore.getUser(source)
    local Char = User.getUsedCharacter
    local identifier = Char.identifier
    local charid = Char.charIdentifier
    local firstname = Char.firstname
    local lastname = Char.lastname



    MySQL.query('SELECT `healthxp`, `staminaxp`, `healthlevel`, `staminalevel`, `totallevel`, `healthmultiplier`, `staminamultiplier` FROM `playerxp` WHERE `identifier` = @identifier AND `charid` = @charid', {
        ['@identifier'] = identifier,
        ['@charid'] = charid
    }, function(result)
        if result[1] then
            local healthxp = result[1].healthxp
            local healthlevel = result[1].healthlevel
            local staminaxp = result[1].staminaxp
            local staminalevel = result[1].staminalevel
            local prevHealthMultiplier = result[1].healthmultiplier
            local prevStaminaMultiplier = result[1].staminamultiplier
            local HealthMultiplier = prevHealthMultiplier
            local StaminaMultiplier = prevStaminaMultiplier

            print("Player " .. firstname .. " " .. lastname ..  " has loaded with health level: " .. healthlevel .. " and stamina level: " .. staminalevel)



                for i = 1, 50 do
                    if healthxp >= Config.HealthLevel[i] and staminaxp >= Config.StaminaLevel[i] then
                        healthlevel = i
                        staminalevel = i
                    end                
                end
                --
                for i = 1, #Config.HealthMult do
                    local v = Config.HealthMult[i]
                    if healthlevel >= i and staminalevel >= i then
                        print(staminalevel .. " - Print staminalevel | " .. i .. " :index - " .. v .. " :value")
    
                        if prevHealthMultiplier ~= HealthMultiplier and prevStaminaMultiplier ~= StaminaMultiplier then
                        print("Index: (health level) " .. i .. " Value: (health multiplier) " .. v)
                        print("Index: (stamina level) " .. i .. " Value: (stamina multiplier) " .. v)
                        HealthMultiplier = v
                        StaminaMultiplier = v
                        -- break
                        
                        end
    
                    end
    
                end
    
                    TriggerClientEvent("charliecores:scale", source, HealthMultiplier, StaminaMultiplier)

        

                --


                local totallevel = staminalevel + healthlevel


                MySQL.update('UPDATE `playerxp` SET healthxp = @healthxp, healthlevel = @healthlevel, staminaxp = @staminaxp, staminalevel = @staminalevel, totallevel = @totallevel, healthmultiplier = @healthmultiplier, staminamultiplier = @staminamultiplier, charid = @charid, firstname = @firstname, lastname = @lastname WHERE identifier = @identifier', {
                    ['@identifier'] = identifier,
                    ['@healthxp'] = healthxp,
                    ['@healthlevel'] = healthlevel,
                    ['@staminaxp'] = staminaxp,
                    ['@staminalevel'] = staminalevel,
                    ['@totallevel'] = totallevel,
                    ['@healthmultiplier'] = HealthMultiplier,
                    ['@staminamultiplier'] = StaminaMultiplier,
                    ['@charid'] = charid,
                    ['@firstname'] = firstname,
                    ['@lastname'] = lastname
                })

                print("Health: Database recognized. " .. firstname .. " " .. lastname .. " currently has " .. totallevel .. "  total levels. They have " .. staminaxp .. " XP in stamina (Level: " .. staminalevel .. ") and " .. healthxp .. " XP in health (Level: " .. healthlevel .. ").")
                
        else
            local healthxp = 0
            local healthlevel = 0
            local staminaxp = 0
            local staminalevel = 0
            local totallevel = 0
            local HealthMultiplier = 0
            local StaminaMultiplier = 0
            print("Health: Database empty, creating record for - " .. firstname .. " " .. lastname .. " - at level: " .. totallevel .. " total")

            MySQL.execute('INSERT INTO `playerxp` (`identifier`, `healthxp`, `healthlevel`, `staminaxp`, `staminalevel`, `totallevel`, `healthmultiplier`, `staminamultiplier`, `charid`, `firstname`, `lastname`) VALUES (@identifier, @healthxp, @healthlevel, @staminaxp, @staminalevel, @totallevel, @healthmultiplier, @staminamultiplier, @charid, @firstname, @lastname)', {
            ['@identifier'] = identifier,
            ['@healthxp'] = healthxp,
            ['@healthlevel'] = healthlevel,
            ['@staminaxp'] = staminaxp,
            ['@staminalevel'] = staminalevel,
            ['@totallevel'] = totallevel,
            ['@healthmultiplier'] = HealthMultiplier,
            ['@staminamultiplier'] = StaminaMultiplier,
            ['@charid'] = charid,
            ['@firstname'] = firstname,
            ['@lastname'] = lastname
        })
    end

    end)
end)

AddEventHandler("vorp:SelectedCharacter", function(source)
    TriggerEvent("charliecores:initiate", source)


end)


RegisterCommand("initiate", function(source)
    TriggerEvent("charliecores:initiate", source)
    -- TriggerClientEvent("charliecores:scale", healthlevel, staminalevel)
    -- print("You have" .. staminalevel .. " stamina level, and " .. healthlevel .. " health level")
end)





         
 
RegisterServerEvent("charliecores:addallXP")
AddEventHandler("charliecores:addallXP", function(source, amount)
    local User = VORPcore.getUser(source)
    local Char = User.getUsedCharacter
    local identifier = Char.identifier
    local charid = Char.charIdentifier
    local firstname = Char.firstname
    local lastname = Char.lastname


    MySQL.query('SELECT healthxp, healthlevel, staminaxp, staminalevel, totallevel, healthmultiplier, staminamultiplier FROM playerxp WHERE `identifier` = @identifier AND `charid` = @charid', {
        ['@identifier'] = identifier,
        ['@charid'] = charid
    }, function(result)
        if result[1] then
            local healthlevel = result[1].healthlevel
            local healthxp = result[1].healthxp + amount
            local staminalevel = result[1].staminalevel
            local staminaxp = result[1].staminaxp + amount
            local totallevel = result[1].totallevel
            local prevHealthMultiplier = result[1].healthmultiplier
            local prevStaminaMultiplier = result[1].staminamultiplier
            local HealthMultiplier = prevHealthMultiplier
            local StaminaMultiplier = prevStaminaMultiplier




  
            for i = 1, 50 do
                if healthxp >= Config.HealthLevel[i] and staminaxp >= Config.StaminaLevel[i] then
                    healthlevel = i
                    staminalevel = i
                end                
            end
            --
            for i = 1, #Config.HealthMult do
                local v = Config.HealthMult[i]
                if healthlevel >= i and staminalevel >= i then
                    print(staminalevel .. " - Print staminalevel | " .. i .. " :index - " .. v .. " :value")

                    if prevHealthMultiplier ~= HealthMultiplier and prevStaminaMultiplier ~= StaminaMultiplier then
                    print("Index: (health level) " .. i .. " Value: (health multiplier) " .. v)
                    print("Index: (stamina level) " .. i .. " Value: (stamina multiplier) " .. v)
                    HealthMultiplier = v
                    StaminaMultiplier = v
                    -- break
                    
                    end

                end

            end

            if prevHealthMultiplier ~= HealthMultiplier and prevStaminaMultiplier ~= StaminaMultiplier then
                TriggerClientEvent("charliecores:scale", source, HealthMultiplier, StaminaMultiplier)
            end
    


            local totallevel = staminalevel + healthlevel

            print("You have" .. staminaxp .. " stamina XP (Level: " .. staminalevel .. "), and " .. healthxp .. " health XP (Level: " .. healthlevel .. ")")
            MySQL.update('UPDATE `playerxp` SET `staminaxp` = @staminaxp, `healthxp` = @healthxp, `staminalevel` = @staminalevel, `healthlevel` = @healthlevel, `totallevel` = @totallevel, `healthmultiplier` = @healthmultiplier, `staminamultiplier` = @staminamultiplier WHERE `identifier` = @identifier AND `charid` = @charid', {
                ['@staminaxp'] = staminaxp,
                ['@staminalevel'] = staminalevel,
                ['@healthxp'] = healthxp,
                ['@healthlevel'] = healthlevel,
                ['@totallevel'] = totallevel,
                ['@healthmultiplier'] = HealthMultiplier,
                ['@staminamultiplier'] = StaminaMultiplier,
                ['@identifier'] = identifier,
                ['@charid'] = charid
            })
        end
    end)
end)

RegisterCommand("giveallXP", function(source, args)
    local amount = tonumber(args[1])
    TriggerEvent("charliecores:addallXP", source, amount)

end)
