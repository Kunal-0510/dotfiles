return {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {

        ui = {
            layout = "right",

        },

        picker = {},
        explorer = {},
    },

    keys = {
        { "<leader>fh", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
    }
}
