-- MX Master gesture button -> Spaces, without Logi Options.
-- With no Logitech software the button sends: Cmd down, Tab tap (~10-25ms later),
-- and holds Cmd until the button is released. We detect that signature,
-- swallow the Tab (so the app switcher never opens), and track mouse movement
-- until Cmd comes back up.

local THRESHOLD = 40      -- pixels of movement before a gesture fires
local MAX_GAP   = 0.05    -- Cmd->Tab gap that marks the mouse, not a human

local T, P = hs.eventtap.event.types, hs.eventtap.event.properties
local now = hs.timer.secondsSinceEpoch
local cmdDownAt, active, fired, dx, dy = 0, false, false, 0, 0
local anchor   -- cursor position when the gesture started; held there until release

-- Arrow keys need the fn flag for macOS to treat Ctrl+Arrow as a Spaces shortcut
local function ctrlArrow(key)
  hs.eventtap.event.newKeyEvent({"ctrl", "fn"}, key, true):post()
  hs.eventtap.event.newKeyEvent({"ctrl", "fn"}, key, false):post()
end

spacesGestureTap = hs.eventtap.new({ T.flagsChanged, T.keyDown, T.keyUp, T.mouseMoved }, function(ev)
  local t = ev:getType()

  if t == T.flagsChanged then
    local f = ev:getFlags()
    if f.cmd and not (f.shift or f.alt or f.ctrl) then
      if cmdDownAt == 0 then cmdDownAt = now() end
    elseif not f.cmd then
      cmdDownAt = 0
      if active then
        active = false
        if not fired then ctrlArrow("up") end   -- plain click: Mission Control
      end
    end
    return false
  end

  if t == T.keyDown or t == T.keyUp then
    if ev:getKeyCode() ~= hs.keycodes.map["tab"] then return false end
    if t == T.keyDown and not active and cmdDownAt > 0 and now() - cmdDownAt < MAX_GAP then
      active, fired, dx, dy = true, false, 0, 0
      anchor = hs.mouse.absolutePosition()
    end
    return active   -- swallow Tab down/up that belongs to the gesture
  end

  -- mouseMoved
  if not active then return false end
  if not fired then
    dx = dx + ev:getProperty(P.mouseEventDeltaX)
    dy = dy + ev:getProperty(P.mouseEventDeltaY)
    if math.abs(dx) > THRESHOLD or math.abs(dy) > THRESHOLD then
      fired = true
      if math.abs(dx) > math.abs(dy) then
        ctrlArrow(dx > 0 and "right" or "left")   -- switch Space
      else
        ctrlArrow(dy < 0 and "up" or "down")      -- Mission Control / App Exposé
      end
    end
  end
  hs.mouse.absolutePosition(anchor)   -- keep the cursor still, like Logi
  return true
end):start()
