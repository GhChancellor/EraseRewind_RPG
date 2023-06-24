---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by lele.
--- DateTime: 07/05/23 10:42
---

---@class CharacterPZ

local CharacterPz = {}

---Add XP
---@param character IsoGameCharacter
---@param perk PerkFactory.Perk
---@param xp float
---@param flag1 boolean default false
---@param flag2 boolean default false
---@param flag3 boolean default true
--- - IsoGameCharacter : zombie.characters.IsoGameCharacter
--- - PerkFactory.Perk : zombie.characters.skills.PerkFactory
--- - IsoGameCharacter.XP : zombie.characters.IsoGameCharacter.XP
function CharacterPz.addXP_PZ(character, perk, xp, flag1, flag2, flag3)
    if not character or not perk then
        return nil
    end

    flag1 = flag1 or false -- is the default
    flag2 = flag2 or false -- is the default
    flag3 = flag3 or true -- is the default

    character:getXp():AddXP(perk, xp, flag1, flag2, flag3);
end

--- Get XP perk with truncate to two decimal place
---@param character IsoGameCharacter
---@param perk PerkFactory.Perk
---@return float xp
--- - IsoGameCharacter : zombie.characters.IsoGameCharacter
--- - PerkFactory.Perk : zombie.characters.skills.PerkFactory
--- - IsoGameCharacter.XP : zombie.characters.IsoGameCharacter.XP
function CharacterPz.getXp(character, perk)
    if not character or not perk then
        return nil
    end

    local xp = CharacterPz.getXp_PZ(character, perk)
    return CharacterPz.trunkFloatTo2Decimal( xp ) -- Perks.Maintenance
end

--- Get XP perk
---@param character IsoGameCharacter
---@param perk PerkFactory.Perk
---@return float xp
--- - IsoGameCharacter : zombie.characters.IsoGameCharacter
--- - PerkFactory.Perk : zombie.characters.skills.PerkFactory
--- - IsoGameCharacter.XP : zombie.characters.IsoGameCharacter.XP
function CharacterPz.getXp_PZ(character, perk)
    if not character or not perk then
        return nil
    end

    return character:getXp():getXP(perk) -- Perks.Maintenance
end

---@param value double
---@return int
function CharacterPz.trunkFloatTo2Decimal(value)
    return tonumber(string.format("%.2f", value)) + 0.0
end

--- Get Charater profession
---@param character IsoGameCharacter
---@param profession String
--- - IsoGameCharacter : zombie.characters.IsoGameCharacter
--- - SurvivorDesc : zombie.characters.SurvivorDesc
function CharacterPz.setProfession_PZ(character, profession)
    if not character or not profession then
        return nil
    end

    character:getDescriptor():setProfession(profession)
end

--- Get Character profession
---@param character IsoGameCharacter
---@return String
--- - IsoGameCharacter : zombie.characters.IsoGameCharacter
--- - SurvivorDesc : zombie.characters.SurvivorDesc
function CharacterPz.getProfession_PZ(character)
    if not character then
        return nil
    end

    return character:getDescriptor():getProfession()
end

--- remove Character profession
---@param character IsoGameCharacter
---@return String
--- - IsoGameCharacter : zombie.characters.IsoGameCharacter
function CharacterPz.removeProfession(character)
    local unemployed = "unemployed"
    CharacterPz.setProfession_PZ(character, unemployed)
end

CharacterPz.EnumNumbers = {
    ZERO = 0,
    ONE = 1,
    TWO = 2,
    THREE = 3,
    FOUR = 4,
    FIVE = 5,
    SIX = 6,
    SEVEN = 7,
    EIGHT = 8,
    NINE = 9,
    TEN = 10,
}

---Set Perk Level and level
---@param character IsoGameCharacter
---@param perk PerkFactory.Perk
---@param xp float
--- - IsoGameCharacter : zombie.characters.IsoGameCharacter
--- - PerkFactory.Perk : zombie.characters.skills.PerkFactory
--- - IsoGameCharacter.XP : zombie.characters.IsoGameCharacter.XP
function CharacterPz.setPerkLevel(character, perk, xp)
    if not character or not perk then
        return nil
    end

    if xp == 0 then
        return
    end

    CharacterPz.addXP_PZ(character, perk, xp,
            false, false, true )

end

--- Get Perk Level
---@param character IsoGameCharacter
---@param perk PerkFactory.Perk
---@return int
--- - IsoGameCharacter : zombie.characters.IsoGameCharacter
--- - PerkFactory.Perk : zombie.characters.skills.PerkFactory
function CharacterPz.getPerkLevel_PZ(character, perk)
    if not character or not perk then
        return nil
    end

    return character:getPerkLevel(perk)
end

