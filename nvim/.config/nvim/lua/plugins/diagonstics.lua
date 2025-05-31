return {
    "neovim/nvim-lspconfig",
    opts = {
        diagnostics = {
            virtual_text = false, -- Disable inline error text
            underline = true, -- Enable underline squiggles
            signs = true, -- Enable gutter signs
            severity_sort = true,
            update_in_insert = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
            },
        },
    },
}
