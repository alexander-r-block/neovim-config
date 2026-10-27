return {
    "OXY2DEV/markview.nvim",
    lazy = false,
    dependencies = {
        "saghen/blink.cmp"
    },
    config = function()
        require("markview").setup({
            preview = {
                icon_provider = "devicons",
                enable = false,
            },
            config = {
                asciidoc = {
                    enable = true
                }
            }
        })
        vim.api.nvim_set_keymap("n", "<leader>mvs", "<CMD>Markview splitToggle<CR>",
            { desc = "Toggles `splitview` for current buffer." })
        vim.api.nvim_set_keymap("n", "<leader>mvt", "<CMD>Markview toggle<CR>",
            { desc = "Toggles Markview for current buffer." })
    end
}
