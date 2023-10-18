---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by lele.
--- DateTime: 01/04/23 21:20
---

---@class CharacterLifeTime

local CharacterLifeTime = {}

local errHandler = require("lib/ErrHandler")
local isoPlayerPZ = require("lib/IsoPlayerPZ")
local pageBook = require("PageBook")
local modDataManager = require("lib/ModDataManager")

--- **Read Life Time From Hd**
---@return table double ( timeLife )
local function readLifeTimeFromHd()
    return modDataManager.read(pageBook.Character.LIFE_TIME)
end

--- **Create Life Time**
function CharacterLifeTime.readBook()
    if not modDataManager.isExists(pageBook.Character.LIFE_TIME) then
        errHandler.errMsg("CharacterLifeTime.readBook()",
                " mod-data " .. pageBook.Character.LIFE_TIME .. " not exists")
        return nil
    end

    ---@type table
    ---@return table - double ( timeLife )
    local lifeTime = readLifeTimeFromHd()

     isoPlayerPZ.setHoursSurvived_PZ(lifeTime[1])
end

--- **Write Life Time To Hd**
function CharacterLifeTime.writeBook()
    modDataManager.remove(pageBook.Character.LIFE_TIME)

    ---@type table - double ( timeLife )
    local hoursSurvived = {}
    table.insert(hoursSurvived, isoPlayerPZ.getHoursSurvived_PZ())

    --- **Save Life Time to mod-data**
    modDataManager.save(pageBook.Character.LIFE_TIME,
            hoursSurvived)
end

return CharacterLifeTime