---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by lele.
--- DateTime: 26/04/23 17:41
---

require("client/CharacterBoost")
local dbgLeleLib = require("lib/DbgLeleLib")
local modDataManager = require("lib/ModDataManager")

local characterPz = require("lib/CharacterPZ")

-- Perks.Maintenance
-- Perks.Woodwork
-- Perks.Sprinting
-- Todo 		self.character:playSound("CloseBook")
---@param character IsoGameCharacter
local function key34(character, key)
    if key == 34 then -- <<<< g
        print("Key = g > writeBook \n")
        writeBook(character)
    end
end

---@param character IsoGameCharacter
local function key35(character, key)
    if key == 35 then -- <<< h
        print("Key = h > readBook \n")
        readBook(character)
    end
end

---@param character IsoGameCharacter
local function key36(character, key)
    if key == 36 then -- <<<< j
        print("Key = j > writeMil_kill_Reached \n")
        character:getModData().kilMilReached = 15
        character:getModData().milReached = 10
    end
end

---@param character IsoGameCharacter
local function key37(character, key)
    if key == 37 then -- <<<< k
        print("Key = k > delete \n")
        character:die()
    end
end

---@param character IsoGameCharacter
local function key16(character, key)
    if key == 16 then -- <<<< q
        print("Key = q > moddata milReached \n")
        local milReached01 = character:getModData().milReached

        print("-----------------------------------------------")
        modDataManager.save("milReachedx", milReached01)
        local readValues = {}
        readValues = modDataManager.read("milReachedx")

        for i, v in pairs(readValues) do
            print(v)
        end
        print("-----------------------------------------------")

        local kilMilReached01 = character:getModData().kilMilReached

        print("-----------------------------------------------")
        modDataManager.save("kilMilReachedx", kilMilReached01)
        local readValues = {}
        readValues = modDataManager.read("kilMilReachedx")

        for i, v in pairs(readValues) do
            print(v)
        end
        print("-----------------------------------------------")
    end
end

---@param character IsoGameCharacter
local function key17(character, key)
    if key == 17 then -- <<<< w
        print("Key = w >  \n")

    end
end

---@param character IsoGameCharacter
local function key18(character, key)
    if key == 18 then -- <<<< e
        print("Key = e >  \n")

    end
end

local function onCustomUIKeyPressed(key)
    local character = getPlayer()

    key16(character, key)
    key17(character, key)
    key18(character, key)
    key34(character, key)
    key35(character, key)
    key36(character, key)
    key37(character, key)
end

-- ------------------------------------------------------------
-- ------------------------------------------------------------

local function OnGameStart()

end

-- Events.OnGameStart.Add(OnGameStart)
-- Events.OnCustomUIKeyPressed.Add(onCustomUIKeyPressed)


























--[[
local function funcName()
    local player = getSpecificPlayer(0) -- ottieni il giocatore corrente
    local item = player:getInventory():FindAndReturn("nomeOggetto") -- cerca l'oggetto per nome
    if item then
        player:getInventory():Remove(item) -- rimuovi e distruggi l'oggetto
    end

end

local function funcName2()
     local player = getSpecificPlayer(0)
     local inv = player:getInventory()
     ---@type InventoryItem
     local item = inv:getFirstTypeRecurse("BookFarming1")

     ---@type Literature
    local book = item -- self.item -- assuming self.item is set to the "fishing rod" item
    local lvlSkillTrained = book:getLvlSkillTrained()
    local maxLevelTrained = book:getMaxLevelTrained()
    local category = book:getCategory()
    local skillTrained = book:getSkillTrained()

    print("Mininum Level - ", lvlSkillTrained)
    print("Maximum level - ", maxLevelTrained)
    print("category - ", category)
    print("skillTrained - ", skillTrained)
end

local function funcName3()
    -- Farming Vol. 1
    local player = getSpecificPlayer(0)
    ---@type InventoryItem
    local inv = player:getInventory()
    ---@type Item
    local items = inv:getItems()

    for i = 0, items:size() - 1 do
        local item = items:get(i)
        local name = item:getType() -- :getName()
        local count = item:getCount()
        print(name .. " - " .. count)
    end
end

local  function funcName4()
    local player = getSpecificPlayer(0)
    local inv = player:getInventory()
     ---@type InventoryItem
    local book = inv:getFirstTypeRecurse("BookFarming1")

    if book then
        ---@type InventoryItem
        local stats = book:getStats()
        --print("Boost XP: " .. stats:boostXP)
        --print("Boost skill: " .. stats.boostSkill)
    end
end
local  function funcName5()
     local lista = getCell():getInventory()

     local dbg
     for i, v in pairs(lista) do
         print(lista)
     end


         -- Now you can use the literatureList table to do whatever you need with the literature items


         --for i = 0, getCell():getInventory():size() - 1 do
         --    local item = getCell():getInventory():getItems():get(i)
         --    if instanceof(item, "Literature") then
         --        table.insert(literatureList, item)
         --    end
         --end

         -- Now you can use the literatureList table to do whatever you need with the literature items


         -- Now you can use the literatureList table to do whatever you need with the literature items

 end

local function funcName6()
    local itemsList = {}

    -- Get the player's inventory
    local inventory = getPlayer():getInventory()

    -- Loop through each item in the inventory
    for i = 0, inventory:getItems():size() - 1 do
        local item = inventory:getItems():get(i)
        -- Check if the item is not null
        if item then
            -- Add the item to the itemsList table
           print(item)
        end
    end

end

local function funcName7()
    local literatureList = {}

    for x = 0, getWorld():getMap():getWidth() - 1 do
        for y = 0, getWorld():getMap():getHeight() - 1 do
            local square = getWorld():getCell():getGridSquare(x, y, 0)
            if square ~= nil then
                local inventory = square:getInventory()
                for i = 0, inventory:size() - 1 do
                    local item = inventory:getItems():get(i)
                    if instanceof(item, "Literature") then
                        print(item)
                    end
                end
            end
        end
    end
end]]
