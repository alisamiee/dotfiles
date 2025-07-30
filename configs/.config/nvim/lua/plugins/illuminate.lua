return {
	"RRethy/vim-illuminate",
	event = { "BufReadPre", "BufNewFile" },
	lazy = true,
	enabled = false,
	keys = {
		{ "<A-n>", "<cmd>lua require('illuminate').goto_next_reference(wrap)<cr>", noremap = true, desc = "Goto Next Highlighted Word" },
		{ "<A-p>", "<cmd>lua require('illuminate').goto_prev_reference(wrap)<cr>", noremap = true, desc = "Goto Previous Highlighted Word" }
	},
	opts = {
		providers = {
			"lsp",
			"treesitter",
			"regex",
		},
		delay = 100,
		filetypes_denylist = {
			"dirvish",
			"fugitive",
			"alpha",
			"Trouble",
			"TelescopePrompt",
		},
		filetypes_allowlist = {},
		-- modes_denylist = {},
		modes_allowlist = { "n" },
		providers_regex_syntax_denylist = {},
		providers_regex_syntax_allowlist = {},
		under_cursor = true,
		large_file_config = nil,
		large_file_overrides = nil,
	}
}
