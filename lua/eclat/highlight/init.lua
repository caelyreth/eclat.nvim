local M = {}

---@param p   Eclat.Palette
---@param cfg Eclat.Config
function M.setup(p, cfg)
    local function apply(tbl)
        for hl, spec in pairs(tbl) do
            vim.api.nvim_set_hl(0, hl, spec)
        end
    end

    apply(require 'eclat.highlight.editor'(p, cfg))
    apply(require 'eclat.highlight.syntax'(p, cfg))
    apply(require 'eclat.highlight.treesitter'(p, cfg))
    apply(require 'eclat.highlight.lsp'(p, cfg))
end

return M
