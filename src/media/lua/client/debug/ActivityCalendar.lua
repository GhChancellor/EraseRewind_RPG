---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by lele.
--- DateTime: 09/09/23 11:08
---

---@class ActivityCalendar


--
local ActivityCalendar = {}

local dataValidator = require("lib/DataValidator")

local month = {
    Jan = 1, Feb = 2, Mar = 3, Apr = 4, May = 5, Jun = 6,
    Jul = 7, Aug = 8, Sep = 9, Oct = 10, Nov = 11, Dec = 12
}

---@type int
local SECOND_IN_DAY = 86400

---@type double
local expectedDateInSecond

--- **Extract Date**
---@param date string
---@return int
local function extractDate(date)
    ---@type table
    local dateParts = {}

    if not dataValidator.isString(date) then
        return
    end

    for datePart in date:gmatch("%S+") do
        table.insert(dateParts, datePart)
    end

    --@type table
    local datePartsConverted = {
        ---@field number
        year = tonumber(dateParts[6]),
        ---@field number
        month = month[dateParts[2]],
        ---@field number
        day = tonumber(dateParts[3]),
        ---@field number
        hour = 0,
        ---@field number
        min = 0,
        ---@field number
        sec = 0
    }

    return os.time(datePartsConverted)
end

--- **Get Seconds From Days**
---@param days int
---@return double seconds
local function getSecondsFromDays(days)
    return days * SECOND_IN_DAY
end

--- **Get Days From Seconds**
---@param seconds double
---@return int days
local function getDaysFromSeconds(seconds)
    return seconds / SECOND_IN_DAY
end

--- **Get Star Time**
--- - Format date: Fri Jul 09 09:43:41 CEST 1993
---@return double seconds
local function getStarTime()
    ---@type string
    --local date = tostring( getGameTime():getCalender():getTime() )
    --return extractDate(date)

    -----------------------TEST MOD----------------------
    ----local dateFromLua = 1694078266 -- oggi
    local dateFromFakePZ = "Fri Jul 09 09:43:41 CEST 1993"
    local date = dateFromFakePZ
    return extractDate(date)
    -----------------------------------------------------
end

--- **Set Waiting Days**
---@param waitingDays int
---@return void
function ActivityCalendar.setWaitingOfDays(waitingDays)
    expectedDateInSecond = getStarTime() + getSecondsFromDays(waitingDays)
end

--- **Set Expected Date In Seconds**
---@param expectedDate double
---@return void
function ActivityCalendar.setExpectedDateInSecond(expectedDate)
    expectedDateInSecond = expectedDate
end

--- **Get Expected Date In Seconds**
---@return double expectedDate
function ActivityCalendar.getExpectedDateInSecond()
    return expectedDateInSecond
end

----- **Set Minimun Days Before Write Book**
-----@param days int
-----@return void
----- - default 1 day
--function ActivityCalendar.setMinimunDaysBeforeWriteBook(days)
--    setWaitingOfDays(days)
--end

--- **Is Expected Date**
---@return boolean
function ActivityCalendar.isExpectedDate()
    if not expectedDateInSecond then
        --ActivityCalendar.setMinimunDaysBeforeWriteBook(1)
        ActivityCalendar.setWaitingOfDays(1)
    end

    if  getStarTime() >= ActivityCalendar.getExpectedDateInSecond() then
        return true
    end

    return false
end

return ActivityCalendar