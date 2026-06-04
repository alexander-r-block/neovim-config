local helpers = require('ablock.lsnip-helpers')
local get_visual = helpers.get_visual
local tex = helpers.tex_utils

return {
    s({trig=";fr", regTrig=true, wordTrig=false, snippetType="autosnippet", dscr="\\frac{}{}", priority=2000},
        fmta(
            "<>\\frac{<>}{<>}",
            {
                f( function(_, snip) return snip.captures[1] end ),
                i(1),
                i(2)
            }
        ),
        { condition = tex.in_mathzone }
    ),
    s({trig=";sq", regTrig=true, wordTrig=false, snippetType="autosnippet", dscr="\\sqrt{}", priority=2000},
        fmta(
            "<>\\sqrt{<>}",
            {
                f( function(_, snip) return snip.captures[1] end ),
                d(1, get_visual)
            }
        ),
        { condition = tex.in_mathzone }
    ),
    s({trig=";wh", regTrig=true, wordTrig=false, snippetType="autosnippet", dscr="\\widehat{}", priority=2000},
        fmta(
            "<>\\widehat{<>}",
            {
                f( function(_, snip) return snip.captures[1] end ),
                d(1, get_visual)
            }
        ),
        { condition = tex.in_mathzone }
    ),
    s({trig=";wt", regTrig=true, wordTrig=false, snippetType="autosnippet", dscr="\\widetilde{}", priority=2000},
        fmta(
            "<>\\widetilde{<>}",
            {
                f( function(_, snip) return snip.captures[1] end ),
                d(1, get_visual)
            }
        ),
        { condition = tex.in_mathzone }
    ),
    s({trig=";ol", regTrig=true, wordTrig=false, snippetType="autosnippet", dscr="\\overline{}", priority=2000},
        fmta(
            "<>\\overline{<>}",
            {
                f( function(_, snip) return snip.captures[1] end ),
                d(1, get_visual)
            }
        ),
        { condition = tex.in_mathzone }
    ),
    s({trig=";sb", regTrig=true, wordTrig=false, snippetType="autosnippet", dscr="Command for subscript", priority=2000},
        fmta(
            "<>_{<>}",
            {
                f( function(_, snip) return snip.captures[1] end ),
                d(1, get_visual)
            }
        ),
        { condition = tex.in_mathzone }
    ),
    s({trig=";sp", regTrig=true, wordTrig=false, snippetType="autosnippet", dscr="Command for superscript", priority=2000},
        fmta(
            "<>^{<>}",
            {
                f( function(_, snip) return snip.captures[1] end ),
                d(1, get_visual)
            }
        ),
        { condition = tex.in_mathzone }
    ),
    s({trig=";zo", regTrig=true, wordTrig=false, snippetType="autosnippet", priority=2000},
        t("\\{0,1\\}"),
        {condition = tex.in_mathzone}
    ),
}
