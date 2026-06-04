return {
    "neovim/nvim-lspconfig",
    dependencies = {
        {'williamboman/mason.nvim'},
        {'williamboman/mason-lspconfig.nvim'},
        {'hrsh7th/cmp-nvim-lsp'},
        {'hrsh7th/cmp-buffer'},
        {'hrsh7th/cmp-path'},
        {'hrsh7th/nvim-cmp'},
        {'saadparwaiz1/cmp_luasnip'},
        {'hrsh7th/cmp-nvim-lua'},
        {'rafamadriz/friendly-snippets'},
        {'j-hui/fidget.nvim'},
    },
    config = function()
        require("fidget").setup({})
        require('mason').setup({})
        require('mason-lspconfig').setup({
            ensure_installed = {
                'rust_analyzer',
                'cssls',
                'html',
                'jsonls',
                'lua_ls',
                'texlab',
                'clangd',
                'ltex_plus',
            },
        })
        vim.lsp.config("rust_analyzer",{
            settings = {
                ['rust-analyzer'] = {
                    diagnostics = {
                        enable = true,
                        disabled = {"unlinked-file"}
                    }
                }
            }
        })
        vim.lsp.config("lua_ls", {capabilities = capabilities})
        vim.lsp.config("texlab", { settings = { texlab = { rootDirectory = "." } } })
        vim.lsp.config("ltex_plus", { settings = { ltex = { language = "en-US", checkFrequency = "save" }} })
        --    handlers = {
        --        function(server_name)
        --            vim.lsp.config(server_name, {capabilities = capabilities})
        --        end,
        --        ["lua_ls"] = function()
        --            vim.lsp.config("lua_ls",{capabilities=capabilities})
        --        end,
        --        ["texlab"] = function()
        --            vim.lsp.config("texlab",{
        --                settings = {
        --                    texlab = {
        --                        rootDirectory = ".",
        --                    }
        --                }
        --            })
        --        end,
        --        --["ltex_plus"] = function()
        --        --    vim.lsp.config("ltex", {
        --        --        settings = {
        --        --            ltex = {language = "en-US"}
        --        --        }
        --        --    })
        --        --    require("ltex_extra").setup({
        --        --        path = vim.fn.stdpath("config").. "/ltex",
        --        --        load_langs = { "en-US" }
        --        --    })
        --        --end
        --    }
        --})
        local cmp = require('cmp')
        local luasnip = require('luasnip')
        local cmp_select = {behavior = cmp.SelectBehavior.Select}
        local has_words_before = function()
            unpack = unpack or table.unpack
            local line, col = unpack(vim.api.nvim_win_get_cursor(0))
            return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
        end
        cmp.setup({
            sources = {
              {name = 'path'},
              {name = 'nvim_lsp'},
              {name = 'nvim_lua'},
              {name = 'luasnip', keyword_length = 2},
              {name = 'buffer', keyword_length = 3},
            },
            mapping = cmp.mapping.preset.insert({
              ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
              ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
              ['<C-y>'] = cmp.mapping.confirm({ select = true }),
              ['<C-Space>'] = cmp.mapping.complete(),
              -- LuaSnip keybinds below to jump through text/insert nodes
              ['<C-j>'] = cmp.mapping(function(fallback)
                  if luasnip.expand_or_locally_jumpable() then
                      luasnip.expand_or_jump()
                  elseif has_words_before() then
                      cmp.complete()
                  else
                      fallback()
                  end
              end, {"i", "s"}),
              ['<C-k>'] = cmp.mapping(function (fallback)
                 if luasnip.jumpable(-1) then
                     luasnip.jump(-1)
                 else
                     fallback()
                 end
              end, {"i", "s"}),
              ['<C-Tab>'] = cmp.mapping(function (fallback)
                if luasnip.choice_active() then
                  luasnip.change_choice(1)
                else
                  fallback()
                end
              end, {"i", "s"}),
              ['<C-S-Tab>'] = cmp.mapping(function (fallback)
                if luasnip.choice_active() then
                  luasnip.change_choice(-1)
                else
                  fallback()
                end
              end, {"i", "s"}),
            }),
        })
        cmp.setup.filetype("tex", {
            sources = {
                {name = 'vimtex'},
            },
        })
    end
}
