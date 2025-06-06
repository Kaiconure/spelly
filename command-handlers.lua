CommandHandlers = {}

---------------------------------------------------------------------
-- TODO: Implement command handlers, which will execute when
-- corresponding commands are passed to your addon via the 
-- Windower console or the FFXI chat.
---------------------------------------------------------------------

---------------------------------------------------------------------
-- Handler for the colortest command
--
CommandHandlers['check'] = function (...)
    local args = {...}
    
    local spellType = extractArgumentByName(args, '-type', true) or extractArgumentByName(args, '-t', true)
    local check = table.concat(args, ' ')

    local known, unknown = spellCheck(check, spellType)
    writeColoredMessage(ChatColors.blue, 'Found %s learnable %sspells matching: %s':format(
        colorize(ChatColors.magenta, #unknown, ChatColors.blue),
        spellType and (colorize(ChatColors.magenta, unknown[1] and unknown[1].type or spellType, ChatColors.blue) .. ' ') or '',
        colorize(ChatColors.magenta, check .. '*', ChatColors.blue)
    ))
    for i, spell in ipairs(sortSpells(unknown)) do
        writeColoredMessage(ChatColors.grey,
            '  %s%s':format(
                colorize(ChatColors.yellow, spell.name, ChatColors.gray),
                spellType and '' or ' [%s]':format(spell.type)
            ))
    end

    if #unknown > 5 then
        writeColoredMessage(ChatColors.gray, 'Summary: %s results shown':format(
            colorize(ChatColors.magenta, #unknown, ChatColors.gray)
        ))
    end
end

CommandHandlers['known'] = function (...)
    local args = {...}

    local spellType = extractArgumentByName(args, '-type', true) or extractArgumentByName(args, '-t', true)
    local check = table.concat(args, ' ')

    local known, unknown = spellCheck(check, spellType)
    writeColoredMessage(ChatColors.blue, 'Found %s known %sspells matching: %s':format(
        colorize(ChatColors.magenta, #known, ChatColors.blue),
        spellType and (colorize(ChatColors.magenta, known[1] and known[1].type or spellType, ChatColors.blue) .. ' ') or '',
        colorize(ChatColors.magenta, check .. '*', ChatColors.blue)
    ))
    for i, spell in ipairs(sortSpells(known)) do
        writeColoredMessage(ChatColors.grey,
            '  %s%s':format(
                colorize(ChatColors.green, spell.name, ChatColors.grey),
                spellType and '' or ' [%s]':format(spell.type)
            ))
    end

    if #known > 5 then
        writeColoredMessage(ChatColors.gray, 'Summary: %s results shown':format(
            colorize(ChatColors.magenta, #known, ChatColors.gray)
        ))
    end
end

CommandHandlers['help'] = function(self, ...)
    local args = {...}
    
    writeMessage('Usage: %s':format(colorize(ChatColors.slate, '//spelly <command> <arguments>')))
    writeMessage(' %s %s':format(colorize(ChatColors.blue, 'check'), colorize(ChatColors.slate, '[-type <type>] <pattern>')))
    writeMessage('   Checks if there are any learnable (but unknown) spells matching')
    writeMessage('   the specified pattern.')
    writeMessage(' %s %s':format(colorize(ChatColors.blue, 'known'), colorize(ChatColors.slate, '[-type <type>] <pattern>')))
    writeMessage('   Identifies all known spells that are usable by your current job/sub.')
    writeMessage('')
end