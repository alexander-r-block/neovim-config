local helpers = require("ablock.lsnip-helpers")
local get_visual = helpers.get_visual
local tex = helpers.tex_utils


return {
    -- non-math parentesis
    s({trig="([%A])%(", regTrig=true, wordTrig=false, snippetType="autosnippet"},
        fmta("<>(<>)",
            {
                f( function(_, snip) return snip.captures[1] end ),
                d(1, get_visual)
            }
        ),
        { condition = tex.in_text }
    ),
    s({trig="([%A])%[", regTrig=true, wordTrig=false, snippetType="autosnippet"},
        fmta("<>[<>]",
            {
                f( function(_, snip) return snip.captures[1] end ),
                d(1, get_visual)
            }
        ),
        { condition = tex.in_text }
    ),
    s({trig="([%A])%{", regTrig=true, wordTrig=false, snippetType="autosnippet"},
        fmta("<>{<>}",
            {
                f( function(_, snip) return snip.captures[1] end ),
                d(1, get_visual)
            }
        ),
        { condition = tex.in_text }
    ),
    s({trig="([\\%a])%{", regTrig=true, wordTrig=false, snippetType="autosnippet"},
        fmta("<>{<>}",
        {
            f( function(_, snip) return snip.captures[1] end ),
            d(1, get_visual)
        })
    ),

    -- references, labels, footnotes, etc.
    s({trig=";lb", snippetType="autosnippet"},
        fmta("\\label{<>}", { d(1, get_visual) })
    ),
    s({trig=";ft", snippetType="autosnippet"},
        fmta("\\footnote{<>}", { d(1, get_visual) } ),
        { condition = tex.in_text }
    ),
    s({trig=";ct", snippetType="autosnippet"},
        fmta("\\cite{<>}", { d(1, get_visual) }),
        { condition = tex.in_text }
    ),

    -- shortcuts
    s({trig=";ie", snippetType="autosnippet"},
        { t("i.e., ") },
        { condition = tex.in_text }
    ),
    s({trig=";et", snippetType="autosnippet"},
        { t("et al.") },
        { condition = tex.in_text }
    ),
    s({trig=";eg", snippetType="autosnippet"},
        { t("e.g., ") },
        { condition = tex.in_text }
    ),
    s({trig=";h1", snippetType="autosnippet"},
        fmta("\\section{<>}", { d(1, get_visual) }),
        { condition = helpers.line_begin * helpers.make_condition(tex.in_text) }
    ),
    s({trig=";h2", snippetType="autosnippet"},
        fmta("\\subsection{<>}", { d(1, get_visual) }),
        { condition = helpers.line_begin * helpers.make_condition(tex.in_text) }
    ),
    s({trig=";h3", snippetType="autosnippet"},
        fmta("\\subsubsection{<>}", { d(1, get_visual) }),
        { condition = helpers.line_begin * helpers.make_condition(tex.in_text) }
    ),
    s({trig=";h4", snippetType="autosnippet"},
        fmta("\\paragraph{<>}", { d(1, get_visual) }),
        { condition = helpers.line_begin * helpers.make_condition(tex.in_text) }
   ),
}
