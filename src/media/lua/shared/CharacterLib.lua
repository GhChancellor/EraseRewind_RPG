---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by lele.
--- DateTime: 08/05/23 21:28
---

require("lib/CharacterObj")
local characterPz = require("lib/CharacterPZ")
local perkFactoryPZ = require("lib/PerkFactoryPZ")

local CharacterLib = {}

---Get Character Traits Perk
---@param character IsoGameCharacter
---@return CharacterObj table - PerkFactory.Perk perk, int level
--- - IsoGameCharacter : zombie.characters.IsoGameCharacter
function CharacterLib.getTraitsPerk(character)
    if not character then
        return nil
    end

    local CharacterObj01 = CharacterObj:new()

    local traits_PZ = characterPz.getTraitsPerk_PZ(character)

    for i = 0, traits_PZ:size() - 1 do

        ---@type TraitFactory.Trait
        local trait = TraitFactory.getTrait(traits_PZ:get(i) )

        CharacterObj01:addTrait( trait:getType() )

        ---@type TraitFactory.Trait
        local traitMap = trait:getXPBoostMap()

        ---@type KahluaTable
        local traitKahluaTable = transformIntoKahluaTable(traitMap)

        for perk, level in pairs(traitKahluaTable) do
            CharacterObj01:addPerkDetails(perk, level:intValue(), nil)
        end
    end

    return CharacterObj01
end

---Get Character Profession
---@param character IsoGameCharacter
---@return CharacterObj getPerkDetails() -- table PerkFactory.Perk perk, int level, float xp
--- - IsoGameCharacter : zombie.characters.IsoGameCharacter
function CharacterLib.getPerkProfession(character)
    if not character then
        return nil
    end

    local CharacterObj01 = CharacterObj:new()

    ---@type SurvivorDesc
    local profession = characterPz.getProfession_PZ(character)

    ---@type ProfessionFactory
    local professionMap = ProfessionFactory.getProfession(profession):getXPBoostMap()

    ---@type KahluaTable
    local professionKahluaTable = transformIntoKahluaTable(professionMap)

    for perk, level in pairs(professionKahluaTable) do
        CharacterObj01:addPerkDetails(perk, level:intValue(), nil)
    end

    CharacterObj01:setProfession(profession)

    return CharacterObj01
end

---@deprecated
---Get character and get current skill/trait
---@param character IsoGameCharacter
---@param perk PerkFactory.Perk
---@return PerkDetailsObj getPerkDetailsObj()
--- - IsoGameCharacter : zombie.characters.IsoGameCharacter
--- - PerkFactory.Perk : zombie.characters.skills.PerkFactory
function CharacterLib.getCurrentSkill(character, perk)
    -- Perks.Maintenance
    -- Perks.Woodwork
    -- Perks.Sprinting
    if not character then
        return nil
    end

    local CharacterObj01 = CharacterObj:new()

    ---@type SurvivorDesc
    local profession = characterPz.getProfession_PZ(character)

    ---@type PerkFactory
    local perk_ = perkFactoryPZ.getPerk_PZ(perk)

    ---@type int
    local level = characterPz.getPerkLevel_PZ(character, perk_)

    ---@type double
    local xp = characterPz.getXp(character, perk_)

    CharacterObj01:currentCharacter(profession, perk_, level:intValue(), xp)

    return CharacterObj01
end

---Get character and get All skills/traits
---@param character IsoGameCharacter
---@return CharacterObj getPerkDetails() -- table PerkFactory.Perk perk, int level, float xp
--- - IsoGameCharacter : zombie.characters.IsoGameCharacter
function CharacterLib.getAllPerks(character)
    if not character then
        return nil
    end

    local CharacterObj01 = CharacterObj:new()

    for i = 0, Perks.getMaxIndex() - 1 do

        ---@type PerkFactory.Perks
        local perk = perkFactoryPZ.getPerk_PZ(Perks.fromIndex(i))

        ---@type int
        local level = characterPz.getPerkLevel_PZ(character, perk)

        ---@type double
        local xp = characterPz.getXp(character, perk)

        -- Add to objects
        CharacterObj01:addPerkDetails(perk, level, xp)
    end

    CharacterObj01:setProfession(characterPz.getPerkLevel_PZ(character))

    return CharacterObj01
end

---Get character Multiplier
---@param character IsoGameCharacter
---@return CharacterObj getPerkDetails() -- table PerkFactory.Perk perk, int level, float xp
--- - IsoGameCharacter : zombie.characters.IsoGameCharacter
function CharacterLib.getMultiplier(character)
    if not character then
        return nil
    end

    local CharacterObj01 = CharacterObj:new()
    CharacterObj01 = CharacterLib.getAllPerks(character)

    for _, v in pairs(CharacterObj01:getPerkDetails()) do
        local multiplier = characterPz.getMultiplier_PZ(character, v:getPerk())
        v:setMultiplier(multiplier)
    end

    return CharacterObj01
end


---Get character Perks Boosts
---@param character IsoGameCharacter
---@return CharacterObj getPerkDetails() -- table PerkFactory.Perk perk, int level, float xp
--- - IsoGameCharacter : zombie.characters.IsoGameCharacter
function CharacterLib.getPerksBoost(character)
    if not character then
        return nil
    end

    local CharacterObj01 = CharacterObj:new()
    CharacterObj01 = CharacterLib.getAllPerks(character)

    for _, v in pairs(CharacterObj01:getPerkDetails()) do
        local boost = characterPz.getPerkBoost_PZ(character, v:getPerk())
        v:setBoostLevel(boost)
    end

    return CharacterObj01
end

---Get Character Known Recipes
---@param character IsoGameCharacter
---@return CharacterObj getRecipes()
--- - IsoGameCharacter : zombie.characters.IsoGameCharacter
function CharacterLib.getKnownRecipes(character)
    if not character then
        return nil
    end

    local CharacterObj01 = CharacterObj:new()
    local knowRecipes = characterPz.getKnownRecipes_PZ(character)

    for i = 0, knowRecipes:size() - 1 do
        CharacterObj01:addRecipe(knowRecipes:get(i))
    end

    return CharacterObj01
end

return CharacterLib