---Set Perk Level and level
---@param character IsoGameCharacter
---@param perk PerkFactory.Perk
--- ISPlayerStatsUI.lua 635
--- - IsoGameCharacter : zombie.characters.IsoGameCharact
--- - PerkFactory.Perk : zombie.characters.skills.PerkFactory
--- - IsoGameCharacter.XP : zombie.characters.IsoGameCharacter.XP
function CharacterPz.removePerkLevel(character, perk)
    if not character or not perk then
        return nil
    end

    ---@type int
    local currentLevelPerk = CharacterPz.getPerkLevel_PZ(character, perk)

    for _ = 0, currentLevelPerk  do
        character:LoseLevel(perk)
    end

    ---@type float
    local xpPerk = CharacterPz.getXp(character, perk)
    xpPerk = -xpPerk

    if xpPerk == 0 then
        return
    end

    CharacterPz.addXP_PZ(character, perk, xpPerk,
            false, false, true )

end

---Set Zombies Killed
---@param character IsoGameCharacter
---@param killZombies int
--- - IsoGameCharacter : zombie.characters.IsoGameCharacter
function CharacterPz.setZombieKills_PZ(character, killZombies)
    if not character or not killZombies then
        return nil
    end

    character:setZombieKills(killZombies)
end

---Get Zombies Killed
---@param character IsoGameCharacter
---return int
--- - IsoGameCharacter : zombie.characters.IsoGameCharacter
function CharacterPz.getZombieKills_PZ(character)
    if not character then
        return nil
    end

    return character:getZombieKills()
end

---@param character IsoGameCharacter
---@param nameRecipe String
---@return boolean
--- - IsoGameCharacter : zombie.characters.IsoGameCharacter
function CharacterPz.learnRecipe_PZ(character, nameRecipe)
    if not character or not nameRecipe then
        return nil
    end

    return character:learnRecipe(nameRecipe)
end

---Set Trait
---@param character IsoGameCharacter
---@param ---@return List | TraitCollection trait String
--- - IsoGameCharacter : zombie.characters.IsoGameCharacter
--- - TraitCollection.TraitSlot : zombie.characters.traits.TraitCollection.TraitSlot
function CharacterPz.setTraitsPerk_PZ(character, trait)
    if not character or not trait then
        return nil
    end

    character:getTraits():add(trait)
end

--- Get all Traits and Perk
---@param character IsoGameCharacter
---@return List | TraitCollection
--- - IsoGameCharacter : zombie.characters.IsoGameCharacter
--- - TraitCollection : zombie.characters.traits.TraitCollection
function CharacterPz.getTraitsPerk_PZ(character)
    if not character then
        return nil
    end

    return character:getTraits()
end

----- Get Character Traits
-----@param character IsoGameCharacter
-----@return List | TraitCollection
----- - IsoGameCharacter : zombie.characters.IsoGameCharacter
----- - IsoGameCharacter.CharacterTraits : zombie.characters.IsoGameCharacter.CharacterTraits
--function CharacterPz.getTraits_PZ(character)
--    if not character then
--        return nil
--    end
--
--    return character:getCharacterTraits()
--end

-- TODO check
---Remove Trait
---@param character IsoGameCharacter
---@param trait String
--- - IsoGameCharacter : zombie.characters.IsoGameCharacter
--- - TraitCollection.TraitSlot : zombie.characters.traits.TraitCollection.TraitSlot
function CharacterPz.removeTrait_PZ(character, trait)
    if not character or not trait then
        return nil
    end

    character:getTraits():remove(trait)
end

---Clear all Traits
---@param character IsoGameCharacter
--- - IsoGameCharacter : zombie.characters.IsoGameCharacter
--- - TraitCollection.TraitSlot : zombie.characters.traits.TraitCollection.TraitSlot
function CharacterPz.removeAllTraits_PZ(character)
    if not character then
        return nil
    end

    character:getTraits():clear()
end

---Add Xp Multiplier
---@param character IsoGameCharacter
---@param perk PerkFactory.Perk
---@param multiplier float The multiplier value to apply to the XP gain of the specified perk.
---@param minLevel int
---@param maxLevel int
--- - IsoGameCharacter : zombie.characters.IsoGameCharact
--- - PerkFactory.Perk : zombie.characters.skills.PerkFactory
function CharacterPz.addXpMultiplier_PZ(character, perk, multiplier, minLevel, maxLevel)
    if not character or not perk or not
        multiplier or not minLevel or not
            maxLevel then

        return nil
    end

    character:getXp():addXpMultiplier(perk, multiplier, minLevel, maxLevel)

    --[[
    The addXpMultiplier() function is a method of the Xp class in the Project Zomboid Lua API.
    It adds a multiplier to the XP gain of a specific perk for a set period of time.

    The parameters of the function are:

    perk (string): The name of the perk to apply the XP multiplier to.
    value1 (float): The multiplier value to apply to the XP gain of the specified perk.
    value2 (int, optional): The number of in-game minutes to apply the multiplier for. If not specified, the multiplier
    will be applied indefinitely until removed.
    value3 (boolean, optional): Whether to override existing multipliers for the specified perk. Defaults to false.
    Here's an example of how to use the function:

    css
    Copy code
    character:getXp():addXpMultiplier("Farming", 2.0, 60, true)
    This would apply a 2x multiplier to the XP gain of the Farming perk for 60 in-game minutes,
    and override any existing multipliers for that perk.
    ]]
