local helpers = require('ablock.lsnip-helpers')
local get_visual = helpers.get_visual
local tex = helpers.tex_utils

local not_in_fig = function() return not tex.in_fig() end
local not_in_tikz = function() return not tex.in_tikz() end

return {
    s({trig=";frm", snippetType="autosnippet"},
        fmta(
            [[
                \begin{frame}{<>}
                    <>
                \end{frame}
            ]],
            { i(1), i(2) }
        ),
        { condition = helpers.line_begin }
    ),
    s({trig=";ffrm", snippetType="autosnippet"},
        fmta(
            [[
                \begin{frame}[<>]{<>}
                    <>
                \end{frame}
            ]],
            { i(1), i(2), i(3) }
        ),
        { condition = helpers.line_begin }
    ),
    s({trig=";osp", snippetType="autosnippet"},
        fmta(
            [[
                \onslide+<<<>-<>>>{<>}
            ]],
            {i(1), i(2), d(3, get_visual)}
        ),
        { condition = helpers.in_frame }
    ),
}
