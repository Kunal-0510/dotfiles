-- dap_codelldb.lua
return {
    "mfussenegger/nvim-dap",
    opts = function(_, opts)
        local adapter_path = vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/adapter/codelldb"

        require("dap").adapters.codelldb = {
            type = "server",
            port = "${port}",
            executable = {
                command = adapter_path,
                args = { "--port", "${port}" },
            },
        }

        for _, lang in ipairs({ "cpp", "c" }) do
            opts.configurations = opts.configurations or {}
            opts.configurations[lang] = {
                {
                    name = "Launch",
                    request = "launch",
                    type = "codelldb",
                    program = function()
                        return vim.fn.input("Executable: ", vim.fn.getcwd() .. "/", "file")
                    end,
                    cwd = "${workspaceFolder}",
                    stopOnEntry = false,
                    args = {},
                    runInTerminal = true,
                },
            }
        end
    end,
}
