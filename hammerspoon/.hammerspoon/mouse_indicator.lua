mouseCircle = nil
mouseCircleTimer = nil

function mouseHighlight()
    -- Delete an existing highlight if it exists
    if mouseCircle then
        mouseCircle:delete()
        if mouseCircleTimer then
            mouseCircleTimer:stop()
        end
    end
    -- Get the current co-ordinates of the mouse pointer
    mousepoint = hs.mouse.getAbsolutePosition()
    -- Prepare a big red circle around the mouse pointer
    mouseCircle = hs.drawing.circle(hs.geometry.rect(mousepoint.x - 40, mousepoint.y - 40, 80, 80))
    mouseCircle:setStrokeColor({ ["red"] = 1, ["blue"] = 0, ["green"] = 0, ["alpha"] = 0.8 })
    mouseCircle:setFillColor({ ["red"] = 1, ["blue"] = 0, ["green"] = 0, ["alpha"] = 0.2 })
    mouseCircle:setStrokeWidth(4)
    mouseCircle:show(0.5)
    mouseCircleTimer = hs.timer.doAfter(0.5, function()
        mouseCircle:hide(1)
    end)
end

mouseObserver = hs.eventtap.new({ hs.eventtap.event.types.leftMouseUp }, mouseHighlight)

function toggleMouseObserver()
    if mouseObserver:isEnabled() then
        mouseObserver:stop()
    else
        mouseObserver:start()
    end
end

hs.hotkey.bind({ "cmd", "control", "shift" }, "D", toggleMouseObserver)
