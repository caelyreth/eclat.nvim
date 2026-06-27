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

        -- MARK: - Syntax

        -- Code comments
        Comment = { fg = p.balance.dim, italic = cfg.italic },

        -- Generic constant; used as fallback for the groups below
        Constant  = { fg = p.ever.bright, bold = true },
        String    = { fg = p.growth.normal },
        Character = { fg = p.growth.normal, bold = true },
        Number    = { fg = p.soil.normal },
        Float     = { link = 'Number' },
        Boolean   = { fg = p.nostalgic.normal, bold = true },

        -- Generic identifier and function name
        Identifier = { fg = p.feather.normal },
        Function   = { fg = p.twilight.normal, italic = cfg.italic },

        -- Control flow keywords; parent group Statement covers the rest
        Statement   = { fg = p.bloom.normal },
        Conditional = { fg = p.bloom.normal },
        Repeat      = { fg = p.bloom.normal },
        Label       = { fg = p.growth.normal },
        Operator    = { fg = p.balance.normal },
        Keyword     = { fg = p.bloom.normal },
        Exception   = { fg = p.bloom.bright },

        -- Preprocessor directives
        PreProc   = { fg = p.growth.normal },
        Include   = { fg = p.growth.normal },
        Define    = { fg = p.growth.normal },
        Macro     = { fg = p.growth.normal },
        PreCondit = { fg = p.growth.normal },

        -- Type system
        Type         = { fg = p.soil.normal, italic = cfg.italic },
        StorageClass = { fg = p.twilight.normal, italic = cfg.italic },
        Structure    = { fg = p.soil.normal, italic = cfg.italic },
        Typedef      = { fg = p.bloom.normal },

        -- Special syntax: escape sequences, tags, delimiters and highlighted comments
        Special        = { fg = p.twilight.normal },
        SpecialChar    = { fg = p.balance.normal },
        Tag            = { fg = p.soil.normal },
        Delimiter      = { fg = p.feather.normal },
        SpecialComment = { fg = p.twilight.normal, bg = p.twilight.tint },

        -- Fallback and utility groups
        Underlined = { underline = true },
        Ignore     = { fg = p.balance.dim },
        Error      = { fg = p.bloom.normal },
        Todo       = { link = 'SpecialComment' },

        -- MARK: - Tree-sitter

        -- Regular, doc and annotated comments
        ['@comment']              = { link = 'Comment' },
        ['@comment.documentation'] = { fg = p.balance.normal, italic = cfg.italic },
        ['@comment.warning']      = { fg = p.soil.normal, bg = p.soil.tint, bold = true, italic = cfg.italic },
        ['@comment.error']        = { fg = p.bloom.normal, bg = p.bloom.tint, bold = true, italic = cfg.italic },
        ['@comment.note']         = { fg = p.growth.normal, bg = p.growth.tint, italic = cfg.italic },
        ['@comment.todo']         = { fg = p.twilight.normal, bg = p.twilight.tint, bold = true, italic = cfg.italic },

        -- Constants: named, builtin and macro-defined
        ['@constant']         = { link = 'Constant' },
        ['@constant.builtin'] = { fg = p.ever.normal, italic = cfg.italic },
        ['@constant.macro']   = { fg = p.growth.normal, italic = cfg.italic },

        -- String literals and their sub-kinds
        ['@string']                = { link = 'String' },
        ['@string.documentation']  = { fg = p.balance.normal, italic = cfg.italic },
        ['@string.regex']          = { fg = p.twilight.normal },
        ['@string.escape']         = { fg = p.balance.normal, underline = cfg.underline },
        ['@string.special']        = { fg = p.twilight.normal },
        ['@string.special.symbol'] = { fg = p.twilight.normal, italic = cfg.italic },
        ['@string.special.url']    = { fg = p.growth.normal, italic = cfg.italic },
        ['@string.special.path']   = { fg = p.growth.normal },

        -- Character literals
        ['@character']         = { fg = p.growth.normal, bold = true },
        ['@character.special'] = { fg = p.twilight.normal, bold = true },

        -- Numeric literals
        ['@number']       = { link = 'Number' },
        ['@number.float'] = { link = 'Number' },

        -- Boolean literals
        ['@boolean'] = { link = 'Boolean' },

        -- Variables: plain, builtin, parameter and member access
        ['@variable']                   = { fg = p.feather.normal },
        ['@variable.builtin']           = { fg = p.twilight.normal, italic = cfg.italic },
        ['@variable.parameter']         = { fg = p.feather.normal },
        ['@variable.parameter.builtin'] = { fg = p.feather.dim },
        ['@variable.member']            = { fg = p.twilight.normal },

        -- Function and method definitions and calls
        ['@function']             = { fg = p.twilight.normal, italic = cfg.italic },
        ['@function.builtin']     = { fg = p.twilight.normal, italic = cfg.italic },
        ['@function.call']        = { fg = p.twilight.normal, italic = cfg.italic },
        ['@function.macro']       = { fg = p.growth.normal },
        ['@function.method']      = { fg = p.twilight.normal },
        ['@function.method.call'] = { fg = p.twilight.normal, italic = cfg.italic },
        ['@constructor']          = { fg = p.nostalgic.normal, italic = cfg.italic },

        -- Keywords and control flow
        ['@keyword']           = { link = 'Keyword' },
        ['@keyword.coroutine'] = { fg = p.bloom.normal, italic = cfg.italic },
        ['@keyword.function']  = { link = 'Keyword' },
        ['@keyword.return']    = { link = 'Keyword' },
        ['@keyword.operator']  = { fg = p.bloom.normal, italic = cfg.italic },
        ['@keyword.import']    = { fg = p.bloom.normal, italic = cfg.italic },
        ['@keyword.exception'] = { fg = p.bloom.bright },

        -- Operators and punctuation
        ['@operator']              = { fg = p.balance.normal },
        ['@punctuation.delimiter'] = { fg = p.balance.normal },
        ['@punctuation.bracket']   = { fg = p.balance.normal },
        ['@punctuation.special']   = { fg = p.nostalgic.normal },

        -- Types: named, builtin, defined and qualified
        ['@type']            = { fg = p.soil.normal, italic = cfg.italic, underdotted = cfg.underline },
        ['@type.builtin']    = { fg = p.soil.normal },
        ['@type.definition'] = { fg = p.soil.normal },
        ['@type.qualifier']  = { fg = p.twilight.normal, italic = cfg.italic },

        -- Decorator and language-defined attributes
        ['@attribute']         = { fg = p.nostalgic.normal, italic = cfg.italic },
        ['@attribute.builtin'] = { fg = p.nostalgic.normal, italic = cfg.italic },

        -- Object properties, jump labels and module names
        ['@property'] = { fg = p.twilight.normal },
        ['@label']    = { fg = p.growth.normal },
        ['@module']   = { fg = p.balance.bright },

        -- Markup: emphasis, headings and links
        ['@markup.strong']         = { fg = p.soil.normal, bold = true },
        ['@markup.emphasis']       = { fg = p.twilight.normal, italic = true },
        ['@markup.underline']      = { underline = true },
        ['@markup.strikethrough']  = { strikethrough = true },
        ['@markup.heading']        = { fg = p.ever.bright, bold = true },
        ['@markup.heading.1']      = { fg = p.ever.bright, bg = p.ever.tint, bold = true },
        ['@markup.heading.2']      = { fg = p.ever.bright, bg = p.ever.tint, bold = true },
        ['@markup.heading.3']      = { fg = p.ever.normal, bold = true },
        ['@markup.heading.4']      = { fg = p.ever.normal },
        ['@markup.heading.5']      = { fg = p.ever.dim },
        ['@markup.heading.6']      = { fg = p.ever.dim },
        ['@markup.quote']          = { fg = p.feather.dim },
        ['@markup.math']           = { fg = p.twilight.normal },
        ['@markup.link']           = { fg = p.feather.normal },
        ['@markup.link.label']     = { fg = p.growth.normal },
        ['@markup.link.url']       = { fg = p.growth.normal, italic = cfg.italic },
        ['@markup.raw']            = { fg = p.nostalgic.normal },
        ['@markup.raw.block']      = { fg = p.nostalgic.normal },
        ['@markup.list']           = { fg = p.feather.normal },
        ['@markup.list.checked']   = { fg = p.growth.normal },
        ['@markup.list.unchecked'] = { fg = p.balance.dim, strikethrough = true },

        -- HTML and JSX tags
        ['@tag']           = { fg = p.soil.normal },
        ['@tag.builtin']   = { fg = p.soil.normal },
        ['@tag.attribute'] = { fg = p.growth.normal, italic = cfg.italic },
        ['@tag.delimiter'] = { fg = p.feather.dim },

        -- Catch-all and VCS diff annotations
        ['@none']       = { fg = p.feather.normal },
        ['@conceal']    = { fg = p.balance.normal },
        ['@diff.plus']  = { link = 'DiffAdd' },
        ['@diff.minus'] = { link = 'DiffDelete' },
        ['@diff.delta'] = { link = 'DiffChange' },
    }

    for hl, spec in pairs(hls) do
        vim.api.nvim_set_hl(0, hl, spec)
    end
end

return M
