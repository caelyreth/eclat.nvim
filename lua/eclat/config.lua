--- Configuration utility
local M = {}

---@class Eclat.Config
---@field transparent? boolean Enable transparent background
---@field italic?      boolean Enable italic text in highlighting

---@type Eclat.Config
M.defaults = {
    transparent = false,
    italic = true,
}

---@type Eclat.Config
M.cfg = {}

--- Helper function to setup Éclat colorscheme
function M.setup(cfg)
    M.cfg = vim.tbl_deep_extend('force', M.defaults, cfg or {})
end

return M
