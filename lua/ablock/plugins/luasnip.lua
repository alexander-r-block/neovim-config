return {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    config = function()
        require("luasnip").config.set_config({
            enable_autosnippets = true,
            store_selection_keys = "<Tab>",
            update_events = 'TextChanged,TextChangedI'
        })
        require("luasnip.loaders.from_lua").lazy_load({paths = "~/.config/nvim/lua/ablock/LuaSnip/"})
    end
}
