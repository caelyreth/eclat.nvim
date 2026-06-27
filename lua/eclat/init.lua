local config = require 'eclat.config'
local hl     = require 'eclat.highlight'

---@class Eclat
local M = {}

M.setup = config.setup

--- Load Éclat colorscheme based on current configs
function M.load()
    local p = require 'eclat.palette'

    vim.cmd [[hi clear]]
    vim.g.colors_name   = 'eclat'
    vim.o.termguicolors = true
    hl.setup(p, config.cfg)

    if config.cfg.dev ~= false then
        vim.api.nvim_create_user_command('EclatReload', function()
            for k in pairs(package.loaded) do
                if k:match '^eclat' and k ~= 'eclat.config' then
                    package.loaded[k] = nil
                end
            end
            require('eclat').load()
        end, { desc = 'Reload Éclat colorscheme' })
    end
end

return M
