return {
    {
        "L3MON4D3/LuaSnip",
        dependencies = { "rafamadriz/friendly-snippets" },

        keys = function()
            return {}
        end,
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load({
                paths = { "~/.config/nvim/snippets" },
            })
        end,
    },
}
