local basehealth = 3
Config = {}
Config.HealthLevel = {}


function healthTable()
    for i = 1, 50 do
        Config.HealthLevel[i] = ( i ^ basehealth ) / (0.005 * i)
    end
    for i, v in ipairs(Config.HealthLevel) do
    --   print("Config.lua: Health Level " .. i .. " = " .. v)
     end
end

healthTable()

Config.HealthMult = {}
Config.Health = {}

function healthmultTable()
    local healthmath = 1
    for i = 1, 50 do
        if i % 5 == 0 and i ~= 50 then
            healthmath = healthmath + 1
        elseif i == 50 then
            healthmath = 10.00
        end
        Config.HealthMult[i] = healthmath
    end

    for i, v in ipairs(Config.HealthMult) do
        -- print("Config.lua: Health Level " .. i .. " = " .. v .. " health multiplier")
        -- if i % 5 == 0 then
            -- Config.Health[i] = v
            -- print(Config.Health[i])
        -- end
    end
end

healthmultTable()



local basestam = 3
Config.StaminaLevel = {}


function staminaTable()
    for i = 1, 50 do
        Config.StaminaLevel[i] = ( i ^ basestam ) / (0.005 * i)
    end
    for i, v in ipairs(Config.StaminaLevel) do
      print("Config.lua: Stamina Level " .. i .. " = " .. v)
     end
end

staminaTable()

Config.StaminaMult = {}

function staminamultTable()
    local staminamath = 1
    for i = 1, 50 do
        if i % 5 == 0 and i ~= 50 then
            staminamath = staminamath + 1
        elseif i == 50 then
            stamaniamath = 10.00
        end
        Config.StaminaMult[i] = staminamath
    end

    for i, v in ipairs(Config.StaminaMult) do
        print("Config.lua: Stamina Level " .. i .. " = " .. v .. " stamina multiplier")
    end
end

staminamultTable()
