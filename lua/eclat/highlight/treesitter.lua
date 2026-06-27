---@param p   Eclat.Palette
---@param cfg Eclat.Config
---@return table<string, vim.api.keyset.highlight>
return function(p, cfg)
    return {

        -- MARK: - Tree-sitter

        -- Regular, doc and annotated comments
        ['@comment'] = {
            link = 'Comment',
        },
        ['@comment.documentation'] = {
            fg = p.balance.normal,
            italic = cfg.italic,
        },
        ['@comment.warning'] = {
            fg = p.soil.normal,
            bg = p.soil.tint,
            bold = true,
            italic = cfg.italic,
        },
        ['@comment.error'] = {
            fg = p.bloom.normal,
            bg = p.bloom.tint,
            bold = true,
            italic = cfg.italic,
        },
        ['@comment.note'] = {
            fg = p.growth.normal,
            bg = p.growth.tint,
            italic = cfg.italic,
        },
        ['@comment.todo'] = {
            fg = p.twilight.normal,
            bg = p.twilight.tint,
            bold = true,
            italic = cfg.italic,
        },

        -- Constants: named, builtin and macro-defined
        ['@constant'] = {
            link = 'Constant',
        },
        ['@constant.builtin'] = {
            fg = p.ever.normal,
            italic = cfg.italic,
        },
        ['@constant.macro'] = {
            fg = p.growth.normal,
            italic = cfg.italic,
        },

        -- String literals and their sub-kinds
        ['@string'] = {
            link = 'String',
        },
        ['@string.documentation'] = {
            fg = p.balance.normal,
            italic = cfg.italic,
        },
        ['@string.regex'] = {
            fg = p.twilight.normal,
        },
        ['@string.escape'] = {
            fg = p.balance.normal,
            underline = cfg.underline,
        },
        ['@string.special'] = {
            fg = p.twilight.normal,
        },
        ['@string.special.symbol'] = {
            fg = p.twilight.normal,
            italic = cfg.italic,
        },
        ['@string.special.url'] = {
            fg = p.growth.normal,
            italic = cfg.italic,
        },
        ['@string.special.path'] = {
            fg = p.growth.normal,
        },

        -- Character literals
        ['@character'] = {
            fg = p.growth.normal,
        },
        ['@character.special'] = {
            fg = p.twilight.normal,
        },

        -- Numeric literals
        ['@number'] = {
            link = 'Number',
        },
        ['@number.float'] = {
            link = 'Number',
        },

        -- Boolean literals
        ['@boolean'] = {
            link = 'Boolean',
        },

        -- Variables: plain, builtin, parameter and member access
        ['@variable'] = {
            fg = p.feather.normal,
        },
        ['@variable.builtin'] = {
            fg = p.twilight.normal,
            italic = cfg.italic,
        },
        ['@variable.parameter'] = {
            fg = p.feather.normal,
        },
        ['@variable.parameter.builtin'] = {
            fg = p.feather.dim,
        },
        ['@variable.member'] = {
            fg = p.twilight.normal,
        },

        -- Function and method definitions and calls
        ['@function'] = {
            fg = p.twilight.normal,
            italic = cfg.italic,
        },
        ['@function.builtin'] = {
            fg = p.twilight.normal,
            italic = cfg.italic,
        },
        ['@function.call'] = {
            fg = p.twilight.normal,
        },
        ['@function.macro'] = {
            fg = p.growth.normal,
        },
        ['@function.method'] = {
            fg = p.twilight.normal,
            italic = cfg.italic,
        },
        ['@function.method.call'] = {
            fg = p.twilight.normal,
        },
        ['@constructor'] = {
            fg = p.nostalgic.normal,
            italic = cfg.italic,
        },

        -- Keywords and control flow
        ['@keyword'] = {
            link = 'Keyword',
        },
        ['@keyword.coroutine'] = {
            fg = p.bloom.normal,
            italic = cfg.italic,
        },
        ['@keyword.function'] = {
            link = 'Keyword',
        },
        ['@keyword.return'] = {
            link = 'Keyword',
        },
        ['@keyword.operator'] = {
            fg = p.bloom.normal,
        },
        ['@keyword.import'] = {
            fg = p.bloom.normal,
            italic = cfg.italic,
        },
        ['@keyword.exception'] = {
            fg = p.bloom.bright,
        },

        -- Operators and punctuation
        ['@operator'] = {
            fg = p.balance.normal,
        },
        ['@punctuation.delimiter'] = {
            fg = p.balance.normal,
        },
        ['@punctuation.bracket'] = {
            fg = p.balance.normal,
        },
        ['@punctuation.special'] = {
            fg = p.nostalgic.normal,
        },

        -- Types: named, builtin, defined and qualified
        ['@type'] = {
            fg = p.soil.normal,
            underdotted = cfg.underline,
        },
        ['@type.builtin'] = {
            fg = p.soil.normal,
        },
        ['@type.definition'] = {
            fg = p.soil.normal,
        },
        ['@type.qualifier'] = {
            fg = p.twilight.normal,
            italic = cfg.italic,
        },

        -- Decorator and language-defined attributes
        ['@attribute'] = {
            fg = p.nostalgic.normal,
            italic = cfg.italic,
        },
        ['@attribute.builtin'] = {
            fg = p.nostalgic.normal,
            italic = cfg.italic,
        },

        -- Object properties, jump labels and module names
        ['@property'] = {
            fg = p.twilight.normal,
        },
        ['@label'] = {
            fg = p.growth.normal,
        },
        ['@module'] = {
            fg = p.balance.bright,
        },

        -- Markup: emphasis, headings and links
        ['@markup.strong'] = {
            fg = p.soil.normal,
            bold = true,
        },
        ['@markup.emphasis'] = {
            fg = p.twilight.normal,
            italic = true,
        },
        ['@markup.underline'] = {
            underline = true,
        },
        ['@markup.strikethrough'] = {
            strikethrough = true,
        },
        ['@markup.heading'] = {
            fg = p.ever.bright,
            bold = true,
        },
        ['@markup.heading.1'] = {
            fg = p.ever.bright,
            bg = p.ever.tint,
            bold = true,
        },
        ['@markup.heading.2'] = {
            fg = p.ever.bright,
            bg = p.ever.tint,
            bold = true,
        },
        ['@markup.heading.3'] = {
            fg = p.ever.normal,
            bold = true,
        },
        ['@markup.heading.4'] = {
            fg = p.ever.normal,
        },
        ['@markup.heading.5'] = {
            fg = p.ever.dim,
        },
        ['@markup.heading.6'] = {
            fg = p.ever.dim,
        },
        ['@markup.quote'] = {
            fg = p.feather.dim,
        },
        ['@markup.math'] = {
            fg = p.twilight.normal,
        },
        ['@markup.link'] = {
            fg = p.feather.normal,
        },
        ['@markup.link.label'] = {
            fg = p.growth.normal,
        },
        ['@markup.link.url'] = {
            fg = p.growth.normal,
            italic = cfg.italic,
        },
        ['@markup.raw'] = {
            fg = p.nostalgic.normal,
        },
        ['@markup.raw.block'] = {
            fg = p.nostalgic.normal,
        },
        ['@markup.list'] = {
            fg = p.feather.normal,
        },
        ['@markup.list.checked'] = {
            fg = p.growth.normal,
        },
        ['@markup.list.unchecked'] = {
            fg = p.balance.dim,
            strikethrough = true,
        },

        -- HTML and JSX tags
        ['@tag'] = {
            fg = p.soil.normal,
        },
        ['@tag.builtin'] = {
            fg = p.soil.normal,
        },
        ['@tag.attribute'] = {
            fg = p.growth.normal,
            italic = cfg.italic,
        },
        ['@tag.delimiter'] = {
            fg = p.feather.dim,
        },

        -- Catch-all and VCS diff annotations
        ['@none'] = {
            fg = p.feather.normal,
        },
        ['@conceal'] = {
            fg = p.balance.normal,
        },
        ['@diff.plus'] = {
            link = 'DiffAdd',
        },
        ['@diff.minus'] = {
            link = 'DiffDelete',
        },
        ['@diff.delta'] = {
            link = 'DiffChange',
        },
    }
end
