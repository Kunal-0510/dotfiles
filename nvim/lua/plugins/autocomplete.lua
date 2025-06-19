return {
    "saghen/blink.cmp",
    dependencies = "rafamadriz/friendly-snippets",
    version = "*",
    opts = {
        keymap = {
            preset = "none",
            ["<Tab>"] = { "snippet_forward", "accept", "fallback" },
            ["<S-Tab>"] = { "snippet_backward", "fallback" },
            ["<C-n>"] = { "select_next", "fallback" },
            ["<C-p>"] = { "select_prev", "fallback" },
        },
        appearance = {
            use_nvim_cmp_as_default = true,
            nerd_font_variant = "mono",
        },
        sources = {
            default = { "lsp", "path", "snippets", "buffer" },
        },
    },
    opts_extend = { "sources.default" },
}
