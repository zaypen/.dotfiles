local window_management = require('window-management')
local mouse_indicator = require('mouse-indicator')
local modal = require('modal')

hs.alert.defaultStyle = {
  strokeWidth  = 2,
  strokeColor = { white = 1, alpha = 1 },
  fillColor   = { white = 0, alpha = 0.75 },
  textColor = { white = 1, alpha = 1 },
  textFont  = ".AppleSystemUIFont",
  textSize  = 12,
  radius = 8,
  atScreenEdge = 0,
  fadeInDuration = 0.15,
  fadeOutDuration = 0.15,
}


local bindings = {
  -- Window Management
  {'m', 'Maximize active window', window_management.maximizeWindow},
  {'c', 'Center active window', window_management.centerOnScreen},
  {'h', 'Bring active window to left half', window_management.leftHalf},
  {'j', 'Bring active window to bottom half', window_management.bottomHalf},
  {'k', 'Bring active window to top half', window_management.topHalf},
  {'l', 'Bring active window to right half', window_management.rightHalf},
  -- Toggles
  {'t', 'Toggles', {
    {'m', 'Toggle mouse indicator', mouse_indicator.toggle},
  }},
}

modal.bind({"⌘", "⌃"}, "w", bindings)
