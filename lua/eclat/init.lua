local config = require 'eclat.config'
local hl     = require 'eclat.highlight'

---@class Eclat
local M = {}

M.setup = config.setup

--- Load Éclat colorscheme based on current configs
function M.load()
    local p = require 'eclat.palette'

    -- load colorscheme
    vim.cmd [[hi clear]]
    vim.g.colors_name   = 'eclat'
    vim.o.termguicolors = true
    hl.setup(p, config.cfg)
end

return M
