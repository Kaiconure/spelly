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
    local check = table.concat(args, ' ')

    local known, unknown = spellCheck(check)
    writeColoredMessage(ChatColors.blue, 'Found %s learnable spells matching: %s':format(
        colorize(ChatColors.magenta, #unknown, ChatColors.blue),
        colorize(ChatColors.magenta, check .. '*', ChatColors.blue)
    ))
    for i, spell in ipairs(sortSpells(unknown)) do
        writeColoredMessage(ChatColors.grey,
            '  %s':format(
                colorize(ChatColors.yellow, spell.name)
            ))
    end
end

CommandHandlers['known'] = function (...)
    local args = {...}
    local check = table.concat(args, ' ')

    local known, unknown = spellCheck(check)
    writeColoredMessage(ChatColors.blue, 'Found %s known spells matching: %s':format(
        colorize(ChatColors.magenta, #known, ChatColors.blue),
        colorize(ChatColors.magenta, check .. '*', ChatColors.blue)
    ))
    for i, spell in ipairs(sortSpells(known)) do
        writeColoredMessage(ChatColors.grey,
            '  %s':format(
                colorize(ChatColors.green, spell.name)
            ))
    end
end

CommandHandlers['help'] = function(self, ...)
    local args = {...}
    
    writeMessage('Usage: %s':format(colorize(ChatColors.slate, '//spelly <command> <arguments>')))
    writeMessage(' %s %s':format(colorize(ChatColors.blue, 'check'), colorize(ChatColors.slate, '<pattern>')))
    writeMessage('   Checks if there are any learnable (but unknown) spells matching')
    writeMessage('   the specified pattern.')
    writeMessage(' %s %s':format(colorize(ChatColors.blue, 'known'), colorize(ChatColors.slate, '<pattern>')))
    writeMessage('   Identifies all known spells that are usable by your current job/sub.')
    writeMessage('')
end