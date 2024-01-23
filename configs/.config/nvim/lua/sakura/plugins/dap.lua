return {
    "rcarriga/nvim-dap-ui",
    dependencies = { "jay-babu/mason-nvim-dap.nvim", "mfussenegger/nvim-dap" },
    lazy = true,
    keys = {
        { "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>",          desc = "[DAP] Toggle UI" },
        { "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", desc = "[DAP] Breakpoint" },
        { "<leader>dc", "<cmd>lua require'dap'.continue()<cr>",          desc = "[DAP] Continue" },
        { "<leader>di", "<cmd>lua require'dap'.step_into()<cr>",         desc = "[DAP] Step into" },
        { "<leader>do", "<cmd>lua require'dap'.step_over()<cr>",         desc = "[DAP] Step over" },
        { "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>",          desc = "[DAP] Step out" },
        { "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>",       desc = "[DAP] Toggle REPL" },
        { "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>",          desc = "[DAP] Run Last" },
        { "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>",         desc = "[DAP] Terminate" },
    },
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")
        local mason_dap = require("mason-nvim-dap")
        mason_dap.setup({
            handlers = {},
        })

        dapui.setup({
            expand_lines = true,
            icons = { expanded = "", collapsed = "", circular = "" },
            mappings = {
                -- Use a table to apply multiple mappings
                expand = { "<CR>", "<2-LeftMouse>" },
                open = "o",
                remove = "d",
                edit = "e",
                repl = "r",
                toggle = "t",
            },
            layouts = {
                {
                    elements = {
                        { id = "scopes",      size = 0.33 },
                        { id = "breakpoints", size = 0.17 },
                        { id = "stacks",      size = 0.25 },
                        { id = "watches",     size = 0.25 },
                    },
                    size = 0.33,
                    position = "right",
                },
                {
                    elements = {
                        { id = "repl",    size = 0.45 },
                        { id = "console", size = 0.55 },
                    },
                    size = 0.27,
                    position = "bottom",
                },
            },
            floating = {
                max_height = 0.9,
                max_width = 0.5, -- Floats will be treated as percentage of your screen.
                border = vim.g.border_chars, -- Border style. Can be 'single', 'double' or 'rounded'
                mappings = {
                    close = { "q", "<Esc>" },
                },
            },
        })

        vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" })

        dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
        end

        dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close()
        end

        dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close()
        end
    end,
}
