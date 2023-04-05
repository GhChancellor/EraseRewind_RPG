-----
----- Generated by EmmyLua(https://github.com/EmmyLua)
----- Created by lele.
----- DateTime: 16/03/23 17:44
-----

---@class CharacterObj

require("media.lua.shared.objects.PerkDetailsObj")

CharacterObj = {
    profession = "",
    perkDetails_LIST = {}
}

function CharacterObj:new(t)
    t = t or {}
    setmetatable(t, self)
    self.__index = self
    self.perkDetails_LIST = {}
    return t
end

---Current Character
---@param profession string
---@param perk PerkFactory.Perk
---@param level int
---@param xp float
function CharacterObj:currentCharacter(profession, perk, level, xp)
    self.profession = profession

    PerkDetailsObj:addPerkDetails(perk, level, xp)
end

---Add Perk Details ( in to list )
---@param profession string
---@param perk PerkFactory.Perk
---@param level int
function CharacterObj:addPerkDetails(perk, level, xp)
    local PerkDetailsObj01 = PerkDetailsObj:new(nil)

    PerkDetailsObj01:addPerkDetails(perk, level, xp)
    table.insert(self.perkDetails_LIST, PerkDetailsObj01)
end

---Get object PerkDetailsObj
---@return PerkDetailsObj
function CharacterObj:getPerkDetailsObj()
    return PerkDetailsObj
end

---Get Perk Details
---@return table perk, level, xp
function CharacterObj:getPerkDetails()
    return self.perkDetails_LIST
end

---Set profession
---@param profession string
function CharacterObj:setProfession(profession)
    self.profession = profession
end

---Get profession
---@return string profession
function CharacterObj:getProfession()
    return self.profession
end