-- Keeps event taps alive. macOS silently disables taps after sleep (or if a
-- callback is ever slow), and Hammerspoon won't restart them on its own.
-- Usage: require("tap_guard")(someTap)

local taps = {}

local function restartAll()
  for _, tap in ipairs(taps) do
    if not tap:isEnabled() then tap:start() end
  end
end

-- Check on wake/unlock right away, and every few seconds as a backstop
tapGuardWatcher = hs.caffeinate.watcher.new(function(event)
  local w = hs.caffeinate.watcher
  if event == w.systemDidWake or event == w.screensDidWake or event == w.screensDidUnlock then
    restartAll()
  end
end):start()
tapGuardTimer = hs.timer.doEvery(5, restartAll)

return function(tap)
  table.insert(taps, tap)
  return tap
end
