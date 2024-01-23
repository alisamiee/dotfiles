return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {},
	keys = {
		{
			"<leader>tw",
			function()
				require("trouble").toggle("workspace_diagnostics")
			end,
			desc = "[Trouble] Workspace diagnostics",
		},
		{
			"<leader>td",
			function()
				require("trouble").toggle("document_diagnostics")
			end,
			desc = "[Trouble] Document diagnostics",
		},
		{
			"<leader>tq",
			function()
				require("trouble").toggle("quickfix")
			end,
			desc = "[Trouble] Quickfix",
		},
		{
			"<leader>tl",
			function()
				require("trouble").toggle("loclist")
			end,
			desc = "[Trouble] Location list",
		},
		{
			"<leader>tr",
			function()
				require("trouble").toggle("lsp_references")
			end,
			desc = "[Trouble] References",
		},
	},
}
