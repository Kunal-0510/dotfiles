-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
vim.keymap.set("i", "jj", "<Esc>", { noremap = true, silent = true })

-- Ctrl+A: Select All
vim.keymap.set("n", "<C-a>", "ggVG", { desc = "Select all", silent = true })
vim.keymap.set("i", "<C-a>", "<Esc>ggVG", { desc = "Select all", silent = true })
vim.keymap.set("v", "<C-a>", "<Esc>ggVG", { desc = "Select all", silent = true })

-- Ctrl+Z: Undo
vim.keymap.set("n", "<C-z>", "u", { desc = "Undo", silent = true })
vim.keymap.set("i", "<C-z>", "<Esc>ui", { desc = "Undo", silent = true })
vim.keymap.set("v", "<C-z>", "<Esc>u", { desc = "Undo", silent = true })

-- Ctrl+Y: Redo
vim.keymap.set("n", "<C-y>", "<C-r>", { desc = "Redo", silent = true })
vim.keymap.set("i", "<C-y>", "<Esc><C-r>i", { desc = "Redo", silent = true })
vim.keymap.set("v", "<C-y>", "<Esc><C-r>", { desc = "Redo", silent = true })

-- Ctrl+C: Copy (in visual mode)
vim.keymap.set("v", "<C-c>", '"+y', { desc = "Copy to clipboard", silent = true })

-- Ctrl+V: Paste
vim.keymap.set("n", "<C-v>", '"+p', { desc = "Paste from clipboard", silent = true })
vim.keymap.set("i", "<C-v>", "<C-r>+", { desc = "Paste from clipboard", silent = true })
vim.keymap.set("v", "<C-v>", '"+p', { desc = "Paste from clipboard", silent = true })

-- Ctrl+X: Cut (in visual mode)
vim.keymap.set("v", "<C-x>", '"+x', { desc = "Cut to clipboard", silent = true })

-- Ctrl+H: Find and Replace
vim.keymap.set("n", "<C-h>", ":%s/", { desc = "Find and replace", silent = false })
vim.keymap.set("v", "<C-h>", ":s/", { desc = "Find and replace in selection", silent = false })

-- Alt+Up/Down: Move lines up/down
vim.keymap.set("n", "<A-Up>", ":m .-2<CR>==", { desc = "Move line up", silent = true })
vim.keymap.set("n", "<A-Down>", ":m .+1<CR>==", { desc = "Move line down", silent = true })
vim.keymap.set("i", "<A-Up>", "<Esc>:m .-2<CR>==gi", { desc = "Move line up", silent = true })
vim.keymap.set("i", "<A-Down>", "<Esc>:m .+1<CR>==gi", { desc = "Move line down", silent = true })
vim.keymap.set("v", "<A-Up>", ":m '<-2<CR>gv=gv", { desc = "Move selection up", silent = true })
vim.keymap.set("v", "<A-Down>", ":m '>+1<CR>gv=gv", { desc = "Move selection down", silent = true })

-- Leader-based duplication (Space + d + direction)
vim.keymap.set("n", "<leader>du", ":t .-1<CR>", { desc = "Duplicate line up", silent = true })
vim.keymap.set("n", "<leader>dd", ":t .<CR>", { desc = "Duplicate line down", silent = true })
vim.keymap.set("i", "<leader>du", "<Esc>:t .-1<CR>gi", { desc = "Duplicate line up", silent = true })
vim.keymap.set("i", "<leader>dd", "<Esc>:t .<CR>gi", { desc = "Duplicate line down", silent = true })
vim.keymap.set("v", "<leader>du", ":t '<-1<CR>gv", { desc = "Duplicate selection up", silent = true })
vim.keymap.set("v", "<leader>dd", ":t '><CR>gv", { desc = "Duplicate selection down", silent = true })

-- Remove the default terminal mapping for Ctrl+/
vim.keymap.del("n", "<C-/>", { silent = true })
vim.keymap.del("t", "<C-/>", { silent = true })

-- Map terminal to Ctrl+` (backtick) instead
vim.keymap.set("n", "<C-`>", function()
    require("lazyvim.util").terminal()
end, { desc = "Terminal", silent = true })

-- Ctrl+/ for commenting
vim.keymap.set("n", "<C-/>", "gcc", { desc = "Toggle comment", remap = true })
vim.keymap.set("i", "<C-/>", "<Esc>gcca", { desc = "Toggle comment", remap = true })
vim.keymap.set("v", "<C-/>", "gc", { desc = "Toggle comment", remap = true })

-- Ctrl+Shift+/ for adding comment above
vim.keymap.set("n", "<C-c-/>", "gcO", { desc = "Add comment above", remap = true })
vim.keymap.set("i", "<C-c-/>", "<Esc>gcOa", { desc = "Add comment above", remap = true })

vim.keymap.set("n", "<C-x-/>", "gco", { desc = "Add comment above", remap = true })
vim.keymap.set("i", "<C-x-/>", "<Esc>gcoa", { desc = "Add comment above", remap = true })

-- Tab for indenting in visual mode
vim.keymap.set("v", "<Tab>", ">gv", { desc = "Indent selection", silent = true })
vim.keymap.set("v", "<S-Tab>", "<gv", { desc = "Unindent selection", silent = true })
