local alert = require('hs.alert')
local hotkey = require('hs.hotkey')
local fnutils = require('hs.fnutils')

local module = {}

local fontStyle = {
  atScreenEdge = 0,
  strokeColor = { white = 0.875, alpha = 1 },
  fillColor   = { white = 0.125, alpha = 0.75 },
  textColor = { white = 1, alpha = 1 },
  textFont = 'Monaco',
  textSize = 18,
  radius = 10,
}

local function wrap(m, fn)
    return function()
        fn()
        m:exit()
    end
end

local alertId = nil

local function close()
    if (alertId ~= nil) then
        alert.closeSpecific(alertId)
        alertId = nil
    end
end

local function display(message)
    alert.closeAll()
    alertId = alert.show(message, fontStyle, true)
end

local function bind(modal, mappings)
    local message = "Commands"
    message = message .. "\nq\tQuit"
    modal:bind({}, "q", "Quit", function() modal:exit() end)
    for _, params in ipairs(mappings) do
        local key = params[1]
        local desc = params[2]
        local func = params[3]
        if type(func) == 'function' then
            modal:bind({}, key, desc, wrap(modal, func))
            message = message .. "\n" .. key .. "\t" .. desc
        else
            modal:bind({}, key, desc, function()
                modal:exit()
                local sub = hotkey.modal.new()
                bind(sub, func)
                sub:enter()
            end)
            message = message .. "\n" .. key .. "\t" .. '+' .. desc
        end
    end
    function modal:entered()
        display(message)
    end
    function modal:exited()
        close()
    end
end

module.bind = function(mods, key, mappings)
    local modal = hotkey.modal.new(mods, key)
    bind(modal, mappings)
end

return module
