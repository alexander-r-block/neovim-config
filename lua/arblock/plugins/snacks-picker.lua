return {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
        picker = {
        },
    },
    keys = {
        { "<leader>pf", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
        { "<C-p>", function() Snacks.picker.git_files() end, desc = "Find Git Files" },
        { "<leader>ps", function() Snacks.picker.grep() end, desc = "Grep" },
        { "<leader>pb", function() Snacks.picker.buffers() end, desc = "Search Buffers" },
        { "<leader>pws", function() Snacks.picker.grep_word() end, desc = "Visual selection or word", mode = { "n", "x" } },
        { "<leader>s/", function() Snacks.picker.search_history() end, desc = "Search History"},
        { "<leader>gb", function() Snacks.picker.git_branches() end, desc = "Git Branches" },
        { "<leader>man", function() Snacks.picker.man() end, desc = "Search Man", mode = { "n" } },
        { "<leader>qf", function() Snacks.picker.qflist() end, desc = "Quickfix List", mode = { "n" } },
    },
}
