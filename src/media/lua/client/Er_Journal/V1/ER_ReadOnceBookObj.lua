-----
----- Generated by EmmyLua(https://github.com/EmmyLua)
----- Created by lele.
----- DateTime: 12/10/23 16:51
-----
--
--require "TimedActions/ISReadABook"
--local characterManagement = require("CharacterManagement")
--local debugDiagnostics = require("lib/DebugDiagnostics")
--local errHandler = require("lib/ErrHandler")
--local inventoryItemPZ = require("lib/InventoryItemPZ")
--
-----@type string
--local readBook = "ReadOnceBookJournal"
--
-----@type ISReadABook
--local OVER_WRITE_ISReadABook_start = ISReadABook.start
--
-----@type ISReadABook
--local OVER_WRITE_ISReadABook_perform = ISReadABook.perform
--
-----@type ISReadABook
--local OVER_WRITE_ISReadABook_new = ISReadABook.new
--
----- **Action Start**
-----@return void
--function ISReadABook:start()
--    --@type Literature
--    local item = self.item
--
--    if item:getType() ~= readBook then
--        OVER_WRITE_ISReadABook_start(self)
--    end
--end
--
----- **Action End**
-----@return void
--function ISReadABook:perform()
--    ---@type Literature
--    local item = self.item
--
--    if item:getType() ~= readBook then
--        OVER_WRITE_ISReadABook_perform(self)
--    else
--        --- **Load mod-data - Character stats**
--        characterManagement.readBook(debugDiagnostics.characterUpdate())
--
--        ---@type IsoGameCharacter
--        local character = debugDiagnostics.characterUpdate()
--
--        --- **Remove item**
--        inventoryItemPZ.removeItem(character, item)
--
--    end
--
--    ISBaseTimedAction.perform(self)
--end
--
----- **Action Init**
-----@param character IsoGameCharacter
-----@param item InventoryItem
-----@param time float
-----@return ISReadABook
----- - IsoGameCharacter : zombie.characters.IsoGameCharacter
----- - InventoryItem : zombie.inventory.InventoryItem
--function ISReadABook:new(character, item, time)
--    if not character then
--        errHandler.errMsg("ISReadABook:new(character, item, time)",
--                errHandler.err.IS_NULL_CHARACTERS)
--        return nil
--    end
--
--    --- **Check if item is null**
--    if not item then
--        errHandler.errMsg("ISReadABook:new(character, item, time)",
--                "item " .. errHandler.err.IS_NULL)
--        return nil
--    end
--
--    --- **Create a new instance of ISReadABook**
--    ---@type ISReadABook
--    local er_Book = OVER_WRITE_ISReadABook_new(self, character, item, time)
--
--    if er_Book and item:getType() == readBook then
--
--        character:playSound("OpenBook")
--
--        er_Book.loopedAction = false
--        er_Book.useProgressBar = false
--        er_Book.maxTime = 80
--        er_Book.stopOnWalk = false
--        character:playSound("CloseBook")
--    end
--
--    return er_Book
--end
--
