
-- pdf viewer
-- Different view methods for linux, macos, and windows (lol)
-- This is achieved via vim.fn.has('win32') and vim.fn.has('macunix')
if(vim.fn.has('mac') > 0) then
    vim.g.vimtex_view_method = 'skim'
    --vim.g.vimtex_view_sioyek_exe = 'sioyek'
else
    vim.g.vimtex_view_method = 'sioyek'
    --if(vim.fn.executable('sioyek.AppImage') > 0) then
    --    vim.g.vimtex_view_sioyek_exe = 'sioyek.AppImage'
    --end
end
--vim.g.vimtex_general_viewer = 'evince'
--vim.keymap.set("n", "v", function()
--    vim.cmd([[
--        call SVED_Sync()
--    ]])
--end)

-- vimtex command prefix
vim.g.vimtex_mappings_prefix = "<leader>l"

-- vimtex indents
vim.g.vimtex_indent_enabled = 0
vim.g.vimtex_indent_lists = {}
vim.g.tex_indent_items = 0

-- vimtex texdoc
vim.g.vimtex_doc_handlers = { 'vimtex#doc#handlers#texdoc' }

-- vimtex complete bit; set to simple as recommended when using
-- another autocomplete tool
--vim.g.vimtex_complete_bib = { simple=1 }

vim.g.vimtex_syntax_custom_envs = {
    { name = 'algomathdisplay', math = vim.v['true']}
}

--function callback(msg)
--end
--
--vim.g.vimtex_compiler_method = 'generic'
--vim.g.vimtex_compiler_generic = {
--    command = 'flashtex build',
--    hooks = {callback}
--}

--  function! Callback(msg)
--    " Use a regex match on the compiler output to get automatic VimtexErrors
--    " functionality. The below conditional must likely be changed to be
--    " useful, of course!
--    if a:msg =~# 'error'
--      call vimtex#compiler#callback(!vimtex#qf#inquire(b:vimtex.tex))
--    endif
--  endfunction
--
--  let g:vimtex_compiler_method = 'generic'
--  let g:vimtex_compiler_generic = {
--      \ 'command' : 'make',
--      \ 'hooks': [function('Callback')],
--      \}

-- new keybindings
vim.keymap.set("n", "H", function()
    vim.cmd([[
        update
        VimtexCompileSS
    ]])
end)

vim.keymap.set("n", "D", "<plug>(vimtex-doc-package)", {noremap=false})
