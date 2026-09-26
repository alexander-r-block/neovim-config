return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
        settings = {
            save_on_toggle = true,
        }
    },
    keys = function()
        local harpoon = require("harpoon")
        --harpoon:setup({
        --    settings = {
        --        save_on_toggle = false,
        --        save_on_ui_close = false,
        --    },
        --})
        local keys = {
            {"<leader>a", function() harpoon:list():add() end, desc = "Harpoon add"},
            {"<leader>r", function() harpoon:list():remove() end, desc = "Harpoon remove"},
        }

        for i = 1, 4 do
            table.insert(keys, {
                "<C-" .. i .. ">",
                function()
                    harpoon:list():select(i)
                end,
                desc = "Harpoon to file " .. i,
            })
        end

        --vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end) -- add to list
        --vim.keymap.set("n", "<leader>r", function() harpoon:list():remove() end) -- remove from list
        --vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
        --vim.keymap.set("n", "<C-1>", function() harpoon:list():select(1) end)
        --vim.keymap.set("n", "<C-2>", function() harpoon:list():select(2) end)
        --vim.keymap.set("n", "<C-3>", function() harpoon:list():select(3) end)
        --vim.keymap.set("n", "<C-4>", function() harpoon:list():select(4) end)

        --vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
        --vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
        return keys
    end,
}
