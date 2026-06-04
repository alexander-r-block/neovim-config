
local helpers = require('ablock.lsnip-helpers')
local get_visual = helpers.get_visual
local tex = helpers.tex_utils

local not_in_fig = function() return not tex.in_fig() end
local not_in_tikz = function() return not tex.in_tikz() end

return {
    s({trig=";nd", snippetType="autosnippet"},
        fmta(
            [[
                \node[<>] (<>) {<>};
            ]],
            { i(1), i(2), i(3) }
        ),
        { condition = tex.in_tikz  }
    ),
    s({trig=";nat", snippetType="autosnippet"},
        fmta(
            [[
                \node[<>] (<>) at (<>) {<>};
            ]],
            {i(1), i(2), i(3), i(4)}
        ),
        { condition = tex.in_tikz }
    ),
}
