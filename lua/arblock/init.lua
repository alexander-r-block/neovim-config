require("arblock.set")
require("arblock.remap")
require("arblock.lazy.lazy")



local augroup = vim.api.nvim_create_augroup
local arblockGroup = augroup('arblock', {})

local autocmd = vim.api.nvim_create_autocmd

autocmd('LspAttach', {
    group = arblockGroup,
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
        vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format({async=true}) end, opts)
    end
})

