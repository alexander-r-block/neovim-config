local M = {}

local ls = require("luasnip")
local sn = ls.snippet_node
local i = ls.insert_node
local d = ls.dynamic_node
local t = ls.text_node
local c = ls.choice_node

-- get_visual to put highlighted text into nodes
function M.get_visual(args, parent)
  if (#parent.snippet.env.LS_SELECT_RAW > 0) then
    return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
  else
    return sn(nil, i(1, ''))
  end
end



-- function for line_begin
M.line_begin = require("luasnip.extras.expand_conditions").line_begin

-- function to add more conditions
M.make_condition = require("luasnip.extras.conditions").make_condition

-- latex specific helpers
local tex_utils = {}

tex_utils.in_mathzone = function()  -- math context detection
  return vim.fn['vimtex#syntax#in_mathzone']() == 1
end

tex_utils.in_text = function()
  return not tex_utils.in_mathzone()
end

tex_utils.in_comment = function()  -- comment detection
  return vim.fn['vimtex#syntax#in_comment']() == 1
end

tex_utils.in_env = function(name)  -- generic environment detection
    local is_inside = vim.fn['vimtex#env#is_inside'](name)
    return (is_inside[1] > 0 and is_inside[2] > 0)
end

-- A few concrete environments---adapt as needed
tex_utils.in_itemize = function()  -- itemize environment detection
    return tex_utils.in_env('itemize')
end

tex_utils.in_enum = function()
    return tex_utils.in_env('enumerate')
end

tex_utils.in_desc = function()
    return tex_utils.in_env('description')
end

tex_utils.in_tikz = function()  -- TikZ picture environment detection
    return tex_utils.in_env('tikzpicture')
end

tex_utils.in_fig = function()
    return tex_utils.in_env('figure')
end

tex_utils.in_frame = function()
    return tex_utils.in_env('frame')
end

M.tex_utils = tex_utils

return M
