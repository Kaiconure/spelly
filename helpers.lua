-- ========================================================================= --
-- HELPERS
--  These are things that we might find ourselves using in more than one place,
--  but which are not part of any library.
-- ========================================================================= --

DEFAULT_COLOR     = 89  -- This will be a lavender/violet color

ChatColors = 
{
    white = 1,
    green = 2,
    blue = 6,
    magenta = 5,
    redbrick = 8,
    darkgray = 65,
    gray = 67,
    grey = 67,
    salmon = 68,
    yellow = 69,
    slate = 70,
    red = 76,
    aquamarine = 83,
    babyblue = 87,
    purple = 89,
    pink = 105,
    cornsilk = 109,
    royalblue = 112,

    linkshell = 88,
    linkshell2 = 110,
    party = 6,
    tell = 73,
}

---------------------------------------------------------------------
-- FFXI uses an "index based" coloring scheme. This function inserts
-- the correct data before and after the specified string to ensure 
-- that it will be rendered in the requested color in-game.
function colorize(color, message, returnColor)
    color = tonumber(color) or DEFAULT_COLOR
    returnColor = tonumber(returnColor) or DEFAULT_COLOR

    return string.char(0x1E, color) 
        .. (message or '')
        .. string.char(0x1E, returnColor)
end

---------------------------------------------------------------------
-- Writes a message that only you can see to the ffxi chat, using
-- the provided color index.
function writeColoredMessage(color, format, ...)
    windower.add_to_chat(1, colorize(color, string.format(format, ...)))
 end

---------------------------------------------------------------------
-- Writes a message that only you can see to the FFXI chat, using
-- the default color index.
function writeMessage(format, ...)
    writeColoredMessage(DEFAULT_COLOR, format, ...)
end

---------------------------------------------------------------------
-- Gets the index of a given search item within an array, or nil
-- if not found. An optional comparison function can be used if
-- the default equality operator is not appropriate.
function arrayIndexOf(array, search, fn)
    if type(array) == 'table' and #array > 0 then
        if type(fn) ~= 'function' then
            fn = function(a, b) return a == b end
        end

        for i = 1, #array do
            if fn(array[i], search) then
                return i
            end
        end
    end
end

---------------------------------------------------------------------
-- Gets the index of a given search string within an array of 
-- strings. The search is performed without case-sensitivity.
function arrayIndexOfStrI(array, search)
    if type(search) ~= 'string' then return end
    search = string.lower(search)

    for i = 1, #array do
        local item = array[i]
        if
            type(item) == 'string' and
            string.lower(item) == search
        then
            return i
        end
    end
end

---------------------------------------------------------------------
-- Given an arguments array, find and remove specified argument. If
-- the withValue parameter is set, then the argument immediately
-- following the search value will be extracted and removed.
function extractArgumentByName(args, arg, withValue)
    -- Check for a spell type filter
    local value = nil
    local i = arrayIndexOfStrI(args, arg)
    if i then
        table.remove(args, i)
        if withValue then
            if args[i] then
                value = args[i]
                table.remove(args, i)
            end
        else
            value = true
        end
    end

    return value
end