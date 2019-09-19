local wifi = require('hs.wifi')
local notify = require('hs.notify')
local timer = require('hs.timer')

local seconds = 1
local lastRun = timer.secondsSinceEpoch()

function notifyNetworkChange(watcher, eventType, interface)
    local currentNetworkName = wifi.currentNetwork(interface);
    if (eventType == 'SSIDChange' and currentNetworkName ~= nil and (timer.secondsSinceEpoch() - seconds) >= lastRun) then
        notify.show('WIFI', 'Network Changed', 'Network changed to ' .. currentNetworkName)
        lastRun = timer.secondsSinceEpoch()
    end
end

local wifiWatcher = wifi.watcher.new(notifyNetworkChange)
wifiWatcher:start()