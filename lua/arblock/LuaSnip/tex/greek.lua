local helpers = require('ablock.lsnip-helpers')
local tex_utils = helpers.tex_utils

return {
    -- lowercase
    s({trig=";al", snippetType="autosnippet"},
        {
            t("\\alpha"),
        },
        { condition = tex_utils.in_mathzone }
    ),
    s({trig=";be", snippetType="autosnippet"},
        {
            t("\\beta"),
        },
        { condition = tex_utils.in_mathzone }
    ),
    s({trig=";ga", snippetType="autosnippet"},
        {
            t("\\gamma"),
        },
        { condition = tex_utils.in_mathzone }
    ),
    s({trig=";de", snippetType="autosnippet"},
        {
            t("\\delta"),
        },
        { condition = tex_utils.in_mathzone }
    ),
    s({trig=";ep", snippetType="autosnippet"},
        {
            t("\\epsilon"),
        },
        { condition = tex_utils.in_mathzone }
    ),
    s({trig=";vep", snippetType="autosnippet"},
        {
            t("\\varepsilon"),
        },
        { condition = tex_utils.in_mathzone }
    ),
    s({trig=";ze", snippetType="autosnippet"},
        {
            t("\\zeta"),
        },
        { condition = tex_utils.in_mathzone }
    ),
    s({trig=";et", snippetType="autosnippet"},
        {
            t("\\eta"),
        },
        { condition = tex_utils.in_mathzone }
    ),
    s({trig=";th", snippetType="autosnippet"},
        {
            t("\\theta"),
        },
        { condition = tex_utils.in_mathzone }
    ),
    s({trig=";vth", snippetType="autosnippet"},
        {
            t("\\vartheta"),
        },
        { condition = tex_utils.in_mathzone }
    ),
    s({trig=";io", snippetType="autosnippet"},
        {
            t("\\iota"),
        },
        { condition = tex_utils.in_mathzone }
    ),
    s({trig=";ka", snippetType="autosnippet"},
        {
            t("\\kappa"),
        },
        { condition = tex_utils.in_mathzone }
    ),
    s({trig=";la", snippetType="autosnippet"},
        {
            t("\\lambda"),
        },
        { condition = tex_utils.in_mathzone }
    ),
    s({trig=";mu", snippetType="autosnippet"},
        {
            t("\\mu"),
        },
        { condition = tex_utils.in_mathzone }
    ),
    s({trig=";nu", snippetType="autosnippet"},
        {
            t("\\nu"),
        },
        { condition = tex_utils.in_mathzone }
    ),
    s({trig=";xi", snippetType="autosnippet"},
        {
            t("\\xi"),
        },
        { condition = tex_utils.in_mathzone }
    ),
    s({trig=";pi", snippetType="autosnippet"},
        {
            t("\\pi"),
        },
        { condition = tex_utils.in_mathzone }
    ),
    s({trig=";rh", snippetType="autosnippet"},
        {
            t("\\rho"),
        },
        { condition = tex_utils.in_mathzone }
    ),
    s({trig=";si", snippetType="autosnippet"},
        {
            t("\\sigma"),
        },
        { condition = tex_utils.in_mathzone }
    ),
    s({trig=";vsi", snippetType="autosnippet"},
        {
            t("\\varsigma"),
        },
        { condition = tex_utils.in_mathzone }
    ),
    s({trig=";ta", snippetType="autosnippet"},
        {
            t("\\tau"),
        },
        { condition = tex_utils.in_mathzone }
    ),
    s({trig=";up", snippetType="autosnippet"},
        {
            t("\\upsilon"),
        },
        { condition = tex_utils.in_mathzone }
    ),
    s({trig=";ph", snippetType="autosnippet"},
        {
            t("\\phi"),
        },
        { condition = tex_utils.in_mathzone }
    ),
    s({trig=";vph", snippetType="autosnippet"},
        {
            t("\\varphi"),
        },
        { condition = tex_utils.in_mathzone }
    ),
    s({trig=";ch", snippetType="autosnippet"},
        {
            t("\\chi"),
        },
        { condition = tex_utils.in_mathzone }
    ),
    s({trig=";ps", snippetType="autosnippet"},
        {
            t("\\psi"),
        },
        { condition = tex_utils.in_mathzone }
    ),
    s({trig=";om", snippetType="autosnippet"},
        {
            t("\\omega"),
        },
        { condition = tex_utils.in_mathzone }
    ),

    -- uppercase
    s({trig=";Ga", snippetType="autosnippet"},
        {
            t("\\Gamma"),
        },
        { condition = tex_utils.in_mathzone }
    ),
    s({trig=";De", snippetType="autosnippet"},
        {
            t("\\Delta"),
        },
        { condition = tex_utils.in_mathzone }
    ),
    s({trig=";Th", snippetType="autosnippet"},
        {
            t("\\Theta"),
        },
        { condition = tex_utils.in_mathzone }
    ),
    s({trig=";La", snippetType="autosnippet"},
        {
            t("\\Lambda"),
        },
        { condition = tex_utils.in_mathzone }
    ),
    s({trig=";Xi", snippetType="autosnippet"},
        {
            t("\\Xi"),
        },
        { condition = tex_utils.in_mathzone }
    ),
    s({trig=";Pi", snippetType="autosnippet"},
        {
            t("\\Pi"),
        },
        { condition = tex_utils.in_mathzone }
    ),
    s({trig=";Si", snippetType="autosnippet"},
        {
            t("\\Sigma"),
        },
        { condition = tex_utils.in_mathzone }
    ),
    s({trig=";Up", snippetType="autosnippet"},
        {
            t("\\Upsilon"),
        },
        { condition = tex_utils.in_mathzone }
    ),
    s({trig=";Ph", snippetType="autosnippet"},
        {
            t("\\Phi"),
        },
        { condition = tex_utils.in_mathzone }
    ),
    s({trig=";Ps", snippetType="autosnippet"},
        {
            t("\\Psi"),
        },
        { condition = tex_utils.in_mathzone }
    ),
    s({trig=";Om", snippetType="autosnippet"},
        {
            t("\\Omega"),
        },
        { condition = tex_utils.in_mathzone }
    ),

}
