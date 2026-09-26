return {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
        picker = {
            sources = {
                harpoon = {
                finder = function(opts, ctx)
                  local harpoon = require("harpoon"):list()
                  local files = {}
                  local cwd = vim.loop.cwd()
                  for idx, item in ipairs(harpoon.items) do
                    table.insert(files,
                      {
                        cwd = cwd,
                        text = item.value,
                        file = item.value,
                        idx = idx
                      }
                    )
                  end
                  return files
                end,
                format = "text",
                preview = "file",
                confirm = "jump",
      }
            },
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
        { "<C-e>", function() Snacks.picker.harpoon() end, desc = "Harpoon Picker" },
    },
}
