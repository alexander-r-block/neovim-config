return {
    {
        "saghen/blink.compat",
        version = "2.*",
        lazy = true,
        opts = {}
    },
    {
        "saghen/blink.cmp",
        dependencies = {
            "saghen/blink.lib",
            "micangl/cmp-vimtex",
            'L3MON4D3/LuaSnip'
        },
        build = function()
            print("hello!")
            require('blink.cmp').build():pwait()
        end,

        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            snippets = { preset = 'luasnip' },
            sources = {
                providers = {
                    vimtex = {
                        name = 'vimtex',
                        module = 'blink.compat.source',
                        --score_offset = -3,
                        opts = {}
                    }
                },
                per_filetype = {
                    tex = { 'vimtex' }
                }
            },
            keymap = {
                ['<Tab>'] = false,
                ['<S-Tab>'] = false,
                ['<C-j>'] = { 'snippet_forward', 'fallback' },
                ['<C-k>'] = { 'snippet_backward', 'fallback' },
                ['<C-Tab>'] = {},
                --    {
                --    function(cmp)
                --        local luasnip = require('luasnip')
                --        if luasnip.choice_active() then
                --            luasnip.change_choice(1)
                --        else
                --            cmp.fallback()
                --        end
                --    end
                --},
                ['<C-S-Tab>'] = {}
                --    function(cmp)
                --        local luasnip = require('luasnip')
                --        if luasnip.choice_active() then
                --            luasnip.change_choice(1)
                --        else
                --            cmp.fallback()
                --        end
                --    end
                --}
            }
        },
    }
}
--local luasnip = require('luasnip')
--local has_words_before = function()
--    unpack = unpack or table.unpack
--    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
--    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
--end
