-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
  -- theme = "tomorrow_night",
  theme = "wombat",
  tabufline = {
    order = {},
    enabled = false,
  },

  statusline = {
    theme = "default",
    order = { "mode", "file_long", "git", "%=", "lsp_msg", "%=", "diagnostics", "lsp", "cwd", "cursor" },
    modules = {
      file_long = function()
        local icon = " 󰈚 "
        local name = vim.fn.expand "%:." -- This gets the relative path
        if name == "" then
          name = "[No Name]"
        else
          local devicons_present, devicons = pcall(require, "nvim-web-devicons")
          if devicons_present then
            local ft_icon = devicons.get_icon(name)
            icon = (ft_icon ~= nil and " " .. ft_icon) or icon
          end
        end
        return "%#St_file_info#" .. icon .. " " .. name .. "%#St_file_sep# "
      end,
    },
  },
}

return M
