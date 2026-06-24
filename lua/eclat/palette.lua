---@alias Eclat.Color string 'Hex code of RGB color value'

---@class Eclat.ColorGroup
---@field normal Eclat.Color
---@field bright Eclat.Color
---@field dim    Eclat.Color
---@field tint   Eclat.Color

---@alias Eclat.Palette table<string, Eclat.ColorGroup>

--- Éclat Color Palette
---
--- The source of all color variants.
--- Named with the feel and touch of each color.
---
---@type Eclat.Palette
local palette = {
    balance = {
        normal = '#8F8F8A',
        bright = '#ADAFA7',
        dim = '#5A5A59',
        tint = '#272726',
    },
    bloom = {
        normal = '#E58587',
        bright = '#D96365',
        dim = '#A96061',
        tint = '#372525',
    },
    growth = {
        normal = '#A0A973',
        bright = '#808D3F',
        dim = '#6D724F',
        tint = '#323428',
    },
    soil = {
        normal = '#CA9A70',
        bright = '#C98345',
        dim = '#8B6F56',
        tint = '#3B322B',
    },
    twilight = {
        normal = '#A79BC5',
        bright = '#8270B2',
        dim = '#655D79',
        tint = '#323036',
    },
    nostalgic = {
        normal = '#CA92A5',
        bright = '#C06282',
        dim = '#8E6673',
        tint = '#3F3136',
    },
    ever = {
        normal = '#7AAD94',
        bright = '#3B8C71',
        dim = '#526F61',
        tint = '#282E2B',
    },
    feather = {
        normal = '#C0BEAF',
        bright = '#DBDAD1',
        dim = '#8E8D80',
        tint = '#3A3936',
    },
}

return palette
