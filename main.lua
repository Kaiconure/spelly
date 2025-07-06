require('helpers')

---------------------------------------------------------------------
--  TODO: You can use this file as the jumping off ponit for your
--  custom addon code.
---------------------------------------------------------------------

function showWelcomeMessage()
    -- We'll get the player object for two reasons:
    --  1. So we can welcome the player by name, and
    --  2. So we don't try to write chat messages if we're not signed in 
    --      as a player. This can happen when signed in to FFXI without
    --      selecting a character yet, or between switching characters.
    --
    local player = windower.ffxi.get_player()
    if not player then
        return
    end

    writeColoredMessage(ChatColors.green, 'Welcome to %s!':format(
        colorize(ChatColors.yellow, ADDON_NAME .. ' v' .. ADDON_VERSION, ChatColors.green)
    ))
end

function sortSpells(spells)
    return table.sort(spells, function (a, b)
        return string.lower(a.name) < string.lower(b.name)
    end)
end

function mountCheck(check)
    local known = {}
    local unknown = {}

    local abilities = windower.ffxi.get_abilities()
    local known_mounts = abilities and abilities.mounts or {}

    check = string.format('^%s', check):lower()
    for id, mount in pairs(resources.mounts) do
        local name = string.lower(mount.name)

        if string.match(name, check) then
            if known_mounts[mount.id] then
                known[#known + 1] = mount
            else
                unknown[#unknown + 1] = mount
            end
        end
    end

    return known, unknown
end

function spellCheck(check, spellType)
    local known = {}
    local unknown = {}

    if type(spellType) == 'string' then
        if spellType:lower() == 'mount' or spellType:lower() == 'mounts' then
            return mountCheck(check)
        end
    end

    local player = windower.ffxi.get_player()

    local main_job_id       = player.main_job_id
    local main_job_level    = player.main_job_level

    local sub_job_id        = player.sub_job_id or 0
    local sub_job_level     = player.sub_job_level or 0

    local spell_recasts = windower.ffxi.get_spell_recasts()
    local known_spells = windower.ffxi.get_spells()

    spellType = spellType and string.lower(spellType)
    check = string.format('^%s', check):lower()
    for id, spell in pairs(resources.spells) do
        local name = string.lower(spell.name)

        -- Check if the spell matches the check string
        if 
            string.match(name, check) and
            (not spellType or spellType == string.lower(spell.type)) 
        then
            -- Check if the spell can be learned by the current job/sub
            if 
                (spell.levels[main_job_id] and spell.levels[main_job_id] <= main_job_level) or
                (spell.levels[sub_job_id] and spell.levels[sub_job_id] <= sub_job_level)
            then
                -- Add the spell to the appropriate known/unknown list
                if known_spells[spell.id] then
                    known[#known + 1] = spell
                else
                    unknown[#unknown + 1] = spell
                end
            end
        end
    end

    return known, unknown
end

