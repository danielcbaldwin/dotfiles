-- Gmail-style single-key shortcuts for Apple Mail
-- Keys fire from the message list, sidebar, or an open message you're reading,
-- but never where you type (compose/reply body, To/Subject, search field).

local MAIL = "com.apple.mail"

-- Gmail key -> { modifiers, key } sent to Apple Mail
local map = {
  c     = { {"cmd"}, "n" },            -- compose
  r     = { {"cmd"}, "r" },            -- reply
  a     = { {"cmd", "shift"}, "r" },   -- reply all
  f     = { {"cmd", "shift"}, "f" },   -- forward
  j     = "down",                      -- next message (see moveMessage)
  k     = "up",                        -- previous message
  o     = { {"cmd"}, "o" },            -- open message
  e     = { {"ctrl", "cmd"}, "a" },    -- archive
  ["#"] = { {}, "delete" },            -- delete
  ["!"] = { {"cmd", "shift"}, "j" },   -- junk / spam
  s     = { {"cmd", "shift"}, "l" },   -- flag (star)
  I     = { {"cmd", "shift"}, "u" },   -- toggle read/unread
  U     = { {"cmd", "shift"}, "u" },   -- toggle read/unread
  z     = { {"cmd"}, "z" },            -- undo
  ["/"] = { {"cmd", "alt"}, "f" },     -- search
}

-- UI roles where you type text; shortcuts never fire here
local textRoles = { AXTextField = true, AXTextArea = true, AXComboBox = true, AXSearchField = true }

local function focusedElement()
  return hs.axuielement.systemWideElement():attributeValue("AXFocusedUIElement")
end

local function focusedRole()
  local el = focusedElement()
  return el and el:attributeValue("AXRole")
end

-- True when focus is somewhere you could be typing: text fields, the search
-- field, or editable web content like a compose/reply body. A message you are
-- reading is a web view too, but a read-only one, so shortcuts still work there.
local function isTyping(el)
  if not el then return true end
  if textRoles[el:attributeValue("AXRole") or ""] then return true end
  if el:attributeValue("AXSubrole") == "AXSearchField" then return true end
  if el:attributeValue("AXEditableAncestor") then return true end
  return el:isAttributeSettable("AXValue") == true
end

-- First AXTable in Mail's front window: the message list
local function findMessageTable(el, depth)
  if not el or depth > 10 then return nil end
  if el:attributeValue("AXRole") == "AXTable" then return el end
  for _, child in ipairs(el:attributeValue("AXChildren") or {}) do
    local found = findMessageTable(child, depth + 1)
    if found then return found end
  end
end

-- j/k always move between messages: if focus is elsewhere (e.g. reading a
-- message), move focus to the message list first, then arrow up/down there.
local function moveMessage(key)
  local win = hs.axuielement.applicationElement(hs.application.frontmostApplication())
    :attributeValue("AXFocusedWindow")
  local list = findMessageTable(win, 0)
  if list and focusedElement() ~= list then list:setAttributeValue("AXFocused", true) end
  hs.eventtap.keyStroke({}, key, 0)
end

local function mailIsFront()
  local app = hs.application.frontmostApplication()
  return app and app:bundleID() == MAIL
end

gmailTap = hs.eventtap.new({ hs.eventtap.event.types.keyDown }, function(ev)
  if not mailIsFront() then return false end
  local flags = ev:getFlags()

  -- Cmd+Enter = send (works anywhere in Mail, like Gmail)
  if flags.cmd and not (flags.shift or flags.alt or flags.ctrl)
     and ev:getKeyCode() == hs.keycodes.map["return"] then
    hs.eventtap.keyStroke({"cmd", "shift"}, "d", 0)
    return true
  end

  -- Leave real shortcuts (Cmd/Ctrl/Option combos) alone
  if flags.cmd or flags.ctrl or flags.alt then return false end

  local action = map[ev:getCharacters()]
  if not action then return false end

  -- Act on the message list or an open message, never where you type
  if isTyping(focusedElement()) then return false end

  if type(action) == "string" then
    moveMessage(action)
  else
    hs.eventtap.keyStroke(action[1], action[2], 0)
  end
  return true
end):start()

-- Debug helper: Ctrl+Option+Cmd+R shows what element has focus
hs.hotkey.bind({"ctrl", "alt", "cmd"}, "R", function()
  local el = focusedElement()
  hs.alert.show(string.format("Focused: %s / %s\nShortcuts: %s",
    tostring(el and el:attributeValue("AXRole")),
    tostring(el and el:attributeValue("AXSubrole")),
    isTyping(el) and "OFF (typing)" or "ON"))
end)
-- MX Master gesture button controls Spaces
require("spaces_gesture")
