local window_management = require('window-management')
local mouse_indicator = require('mouse-indicator')

local function bind(fn, mods, key, message)
    hs.hotkey.bind(mods, key, message, fn)
end

bind(mouse_indicator.toggle, {"⌘", "⇧", "⌃"}, "d")

bind(window_management.maximizeWindow, {"⇧", "⌃"}, "f", "Maximize active window")
bind(window_management.centerOnScreen, {"⇧", "⌃"}, "c", "Center active window")

bind(window_management.topHalf, {"⇧", "⌃"}, "up", "Bring active window to top half")
bind(window_management.bottomHalf, {"⇧", "⌃"}, "down", "Bring active window to bottom half")
bind(window_management.leftHalf, {"⇧", "⌃"}, "left", "Bring active window to left half")
bind(window_management.rightHalf, {"⇧", "⌃"}, "right", "Bring active window to right half")

bind(window_management.topUp, {"⌘", "⇧", "⌃"}, "up")
bind(window_management.topDown, {"⌘", "⇧", "⌃"}, "down")
bind(window_management.leftToLeft, {"⌘", "⇧", "⌃"}, "left")
bind(window_management.leftToRight, {"⌘", "⇧", "⌃"}, "right")

bind(window_management.bottomUp, {"⇧", "⌃", "⌥"}, "up")
bind(window_management.bottomDown, {"⇧", "⌃", "⌥"}, "down")
bind(window_management.rightToLeft, {"⇧", "⌃", "⌥"}, "left")
bind(window_management.rightToRight, {"⇧", "⌃", "⌥"}, "right")

hs.hotkey.showHotkeys({"⇧", "⌃"}, "/")
-- bind(hs.hints.windowHints, {"⌃"}, "/")
