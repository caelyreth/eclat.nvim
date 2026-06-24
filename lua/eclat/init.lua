---@class Eclat
local M = {}

--- Load Éclat colorscheme based on current configs
function M.load()
    -- load colorscheme
    vim.cmd [[hi clear]]
    vim.g.colors_name   = 'eclat'
    vim.o.termguicolors = true
end

return M
