---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by lele.
--- DateTime: 01/02/23 19:11
--- function ISSkillProgressBar:renderPerkRect()
--- ISSkillProgressBar:updateTooltip(lvlSelected)

require("media.lua.shared.DbgLeleLib")

local function onCustomUIKeyPressed(key)
    local character = getPlayer()

    key34(character, key)
    key35(character, key)
    key36(character, key)
end

-- Perks.Maintenance
-- Perks.Woodwork
-- Perks.Sprinting
---@param character IsoGameCharacter
function key34(character, key)
    if key == 34 then -- <<<< g
        print("Key = g > get profession \n")
        -- print(tostring(IsoPlayer.getInstance():getNutrition():getWeight()))
        -- print(tostring(IsoPlayer.getInstance():getNutrition():getCalories()))

        --writeLifeTimeToHd(character)
    end
end

---@param character IsoGameCharacter
function key35(character, key)
    if key == 35 then -- <<< h
        print("Key = h > set profession \n")
        -- IsoPlayer.getInstance():getNutrition():setWeight(70.0)
        IsoPlayer.getInstance()
    end

end

---@param character IsoGameCharacter
function key36(character, key)
    if key == 36 then -- <<<< j
        print("Key = j > delete \n")
        IsoPlayer.getInstance():setHoursSurvived(15)
    end
end

-- ------------------------------------------------------------

local function lifeTime(character)
    print(tostring(getGameTime():getDaysSurvived() ) .. " - " .. tostring(getGameTime():getHoursSurvived()))

    print("-------------------------------------------------")
    print(tostring(character:getHoursSurvived()/24))
    print("-------------------------------------------------")



    local lifeTimes = getGameTime():getTimeSurvived(character)

    for s in lifeTimes:gmatch("[%d]+") do
        print(s)
    end
end

---@param character IsoGameCharacter
local function killedZombies(character)
    character:setZombieKills(15)
    print("Killed zombies " .. character:getZombieKills() )
end

-- ------------------------------------------------------------


local function OnGameStart()

end

-- Events.OnGameStart.Add(OnGameStart)
Events.OnCustomUIKeyPressed.Add(onCustomUIKeyPressed)