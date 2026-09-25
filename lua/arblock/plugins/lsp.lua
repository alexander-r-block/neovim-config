return {
    "neovim/nvim-lspconfig",
    dependencies = {
        {'williamboman/mason.nvim'},
        {'williamboman/mason-lspconfig.nvim'},
    },
    config = function()
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
                'ty'
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
        local luasnip = require("luasnip")
        vim.keymap.set({"i","s"}, "<C-Tab>", function(fallback)
            if luasnip.choice_active() then
                luasnip.change_choice(1)
            else
                fallback()
            end
        end)
        vim.keymap.set({"i","s"}, "<C-S-Tab>", function(fallback)
            if luasnip.choice_active() then
                luasnip.change_choice(-1)
            else
                fallback()
            end
        end)
    end
}
