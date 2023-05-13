---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by lele.
--- DateTime: 12/05/23 15:30
---

require("client/CharacterBoost")
require("lib/DbgLeleLib")
local characterPz = require("lib/CharacterPZ")
local perkFactoryPZ = require("lib/PerkFactoryPZ")
local isoPlayerPZ = require("lib/IsoPlayerPZ")
local modDataX = require("lib/ModDataX")
local characterLib = require("CharacterLib")
local test_ = "Test - "
local fail_ = " >>>>>>>>>>>>>> FAIL"
local ok_ = " >>>>>>>>>>>>>> Ok"

---@type IsoGameCharacter
local character = getPlayer()

local function fail(value)
    print(test_ .. value .. fail_)
end

local function ok(value)
    print(test_ .. value .. ok_)
end

local function checkTest(value1, value2, nameTest)
    if value1 == value2 then
        ok(nameTest)
    else
        fail(nameTest)
    end
end

--    CharacterPerkDetails
--Fitness - 37500
--Strength - 37500
--Woodwork - 1275
--Maintenance - 75
--SmallBlunt - 75
--
--    CharacterTrait
--HardOfHearing
--SlowReader
--Handy
--
--    CharacterRecipe
--Basic Mechanics
--Intermediate Mechanics
--Herbalist
--
--    CharacterBoost
--Fitness - 3
--Strength - 3
--Woodwork - 3

local function createCharacter()
    characterPz.setProfession_PZ(character, EnumProfession.DOCTOR)

    --characterPz.setPerkLevel(character, Perks.Fitness, 37500)
    --characterPz.setPerkLevel(character, Perks.Strength, 37500)
    --characterPz.setPerkLevel(character, Perks.Woodwork, 1275)
    --characterPz.setPerkLevel(character, Perks.Maintenance, 75)
    --characterPz.setPerkLevel(character, Perks.SmallBlunt, 75)

    characterPz.setPerkBoost_PZ(character, Perks.Fitness, 3)
    characterPz.setPerkBoost_PZ(character, Perks.Strength, 3)
    characterPz.setPerkBoost_PZ(character, Perks.Woodwork, 3)

    characterPz.setTraitsPerk_PZ(character,"HardOfHearing" )
    characterPz.setTraitsPerk_PZ(character,"SlowReader" )
    characterPz.setTraitsPerk_PZ(character,"Handy" )

    characterPz.setZombieKills_PZ(character, 15)

    characterPz.addXpMultiplier_PZ()

    isoPlayerPZ.setWeight_PZ(79)
    isoPlayerPZ.setCalories_PZ(1500)
    isoPlayerPZ.setHoursSurvived_PZ(15.0)



    characterPz.setPerkLevel(character, Perks.DOCTOR, 1500)
    characterPz.setTraitsPerk_PZ(character,"Handy" )
    characterPz.addXpMultiplier_PZ(character, Perks.DOCTOR, 0.8, 1 , 1)

end
--
---- https://theindiestone.com/forums/index.php?/topic/9799-key-code-reference/
--local function onCustomUIKeyPressed(key)
--    local character = getPlayer()
--
--    if key == 34 then key34(character, key)  end -- <<<< g
--    if key == 35 then key35(character, key)  end -- <<<< h
--    if key == 36 then key36(character, key)  end -- <<<< j
--    if key == 37 then key37(character, key)  end -- <<<< kill
--    if key == 16 then key16(character, key)  end -- <<<< 1
--    if key == 17 then key17(character, key)  end -- <<<< 2
--
--end
--
--function key16(character, key)
--    if key == 16 then -- <<<< q
--        print("Key = q > createCharacter) \n")
--        createCharacter(character)
--    end
--end
--
-----@param character IsoGameCharacter
--function key17(character, key)
--    if key == 17 then
--        print("Key = w > writeBoostToHd) \n")
--
--    end
--end
--
---- Perks.Cooking
---- Perks.Maintenance
---- Perks.Woodwork
---- Perks.Sprinting
---- Todo 		self.character:playSound("CloseBook")
-----@param character IsoGameCharacter
--function key34(character, key)
--    if key == 34 then -- <<<< g
--        print("Key = g > writeBook \n")
--
--    end
--end
--
-----@param character IsoGameCharacter
--function key35(character, key)
--    if key == 35 then -- <<< h
--        print("Key = h > readBook \n")
--
--    end
--end
--
-----@param character IsoGameCharacter
--function key36(character, key)
--    if key == 36 then
--        print("Key = j > setZombieKills_PZ \n")
--
--    end
--end
--
-----@param character IsoGameCharacter
--function key37(character, key)
--    if key == 37 then -- <<<< k
--        print("Key = k > delete \n")
--        character:die()
--    end
--end

-- Events.OnCustomUIKeyPressed.Add(onCustomUIKeyPressed)