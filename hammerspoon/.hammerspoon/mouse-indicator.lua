local mouse = require('hs.mouse')
local drawing = require('hs.drawing')
local geometry = require('hs.geometry')
local timer = require('hs.timer')
local eventtap = require('hs.eventtap')
local alert = require('hs.alert')

local radius = 32;
local mouseCircle = nil
local mouseCircleTimer = nil

function mouseHighlight()
    -- Delete an existing highlight if it exists
    if mouseCircle then
        mouseCircle:delete()
        if mouseCircleTimer then
            mouseCircleTimer:stop()
        end
    end
    -- Get the current co-ordinates of the mouse pointer
    mousepoint = mouse.getAbsolutePosition()
    -- Prepare a big red circle around the mouse pointer
    mouseCircle = drawing.circle(geometry.rect(mousepoint.x - radius, mousepoint.y - radius, radius * 2, radius * 2))
    mouseCircle:setStrokeColor({ ["red"] = 1, ["blue"] = 0, ["green"] = 0, ["alpha"] = 0.8 })
    mouseCircle:setFillColor({ ["red"] = 1, ["blue"] = 0, ["green"] = 0, ["alpha"] = 0.2 })
    mouseCircle:setStrokeWidth(2)
    mouseCircle:show(0.5)
    mouseCircleTimer = timer.doAfter(0.5, function()
        mouseCircle:hide(1)
    end)
end

local mouseObserver = eventtap.new({ eventtap.event.types.leftMouseUp }, mouseHighlight)

local module = {}

module.toggle = function ()
    if mouseObserver:isEnabled() then
        mouseObserver:stop()
        alert('Mouse Indicator: Off')
    else
        mouseObserver:start()
        alert('Mouse Indicator: On')
    end
end

return module
