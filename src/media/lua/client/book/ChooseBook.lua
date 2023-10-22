---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by lele.
--- DateTime: 21/10/23 09:51
---

local ChooseBook = {}

local readBook = {
    ReadOnceBook = "ReadOnceBook",
    TimedBook = "TimedBook",
}

--- **Check if is a book**
---@param item InventoryItem
---@return boolean
function ChooseBook.isBook(item)
    if item:getType() == readBook[item:getType()] then
        return true
    end

    return false
end

--- **Check if book is correct**
---@param item InventoryItem
---@return string|nil
function ChooseBook.isCorrectBook(item, nameBook)
    if item:getType() == readBook[nameBook] then
        return true
    end

    return false
end

return ChooseBook