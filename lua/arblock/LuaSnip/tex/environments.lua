local helpers = require('ablock.lsnip-helpers')
local get_visual = helpers.get_visual
local tex = helpers.tex_utils

local not_in_fig = function() return not tex.in_fig() end
local not_in_tikz = function() return not tex.in_tikz() end

local rec_ls
rec_ls = function()
    return sn(
        nil,
        c(1, {
            t(""),
            sn(nil, { t({"", "\t\\item"}), i(1, " text"), d(2, rec_ls, {})  }),
        })
    )
end

local rec_desc
rec_desc = function()
    return sn(
        nil,
        c(1, {
            t(""),
            sn(nil, { t({"", "\t\\item["}), i(1, "desc"), t("] "), i(2, "text"), d(3, rec_desc, {})  }),
        })
    )
end

return {
   -- generic environment 
    s({trig=";env", snippetType="autosnippet"},
        fmta(
            [[
            \begin{<>}<>
                <>
            \end{<>}
            ]],
            { i(1), i(2), d(3, get_visual), rep(1) }
        ),
        { condition=helpers.line_begin }
    ),

    s({trig="([%W])mm", regTrig=true, wordTrig=false, snippetType="autosnippet", priority=2000},
        fmta("<>$<>$",
            {
                f( function(_, snip) return snip.captures[1] end ),
                d(1, get_visual)
            }
        ),
        { condition = tex.in_text }
    ),
    --[[s({trig="([%A][%D])mm", regTrig=true, wordTrig=false, snippetType="autosnippet"},
        fmta("$<>$",
            {
                d(1, get_visual)
            }
        ),
        { condition = tex.in_text }
    ),]]
    s({trig="all", snippetType="autosnippet"},
        fmta(
            [[
                \begin{align*}
                    <>
                \end{align*}
            ]],
            { i(0) }
        ),
        { condition = helpers.line_begin }
    ),
    s({trig="gat", snippetType="autosnippet"},
        fmta(
            [[
                \begin{gather*}
                    <>
                \end{gather*}
            ]],
            { i(0) }
        ),
        { condition = helpers.line_begin }
    ),
    s({trig="eq", snippetType="autosnippet"},
        fmta(
            [[
                \begin{equation*}
                    <>
                \end{equation*}
            ]],
            { i(0) }
        ),
        { condition = helpers.line_begin }
    ),
    s({trig="fig", snippetType="autosnippet"},
        fmta(
            [[
                \begin{figure}
                    <>
                    \caption{<>}
                    \label{fig:<>}
                \end{figure}
            ]],
            { i(1), i(2), i(3) }
        ),
        { condition = helpers.line_begin * helpers.make_condition(not_in_fig) }
    ),
    s({trig="tikz", snippetType="autosnippet"},
        fmta(
            [[
                \begin{tikzpicture}[<>]
                    <>
                \end{tikzpicture}
            ]],
            { i(1), i(2) }
        ),
        { condition = helpers.line_begin *  helpers.make_condition(not_in_tikz) }
    ),
    s({trig="itt", snippetType="autosnippet"},
        fmta(
            [[
                \begin{itemize}
                    \item<><>
                \end{itemize}
            ]],
            { i(1, " text"), d(2, rec_ls, {}) }
        ),
        { condition = helpers.line_begin }
    ),
    s({trig=";it", snippetType="autosnippet"},
        fmta(
            [[
            \item<>
            ]],
            { i(1, " text") }
        ),
        { condition = helpers.make_condition(tex.in_itemize) + helpers.make_condition(tex.in_enum) }
    ),
    s({trig=";it", snippetType="autosnippet"},
        fmta(
            [[
            \item[<>] <>
            ]],
            { i(1, "desc"), i(2, "text") }
        ),
        { condition = tex.in_dec }
    ),
    s({trig="enn", snippetType="autosnippet"},
        fmta(
            [[
                \begin{enumerate}
                    \item<><>
                \end{enumerate}
            ]],
            { i(1), d(2, rec_ls, {}) }
        ),
        { condition = helpers.line_begin }
    ),
    s({trig="dss", snippetType="autosnippet"},
        fmta(
            [[
                \begin{description}
                    \item[<>] <><>
                \end{description}
            ]],
            { i(1, "desc"), i(2, "text"), d(3, rec_desc, {}) }
        ),
        { condition = helpers.line_begin }
    ),
}
