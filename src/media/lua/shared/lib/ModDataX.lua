---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by lele.
--- DateTime: 10/05/23 15:11
---

local modDataX = {}

---Save ModData
---@param modData EnumModData
---@param value string or table
function modDataX.saveModata(modData, values)
    if not modData or not values then
        return nil
    end

    if type(values) ~= "table" then
        local conversionTotable = {}
        table.insert(conversionTotable, values)
        values = {}
        values = conversionTotable
        conversionTotable = nil
    end

    local lines = {}

    for i, v in pairs(values) do
        lines[i] = v
        ModData.add(modData, lines)
    end
end

---Read ModData
---@return table
function modDataX.readModata(modData)
    if not modData then
        return nil
    end

    local lines = {}
    lines = ModData.get(modData)

    if #lines >= 2 then
        return lines
    else
        local conversionTotable ={}

        for i, v in pairs(lines) do
            table.insert(conversionTotable, v)
        end
        return conversionTotable
    end
end

-- Todo Unify the moddata using two methods: write and read
---Read Single Value Into Mod Data
---@param EnumModData
--- - ModData : zombie.world.moddata.ModData
function modDataX.readSingleValue(modData)
    if not modData then
        return nil
    end

    local lines = {}

    lines = ModData.get(modData)
    return lines[1]
end

-- Todo Unify the moddata using two methods: write and read
---Insert Multiple Value Into Mod Data
---@param modData EnumModData
---@param values table
--- - ModData : zombie.world.moddata.ModData
function modDataX.insertMultipleValue(modData, values)
    if not modData or not values then
        return nil
    end

    local lines = {}

    for i, v in pairs(values) do
        lines[i] = v
        ModData.add(modData, lines)
    end
end

-- Todo Unify the moddata using two methods: write and read
---Insert Single Value Into Mod Data
---@param EnumModData
---@param value
--- - ModData : zombie.world.moddata.ModData
function modDataX.insertSingleValue(modData, value)
    if not modData or not value then
        return nil
    end

    ModData.remove(modData)

    local lines = {}
    table.insert(lines, value)

    ModData.add(modData, lines)
end

---Is Exist
---@param modData EnumModData
--- - ModData : zombie.world.moddata.ModDa
function modDataX.isExists(modData)
    return ModData.exists(modData)
end

function modDataX.remove(modData)
    ModData.remove(modData)
end

return modDataX