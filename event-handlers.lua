-- ========================================================================= --
-- EVENT HANDLERS
-- ========================================================================= --

function addon_onLoad()
    --
    -- An event handler for when the addon is loaded
    --

    showWelcomeMessage()

    return
end

function addon_onUnload()
    --
    -- An event handler for when the addon is unloaded
    --

    return
end

function addon_onLogin(name)
    --
    -- An event handler for when a character logs in
    --

    showWelcomeMessage()

    return
end

function addon_onLogout(name)
    --
    -- An event handler for when a character logs in
    --

    return
end

function addon_onAddonCommand(command, ...)
    --
    -- An event handler for when the addon receives a command
    --

    if command and CommandHandlers[command] then
        CommandHandlers[command](...)
    else
        CommandHandlers.help()
    end
end