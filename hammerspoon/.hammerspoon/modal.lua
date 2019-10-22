local alert = require('hs.alert')
local hotkey = require('hs.hotkey')

local module = {}

local function wrap(m, fn)
    return function()
        fn()
        m:exit()
    end
end

module.bind = function(mods, key, mappings)
    local modal = hotkey.modal.new(mods, key)
    local message = "Cheet sheet"
    local alert_id = nil
    message = message .. "\ng\tQuit"
    modal:bind({}, "q", "Quit", function() modal:exit() end)
    for _, mapping in ipairs(mappings) do
        message = message .. "\n" .. mapping[2] .. "\t" .. mapping[3]
        modal:bind({}, mapping[2], mapping[3], wrap(modal, mapping[1]))
        modal:bind({"⌘"}, mapping[2], mapping[3], mapping[1])
    end
    message = message .. "\n\n Hold ⌘ to keep operating"
    function modal:entered()
        alert_id = alert.show(message, "infinite")
    end
    function modal:exited()
        alert.closeSpecific(alert_id)
    end
    return modal
end

return module