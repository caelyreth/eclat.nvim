local M = {}

--- Setup highlight group based on palette and configs
---@param p   Eclat.Palette
---@param cfg Eclat.Config
function M.setup(p, cfg)
    ---@type table<string, vim.api.keyset.highlight>
    local hls = {

        -- Core UI --------------------------------

        -- Default fg and bg for main editor window
        Normal = {
            fg = p.feather.normal,
            bg = not cfg.transparent and p.field.dim or 'NONE',
        },

        -- Default fg and bg for floating window
        NormalFloat = {
            fg = p.feather.normal,
            bg = p.field.normal,
        },

        -- Border around floating window
        FloatBorder = {
            fg = p.feather.dim,
            bg = p.field.normal,
        },

        -- Title text in floating window
        FloatTitle = {
            fg = p.feather.dim,
            bg = p.field.normal,
            bold = true,
        },

        -- Footer text in floating window
        FloatFooter = {
            fg = p.feather.dim,
            bg = p.field.normal,
            italic = not cfg.italic and false or true,
        },
    }

    -- apply colorscheme
    for hl, spec in pairs(hls) do
        vim.api.nvim_set_hl(0, hl, spec)
    end
end

return M
