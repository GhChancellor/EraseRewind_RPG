---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by lele.
--- DateTime: 24/04/23 09:17
---

local isoPlayerPZ = require("lib/IsoPlayerPZ")
local modDataManager = require("lib/ModDataManager")

---Read Weight From Hd
local function readWeightFromHd()
    return modDataManager.read(EnumModData.CHARACTER_WEIGHT)
end

---Read Calories From Hd
local function readCaloriesFromHd()
    return modDataManager.read(EnumModData.CHARACTER_CALORIES)
end

---Write Weight From Hd
local function writeWeightFromHd()
    modDataManager.save(EnumModData.CHARACTER_WEIGHT, isoPlayerPZ.getWeight_PZ())
end

---Write Calories From Hd
local function writeCaloriesFromHd()
    modDataManager.save(EnumModData.CHARACTER_CALORIES, isoPlayerPZ.getCalories_PZ())
end

---Create Character Nutrition
function createCharacterNutrition()
    if not modDataManager.isExists(EnumModData.CHARACTER_WEIGHT) then
        return nil
    end

    local weight = {}
    weight = readWeightFromHd()

    for i, v in pairs(weight) do
        isoPlayerPZ.setWeight_PZ(v)
    end

    if not modDataManager.isExists(EnumModData.CHARACTER_CALORIES) then
        return nil
    end

    local calories = {}
    calories = readCaloriesFromHd()

    for i, v in pairs(calories) do
        isoPlayerPZ.setCalories_PZ(v)
    end
end

---Wwrite Character Nutrition
function writeCharacterNutrition()
    modDataManager.remove(EnumModData.CHARACTER_WEIGHT)
    modDataManager.remove(EnumModData.CHARACTER_CALORIES)

    writeWeightFromHd()
    writeCaloriesFromHd()
end
