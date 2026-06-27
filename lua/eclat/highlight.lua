local M = {}

--- Setup highlight group based on palette and configs
---@param p   Eclat.Palette
---@param cfg Eclat.Config
function M.setup(p, cfg)
    ---@type table<string, vim.api.keyset.highlight>
    local hls = {

        -- MARK: - Core UI

        -- Default fg and bg for the main editor window
        Normal = {
            fg = p.feather.normal,
            bg = not cfg.transparent and p.field.dim or 'NONE',
        },

        -- Default fg and bg for non-current editor windows
        NormalNC = {
            fg = p.feather.normal,
            bg = not cfg.transparent and p.field.dim or 'NONE',
        },

        -- Default fg and bg for floating windows
        NormalFloat = { fg = p.feather.normal, bg = p.field.normal },

        -- Border, title and footer of floating windows
        FloatBorder = { fg = p.balance.normal, bg = p.field.normal },
        FloatTitle  = { fg = p.feather.dim, bg = p.field.normal, bold = true },
        FloatFooter = {
            fg     = p.balance.normal,
            bg     = p.field.normal,
            italic = cfg.italic,
        },

        -- Column shown to the right of the set textwidth
        ColorColumn = { bg = p.field.normal },

        -- Entire line and column where the cursor is positioned
        CursorLine   = { bg = p.field.normal },
        CursorColumn = { link = 'CursorLine' },

        -- Character at the end of the buffer and non-file text characters
        EndOfBuffer = { fg = p.field.normal },
        NonText     = { fg = p.field.normal },

        -- MARK: - Cursor / Search / Match

        -- Cursor shapes in normal, langmap and input-method modes
        Cursor   = { fg = 'NONE', bg = 'NONE', reverse = true },
        lCursor  = { link = 'Cursor' },
        CursorIM = { link = 'Cursor' },

        -- Current search result under the cursor
        CurSearch = {
            fg        = p.nostalgic.bright,
            bg        = p.nostalgic.tint,
            bold      = true,
            underline = cfg.underline,
        },

        -- Incremental search as characters are typed
        IncSearch = {
            fg          = p.soil.bright,
            bg          = p.soil.tint,
            bold        = true,
            underdotted = cfg.underline,
        },

        -- All non-active search matches
        Search = {
            fg          = p.growth.normal,
            bg          = p.growth.tint,
            underdotted = cfg.underline,
        },

        -- Matching bracket or parenthesis to the one under the cursor
        MatchParen = { fg = p.soil.normal, bold = true },

        -- MARK: - Diff / VCS

        -- Added, changed and deleted lines in diff mode
        DiffAdd    = { fg = p.growth.normal, bg = p.growth.tint },
        DiffChange = { fg = p.nostalgic.normal, bg = p.nostalgic.tint },
        DiffDelete = {
            fg            = p.bloom.normal,
            bg            = p.bloom.tint,
            sp            = p.balance.normal,
            strikethrough = true,
        },

        -- Changed text within a changed line
        DiffText = {
            fg          = p.nostalgic.bright,
            bg          = p.nostalgic.tint,
            bold        = true,
            underdotted = cfg.underline,
        },

        -- MARK: - Line Numbers / Signs / Fold

        -- Side columns for signs, line numbers and cursor line number
        SignColumn   = {
            fg = p.feather.dim,
            bg = not cfg.transparent and p.field.dim or 'NONE',
        },
        LineNr       = { fg = p.balance.normal, bg = 'NONE' },
        CursorLineNr = { fg = p.feather.bright, bg = 'NONE' },

        -- Fold indicator column and folded line text
        FoldColumn = {
            fg = p.balance.normal,
            bg = not cfg.transparent and p.field.dim or 'NONE',
        },
        Folded = {
            fg = p.feather.dim,
            bg = not cfg.transparent and p.field.dim or 'NONE',
        },

        -- MARK: - Status / Tabs / WinBar

        -- Status line for the current and non-current windows
        StatusLine   = {
            fg = p.feather.dim,
            bg = not cfg.transparent and p.field.dim or 'NONE',
        },
        StatusLineNC = {
            fg = p.balance.normal,
            bg = not cfg.transparent and p.field.dim or 'NONE',
        },

        -- Vertical separator between windows
        WinSeparator = { fg = p.balance.dim, bg = 'NONE' },
        VertSplit    = { link = 'WinSeparator' },

        -- Tab page labels and fill area
        TabLine     = { fg = p.growth.normal, bg = p.growth.tint },
        TabLineSel  = { fg = p.growth.bright, bg = p.growth.tint, bold = true },
        TabLineFill = { bg = not cfg.transparent and p.field.normal or 'NONE' },

        -- Window bar for the current and non-current windows
        WinBar   = { fg = p.feather.dim, bg = 'NONE' },
        WinBarNC = { fg = p.balance.normal, bg = 'NONE' },

        -- MARK: - Popups / Menus

        -- Popup menu items, selected item and kind/extra annotations
        Pmenu         = { fg = p.feather.dim, bg = p.field.normal },
        PmenuSel      = { fg = p.feather.normal, bg = p.field.bright },
        PmenuKind     = { fg = p.balance.normal, bg = p.field.normal },
        PmenuKindSel  = { fg = p.feather.dim, bg = p.field.bright },
        PmenuExtra    = { fg = p.feather.dim, bg = p.field.normal },
        PmenuExtraSel = { fg = p.feather.dim, bg = p.field.bright },

        -- Popup menu scrollbar track and thumb
        PmenuSbar  = { bg = p.field.bright },
        PmenuThumb = { bg = p.balance.normal },

        -- Command-line completion menu
        WildMenu = { link = 'Pmenu' },

        -- MARK: - Messages / Prompts

        -- Message area and separator above it
        MsgArea      = {
            fg = p.feather.dim,
            bg = not cfg.transparent and p.field.dim or 'NONE',
        },
        MsgSeparator = {
            fg = p.field.normal,
            bg = not cfg.transparent and p.field.dim or 'NONE',
        },

        -- Mode, confirmation and info prompts
        ModeMsg  = { fg = p.soil.bright, bold = true },
        MoreMsg  = { fg = p.ever.normal },
        Question = { fg = p.twilight.normal },

        -- Warning and error messages
        WarningMsg = { fg = p.soil.normal },
        ErrorMsg   = { fg = p.bloom.bright },

        -- MARK: - Visual / Selections

        -- Visual selection and non-owning selection
        Visual    = { bg = p.field.bright },
        VisualNOS = { link = 'Visual' },

        -- Highlighted line in the quickfix list
        QuickFixLine = { bg = p.field.normal },

        -- Whitespace characters shown with 'list'
        Whitespace = { fg = p.balance.normal },

        -- MARK: - Spell Checking

        -- Misspelled, rare, wrong-case and region-local words
        SpellBad   = { undercurl = true, sp = p.bloom.normal },
        SpellCap   = { undercurl = true, sp = p.soil.normal },
        SpellLocal = { undercurl = true, sp = p.ever.normal },
        SpellRare  = { undercurl = true, sp = p.nostalgic.normal },

        -- MARK: - Debug

        -- Current program counter line and breakpoint line
        debugPC         = { bg = p.bloom.tint },
        debugBreakpoint = { fg = p.soil.normal, bg = p.field.normal },

        -- MARK: - UI Accents

        -- Directory names in file listings
        Directory = { fg = p.ever.normal },

        -- Titles in output or file content
        Title = { fg = p.feather.bright, bold = true },

        -- Concealed text (e.g. markdown link syntax)
        Conceal = { fg = p.feather.dim, bold = true },
    }

    for hl, spec in pairs(hls) do
        vim.api.nvim_set_hl(0, hl, spec)
    end
end

return M
