return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
        settings = {
            save_on_toggle = true,
        },
    },
    keys = function()
        local my_keys = {
            {"<leader>a", function() require('harpoon'):list():add() end, desc = "Harpoon Add", mode = {"n"}},
            {"<leader>r", function() require('harpoon'):list():remove() end, desc = "Harpoon Remove", mode = {"n"}},
            {"<C-S-P>", function() require('harpoon'):list():prev() end, desc = "Harpoon Previous", mode = {"n"}},
            {"<C-S-N>", function() require('harpoon'):list():next() end, desc = "Harpoon Next", mode = {"n"}},
            {"<C-S-Del>", function() require('harpoon'):list():clear() end, desc = "Harpoon Clear", mode = {"n"}},
        }

        for i = 1, 4 do
            local key = "<C-" .. i .. ">"
            table.insert(my_keys,{
                key,
                function() require('harpoon'):list():select(i) end,
                desc = "Harpoon to File " .. i,
                mode = {"n"}
            })
        end

        return my_keys

        --vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end) -- add to list
        --vim.keymap.set("n", "<leader>r", function() harpoon:list():remove() end) -- remove from list
        --vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
        --vim.keymap.set("n", "<C-1>", function() harpoon:list():select(1) end)
        --vim.keymap.set("n", "<C-2>", function() harpoon:list():select(2) end)
        --vim.keymap.set("n", "<C-3>", function() harpoon:list():select(3) end)
        --vim.keymap.set("n", "<C-4>", function() harpoon:list():select(4) end)

        --vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
        --vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
    end,
}
