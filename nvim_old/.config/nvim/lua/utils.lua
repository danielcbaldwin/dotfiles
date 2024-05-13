--[[ Utility functions for working with nvim configuaration.

The module is stored in the `core` package in order to minimize the chance of naming clashing
--]]


local M = {}

-----------------------------------------------------------
-- Checks if running under Windows.
-----------------------------------------------------------
function M.is_win()
    if vim.loop.os_uname().version:match('Windows') then
        return true
    else
        return false
    end
end


-----------------------------------------------------------
-- Function equivalent to basename in POSIX systems.
-- @param str the path string.
-----------------------------------------------------------
function M.basename(str)
  return string.gsub(str, "(.*/)(.*)", "%2")
end

-----------------------------------------------------------
-- Contatenates given paths with correct separator.
-- @param: var args of string paths to joon.
-----------------------------------------------------------
function M.join_paths(...)
    local path_sep = M.is_win() and '\\' or '/'
    local result = table.concat({ ... }, path_sep)
    return result
end

local _base_lua_path = M.join_paths(vim.fn.stdpath('config'), 'lua')

-----------------------------------------------------------
-- Loads all modules from the given package.
-- @param package: name of the package in lua folder.
-----------------------------------------------------------
function M.glob_require(package)
    glob_path = M.join_paths(
      _base_lua_path,
      package,
      '*.lua'
    )

    for i, path in pairs(vim.split(vim.fn.glob(glob_path), '\n')) do
        -- convert absolute filename to relative
        -- ~/.config/nvim/lua/<package>/<module>.lua => <package>/foo
        relfilename = path:gsub(_base_lua_path, ""):gsub(".lua", "")
        basename = M.basename(relfilename)
        -- skip `init` and files starting with underscore.
        if (basename ~= 'init' and basename:sub(1, 1) ~= '_') then
            require(relfilename)
        end
    end
end

return M
