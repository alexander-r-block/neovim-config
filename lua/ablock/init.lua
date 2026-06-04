require("ablock.set")
require("ablock.remap")
require("ablock.config.lazy")
--require("ablock.luasnip")
--require("ablock.catppuccin")
--require("ablock.lualine")


local augroup = vim.api.nvim_create_augroup
local ablockGroup = augroup('ablock', {})

function R(name)
	require("plenary.reload").reload_module(name)
end

local autocmd = vim.api.nvim_create_autocmd

autocmd('LspAttach', {
    group = ablockGroup,
    callback = function(e)
        local opts = { buffer = e.buf }
        vim.diagnostic.config({jump={float=true}})
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "<leader>K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        --vim.keymap.set("n", "]d", function() vim.diagnostic.jump({count=1, float=true}) end, opts)
        --vim.keymap.set("n", "[d", function() vim.diagnostic.jump({count=-1, float=true}) end, opts)
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-S-h>", function() vim.lsp.buf.signature_help() end, opts)
    end
})
