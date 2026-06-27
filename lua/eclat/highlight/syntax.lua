---@param p   Eclat.Palette
---@param cfg Eclat.Config
---@return table<string, vim.api.keyset.highlight>
return function(p, cfg)
    return {

        -- MARK: - Syntax

        -- Code comments
        Comment = {
            fg = p.balance.dim,
            italic = cfg.italic,
        },

        -- Generic constant; used as fallback for the groups below
        Constant = {
            fg = p.ever.bright,
        },
        String = {
            fg = p.growth.normal,
        },
        Character = {
            fg = p.growth.normal,
        },
        Number = {
            fg = p.soil.normal,
        },
        Float = {
            link = 'Number',
        },
        Boolean = {
            fg = p.nostalgic.normal,
            bold = true,
        },

        -- Generic identifier and function name
        Identifier = {
            fg = p.feather.normal,
        },
        Function = {
            fg = p.twilight.normal,
            italic = cfg.italic,
        },

        -- Control flow keywords; parent group Statement covers the rest
        Statement = {
            fg = p.bloom.normal,
        },
        Conditional = {
            fg = p.bloom.normal,
        },
        Repeat = {
            fg = p.bloom.normal,
        },
        Label = {
            fg = p.growth.normal,
        },
        Operator = {
            fg = p.balance.normal,
        },
        Keyword = {
            fg = p.bloom.normal,
        },
        Exception = {
            fg = p.bloom.bright,
        },

        -- Preprocessor directives
        PreProc = {
            fg = p.growth.normal,
        },
        Include = {
            fg = p.growth.normal,
        },
        Define = {
            fg = p.growth.normal,
        },
        Macro = {
            fg = p.growth.normal,
        },
        PreCondit = {
            fg = p.growth.normal,
        },

        -- Type system
        Type = {
            fg = p.soil.normal,
        },
        StorageClass = {
            fg = p.twilight.normal,
        },
        Structure = {
            fg = p.soil.normal,
        },
        Typedef = {
            fg = p.bloom.normal,
        },

        -- Special syntax: escape sequences, tags, delimiters and highlighted comments
        Special = {
            fg = p.twilight.normal,
        },
        SpecialChar = {
            fg = p.balance.normal,
        },
        Tag = {
            fg = p.soil.normal,
        },
        Delimiter = {
            fg = p.feather.normal,
        },
        SpecialComment = {
            fg = p.twilight.normal,
            bg = p.twilight.tint,
        },

        -- Fallback and utility groups
        Underlined = {
            underline = true,
        },
        Ignore = {
            fg = p.balance.dim,
        },
        Error = {
            fg = p.bloom.normal,
        },
        Todo = {
            link = 'SpecialComment',
        },
    }
end
