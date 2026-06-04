local helpers = require('ablock.lsnip-helpers')
local get_visual = helpers.get_visual
local tex = helpers.tex_utils

return {
    s({trig="([%A])l%(", regTrig=true, wordTrig=false, snippetType="autosnippet", dscr="\\left(\\right)"},
        fmta(
            [[ <>\left( <> \right) ]],
            {
                f( function(_, snip) return snip.captures[1] end ),
                d(1, get_visual)
            }
        ),
        { condition = tex.in_mathzone }
    ),
    s({trig="([%A])l%[", regTrig=true, wordTrig=false, snippetType="autosnippet", dscr="\\left[\\right]"},
        fmta(
            [[ <>\left[ <> \right] ]],
            {
                f( function(_, snip) return snip.captures[1] end ),
                d(1, get_visual)
            }
        ),
        { condition = tex.in_mathzone }
    ),
    s({trig="([%A])l%{", regTrig=true, wordTrig=false, snippetType="autosnippet", priority=2000, dscr="\\left\\{\\right\\}"},
        fmta(
            [[ <>\left\{ <> \right\} ]],
            {
                f( function(_, snip) return snip.captures[1] end ),
                d(1, get_visual)
            }
        ),
        { condition = tex.in_mathzone }
    ),
    s({trig="([%A])b%(", regTrig=true, wordTrig=false, snippetType="autosnippet", dscr="\\big(\\big)"},
        fmta(
            [[ <>\big( <> \big) ]],
            {
                f( function(_, snip) return snip.captures[1] end ),
                d(1, get_visual)
            }
        ),
        { condition = tex.in_mathzone }
    ),
    s({trig="([%A])b%[", regTrig=true, wordTrig=false, snippetType="autosnippet", dscr="\\big[\\big]"},
        fmta(
            [[ <>\big[ <> \big] ]],
            {
                f( function(_, snip) return snip.captures[1] end ),
                d(1, get_visual)
            }
        ),
        { condition = tex.in_mathzone }
    ),
    s({trig="([%A])b%{", regTrig=true, wordTrig=false, snippetType="autosnippet", dscr="\\big\\{\\big\\}"},
        fmta(
            [[ <>\big\{ <> \big\} ]],
            {
                f( function(_, snip) return snip.captures[1] end ),
                d(1, get_visual)
            }
        ),
        { condition = tex.in_mathzone }
    ),
    s({trig="([%A])\\%{", regTrig=true, wordTrig=false, snippetType="autosnippet", priority=2000},
        fmta(
            [[ <>\{ <> \} ]],
            {
                f( function(_, snip) return snip.captures[1] end ),
                d(1, get_visual)
            }
        ),
        { condition = tex.in_mathzone }
    ),
    s({trig="``", snippetType="autosnippet"},
        fmta([[``<>'']],
            { d(1, get_visual) }
        ),
        { condition = tex.in_text }
    ),

}
