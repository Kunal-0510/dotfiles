-- lua/floating_terminal.lua
local M = {}

-- State to track the floating terminal
local state = {
    floating = {
        buf = nil,
        win = nil,
    },
}

-- Function to create a floating window
local function create_floating_window(buf)
    local ui = vim.api.nvim_list_uis()[1]
    local width = math.floor(ui.width * 0.8)
    local height = math.floor(ui.height * 0.8)

    local col = math.floor((ui.width - width) / 2)
    local row = math.floor((ui.height - height) / 2)

    local opts = {
        relative = "editor",
        width = width,
        height = height,
        col = col,
        row = row,
        anchor = "NW",
        style = "minimal",
        border = "rounded",
    }

    return vim.api.nvim_open_win(buf, true, opts)
end

-- Function to toggle the floating terminal
function M.toggle()
    if state.floating.win and vim.api.nvim_win_is_valid(state.floating.win) then
        vim.api.nvim_win_hide(state.floating.win)
        state.floating.win = nil
    else
        if not state.floating.buf or not vim.api.nvim_buf_is_valid(state.floating.buf) then
            state.floating.buf = vim.api.nvim_create_buf(false, true)
        end

        state.floating.win = create_floating_window(state.floating.buf)

        if vim.bo[state.floating.buf].buftype ~= "terminal" then
            vim.cmd("terminal")
        end
    end
end

-- Set up keybindings with <leader>tt
vim.keymap.set("n", "<leader>tt", M.toggle, { desc = "Toggle floating terminal" })
vim.keymap.set("t", "<leader>tt", M.toggle, { desc = "Toggle floating terminal" })
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Create user command
vim.api.nvim_create_user_command("FloatTerm", M.toggle, { desc = "Toggle floating terminal" })

return M
