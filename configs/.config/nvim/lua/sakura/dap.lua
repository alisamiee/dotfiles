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

local pydap_present, pydap = pcall(require, "dap-python")
if not pydap_present then
	vim.notify("dap-python not found.")
	return
end

pydap.setup("~/.local/share/virtualenv/debugpy/bin/python")

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
-- local test_runners = require('dap-python').test_runners

-- `test_runners` is a table. The keys are the runner names like `unittest` or `pytest`.
-- -- The value is a function that takes three arguments:
-- -- The classname, a methodname and the opts
-- -- (The `opts` are coming passed through from either `test_method` or `test_class`)
-- -- The function must return a module name and the arguments passed to the module as list.
-- test_runners.your_runner = function(classname, methodname, opts)
--   local args = {classname, methodname}
--     return 'modulename', args
--     end

--
-- local dapbuddy_present, dapbuddy = pcall(require, "dap-buddy")
-- if not dapbuddy_present then
--     vim.notify("dap-buddy not found.")
-- end
--
--
-- dap.setup {}
