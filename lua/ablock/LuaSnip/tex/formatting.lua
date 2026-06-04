local helpers = require('ablock.lsnip-helpers')
local get_visual = helpers.get_visual
local tex = helpers.tex_utils

return {
    --[[
    --  text font styling
    --]]
    s({trig="([%A])ttt", regTrig=true, wordTrig=false, snippetType="autosnippet", dscr="\\texttt{}", priority=2000},
        fmta(
            "<>\\texttt{<>}",
            {
                f( function(_, snip) return snip.captures[1] end ),
                d(1, get_visual)
            }
        ),
        { condition = tex.in_text }
    ),
    s({trig="ttt", snippetType="autosnippet", dscr="\\texttt{}"},
        fmta(
            "\\texttt{<>}",
            {
                d(1, get_visual)
            }
        ),
        { condition = helpers.make_condition(tex.in_text) and helpers.line_begin }
    ),
    s({trig=";em", snippetType="autosnippet", dscr="\\emph{}"},
        fmta(
            "\\emph{<>}",
            { d(1, get_visual) }
        ),
        { condition = tex.in_text }
    ),
    s({trig="([^%a])tbb", regTrig=true, wordTrig=false, snippetType="autosnippet", dscr="\\textbf{}", priority=2000},
        fmta(
            "<>\\textbf{<>}",
            {
                f( function(_, snip) return snip.captures[1] end ),
                d(1, get_visual)
            }
        ),
        { condition = tex.in_text }
    ),
    s({trig="tbb", snippetType="autosnippet", dscr="\\textbf{}"},
        fmta(
            "\\textbf{<>}",
            {
                d(1, get_visual)
            }
        ),
        { condition = helpers.make_condition(tex.in_text) and helpers.line_begin }
    ),
    s({trig="([^%a])ull", regTrig=true, wordTrig=false, snippetType="autosnippet", dscr="\\underline{}", priority=2000},
        fmta(
            "<>\\underline{<>}",
            {
                f( function(_, snip) return snip.captures[1] end ),
                d(1, get_visual)
            }
        ),
        { condition = tex.in_text }
    ),
    s({trig="ull", snippetType="autosnippet", dscr="\\underline{}"},
        fmta(
            "\\underline{<>}",
            {
                d(1, get_visual)
            }
        ),
        { condition = helpers.make_condition(tex.in_text) and helpers.line_begin }
    ),
    s({trig="([^%a])tii", regTrig=true, wordTrig=false, snippetType="autosnippet", dscr="\\textit{}", priority=2000},
        fmta(
            "<>\\textit{<>}",
            {
                f( function(_, snip) return snip.captures[1] end ),
                d(1, get_visual)
            }
        ),
        { condition = tex.in_text }
    ),
    s({trig="tii", snippetType="autosnippet", dscr="\\textit{}"},
        fmta(
            "\\textit{<>}",
            {
                d(1, get_visual)
            }
        ),
        { condition = helpers.make_condition(tex.in_text) and helpers.line_begin }
    ),
    s({trig="([^%a])scc", regTrig=true, wordTrig=false, snippetType="autosnippet", dscr="\\textsc{}", priority=2000},
        fmta(
            "<>\\textsc{<>}",
            {
                f( function(_, snip) return snip.captures[1] end ),
                d(1, get_visual)
            }
        ),
        { condition = tex.in_text }
    ),
    s({trig="scc", snippetType="autosnippet", dscr="\\textsc{}"},
        fmta(
            "\\textsc{<>}",
            {
                d(1, get_visual)
            }
        ),
        { condition = helpers.make_condition(tex.in_text) and helpers.line_begin }
    ),
    s({trig="([^%a])tsf", regTrig=true, wordTrig=false, snippetType="autosnippet", dscr="\\textsf{}", priority=2000},
        fmta(
            "<>\\textsf{<>}",
            {
                f( function(_, snip) return snip.captures[1] end ),
                d(1, get_visual)
            }
        ),
        { condition = tex.in_text }
    ),
    s({trig="tsf", snippetType="autosnippet", dscr="\\textsf{}"},
        fmta(
            "\\textsf{<>}",
            {
                d(1, get_visual)
            }
        ),
        { condition = helpers.make_condition(tex.in_text) and helpers.line_begin }
    ),
    --[[
    -- math font styling 
    --]]

    s({trig="msf", snippetType="autosnippet", dscr="\\mathsf{}"},
        fmta(
            "\\mathsf{<>}",
            {
                d(1, get_visual)
            }
        ),
        { condition = tex.in_mathzone }
    ),
    s({trig="mbb", snippetType="autosnippet", dscr="\\mathbb{}"},
        fmta(
            "\\mathbb{<>}",
            { d(1, get_visual) }
        ),
        { condition = tex.in_mathzone }
    ),
    s({trig="mrm", snippetType="autosnippet", dscr="\\mathrm{}"},
        fmta("\\mathrm{<>}", { d(1, get_visual) }),
        { condition = tex.in_mathzone }
    ),
    s({trig="mbf", snippetType="autosnippet", dscr="\\mathbf{}"},
        fmta("\\mathbf{<>}", { d(1, get_visual) }),
        { condition = tex.in_mathzone }
    ),
    --[[
    -- font sizes 
    --]]
}