end

---Get Multiplier
---@param character IsoGameCharacter
---@param perk PerkFactory.Perk
---@return float
--- - IsoGameCharacter : zombie.characters.IsoGameCharacter
--- - PerkFactory.Perk : zombie.characters.skills.PerkFactory
function CharacterPz.getMultiplier_PZ(character, perk)
    if not character or not perk then
        return nil
    end

    return character:getXp():getMultiplier(perk)
end

---Get Multiplier
---@param character IsoGameCharacter
---@param perk PerkFactory.Perk
---@return float
--- - IsoGameCharacter : zombie.characters.IsoGameCharacter
--- - PerkFactory.Perk : zombie.characters.skills.PerkFactory
function CharacterPz.removeMultiplier(character, perk)
    if not character or not perk then
        return nil
    end

    local multiplier = character:getXp():getMultiplier(perk)

    if multiplier == 0.0 or multiplier == nil then
        return
    end

    multiplier = CharacterPz.trunkFloatTo2Decimal(-multiplier)
    local dbg1 = multiplier
    print("----------------------------------------" .. tostring(multiplier))
    CharacterPz.addXpMultiplier_PZ(character, perk, multiplier,
            1, 1)

end

---Set PerkBoost 1 - 75%, 2 - 100%, 3 - 125%, default 0 ?? - 50%
---@param character IsoGameCharacter
---@param perk PerkFactory.Perk
---@param levelBoost int
--- - IsoGameCharacter : zombie.characters.IsoGameCharacter
--- - PerkFactory.Perk : zombie.characters.skills.PerkFactory
function CharacterPz.setPerkBoost_PZ(character, perk, levelBoost)
    -- Perks.Cooking
    if not character or not perk or
            not levelBoost or levelBoost > CharacterPz.EnumNumbers.THREE then
        return nil
    end

    character:getXp():setPerkBoost(perk, levelBoost)
end

---Get Perk Boost
---@param character IsoGameCharacter
---@param perk PerkFactory.Perk
--- - IsoGameCharacter : zombie.characters.IsoGameCharacter
--- - PerkFactory.Perk : zombie.characters.skills.PerkFactory
function CharacterPz.getPerkBoost_PZ(character, perk)
    -- Perks.Cooking
    if not character or not perk then
        return nil
    end

    return character:getXp():getPerkBoost(perk)
end

---@param character IsoGameCharacter
---@param perk PerkFactory.Perk
--- - IsoGameCharacter : zombie.characters.IsoGameCharacter
--- - PerkFactory.Perk : zombie.characters.skills.PerkFactory
function CharacterPz.removePerkBoost(character, perk)
    -- Perks.Cooking
    if not character or not perk then
        return nil
    end

    character:getXp():setPerkBoost(perk, CharacterPz.EnumNumbers.ZERO )
end

---Add a single Recipe ( wrapper )
---@param character IsoGameCharacter
---@param recipe string
--- - IsoGameCharacter : zombie.characters.IsoGameCharacter
function CharacterPz.addKnownRecipe(character, recipe)
    CharacterPz.learnRecipe_PZ(character, recipe)
end

---Get Known Recipes
---@param character IsoGameCharacter
---@return List
--- - IsoGameCharacter : zombie.characters.IsoGameCharacter
function CharacterPz.getKnownRecipes_PZ(character)
    if not character then
        return nil
    end

    return character:getKnownRecipes()
end

---Get remove Known Recipe
---@param character IsoGameCharacter
---@param recipe string
--- - IsoGameCharacter : zombie.characters.IsoGameCharacter
function CharacterPz.removeKnowRecipe_PZ(character, recipe)
    if not character or not recipe then
        return nil
    end

    character:getKnownRecipes():remove(recipe)
end

---learn (add) Recipe
---@param character IsoGameCharacter
---@param recipe string
--- - IsoGameCharacter : zombie.characters.IsoGameCharacter
function CharacterPz.learnRecipe_PZ(character, recipe)
    if not character or not recipe then
        return nil
    end

    character:learnRecipe(recipe)
end

return CharacterPz