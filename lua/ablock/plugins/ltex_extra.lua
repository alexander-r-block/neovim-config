return {
    "barreiroleo/ltex_extra.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
    branch = "dev",
    opts = {
        path = vim.fn.stdpath("config") .. "/.ltex",
        --log_level = "trace"
    }
    --config = function()
    --    require("ltex_extra").setup({
    --        path = vim.fn.stdpath("config").. "/ltex",
    --        load_langs = { "en-US" }
    --    })
    --end
}
