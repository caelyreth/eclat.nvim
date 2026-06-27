---@param p   Eclat.Palette
---@param cfg Eclat.Config
---@return table<string, vim.api.keyset.highlight>
return function (p, cfg)
    return {

        -- MARK: - LSP / Diagnostics

        -- Base severity colors; inherited by floating, sign and virtual text groups
        DiagnosticError = {
            fg = p.bloom.normal,
        },
        DiagnosticWarn = {
            fg = p.soil.normal,
        },
        DiagnosticInfo = {
            fg = p.ever.normal,
        },
        DiagnosticHint = {
            fg = p.twilight.dim,
        },
        DiagnosticOk = {
            fg = p.growth.normal,
        },

        -- Wavy underline beneath the offending token; sp sets the wave color
        DiagnosticUnderlineError = {
            undercurl = true,
            sp = p.bloom.normal,
        },
        DiagnosticUnderlineWarn = {
            undercurl = true,
            sp = p.soil.normal,
        },
        DiagnosticUnderlineInfo = {
            undercurl = true,
            sp = p.ever.normal,
        },
        DiagnosticUnderlineHint = {
            undercurl = true,
            sp = p.twilight.dim,
        },
        DiagnosticUnderlineOk = {
            undercurl = true,
            sp = p.growth.normal,
        },

        -- Inline virtual text appended at end of line; dim variants keep it subordinate to code
        DiagnosticVirtualTextError = {
            fg = p.bloom.dim,
            italic = cfg.italic,
        },
        DiagnosticVirtualTextWarn = {
            fg = p.soil.dim,
            italic = cfg.italic,
        },
        DiagnosticVirtualTextInfo = {
            fg = p.ever.dim,
            italic = cfg.italic,
        },
        DiagnosticVirtualTextHint = {
            fg = p.twilight.dim,
            italic = cfg.italic,
        },
        DiagnosticVirtualTextOk = {
            fg = p.growth.dim,
            italic = cfg.italic,
        },

        -- Gutter sign column icons
        DiagnosticSignError = {
            fg = p.bloom.normal,
        },
        DiagnosticSignWarn = {
            fg = p.soil.normal,
        },
        DiagnosticSignInfo = {
            fg = p.ever.normal,
        },
        DiagnosticSignHint = {
            fg = p.twilight.dim,
        },
        DiagnosticSignOk = {
            fg = p.growth.normal,
        },

        -- Diagnostic messages shown in floating windows
        DiagnosticFloatingError = {
            fg = p.bloom.normal,
        },
        DiagnosticFloatingWarn = {
            fg = p.soil.normal,
        },
        DiagnosticFloatingInfo = {
            fg = p.ever.normal,
        },
        DiagnosticFloatingHint = {
            fg = p.twilight.dim,
        },

        -- Document symbol references under the cursor: neutral, read and write sites
        LspReferenceText = {
            bg = p.twilight.tint,
        },
        LspReferenceRead = {
            bg = p.ever.tint,
        },
        LspReferenceWrite = {
            bg = p.nostalgic.tint,
        },

        -- Active parameter slot highlighted in signature help popups
        LspSignatureActiveParameter = {
            fg = p.feather.bright,
            bold = true,
        },

        -- Inlay hints injected by LSP (type annotations, parameter names)
        LspInlayHint = {
            fg = p.twilight.dim,
            italic = cfg.italic,
        },
    }
end
