local dap_present, dap = pcall(require, "dap")
if not dap_present then
	vim.notify("DAP not found.")
	return
end

local dapui_present, dapui = pcall(require, "dapui")
if not dapui_present then
	vim.notify("dapui not found")
	return
end

local mason_present, mason_dap = pcall(require, "mason=nvim-dap")
if mason_present then
	require("mason-nvim-dap").setup({
		ensure_installed = { "stylua", "jq" },
		handlers = {
			-- function(config)
			-- 	-- all sources with no handler get passed here
			--
			-- 	-- Keep original functionality
			-- 	require("mason-nvim-dap").default_setup(config)
			-- end,
			-- python = function(config)
			-- 	config.adapters = {
			-- 		type = "executable",
			-- 		command = "/usr/bin/python3",
			-- 		args = {
			-- 			"-m",
			-- 			"debugpy.adapter",
			-- 		},
			-- 	}
			-- 	require("mason-nvim-dap").default_setup(config) -- don't forget this!
			-- end,
		},
	})
end

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
				{ id = "scopes", size = 0.33 },
				{ id = "breakpoints", size = 0.17 },
				{ id = "stacks", size = 0.25 },
				{ id = "watches", size = 0.25 },
			},
			size = 0.33,
			position = "right",
		},
		{
			elements = {
				{ id = "repl", size = 0.45 },
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
