--- Configuration utility
local M = {}

---@class Eclat.Config
---@field transparent? boolean Enable transparent background
---@field italic?      boolean Enable italic text in highlighting
---@field underline?   boolean Enable underline decorations

---@type Eclat.Config
M.defaults = {
    transparent = false,
    italic      = true,
    underline   = false,
}

---@type Eclat.Config
M.cfg = {}

--- Helper function to setup Éclat colorscheme
function M.setup(cfg)
    M.cfg = vim.tbl_deep_extend('force', M.defaults, cfg or {})
end

return M
