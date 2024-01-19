return {
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		lazy = true,
		config = false,
		init = function()
			-- Disable automatic setup, we are doing it manually
			vim.g.lsp_zero_extend_cmp = 0
			vim.g.lsp_zero_extend_lspconfig = 0
		end,
	},
	{
		"neovim/nvim-lspconfig",
		cmd = { "LspInfo", "LspInstall", "LspStart" },
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
			{ "RRethy/vim-illuminate" },
			-- { "hrsh7th/nvim-cmp" },
			-- { "hrsh7th/cmp-nvim-lsp" },
			-- { "L3MON4D3/LuaSnip" },
		},
		config = function()
			-- This is where all the LSP shenanigans will live
			local lsp_zero = require("lsp-zero")
			lsp_zero.extend_lspconfig()

			local function lsp_keymaps(bufnr)
				local opts = { noremap = true }
				local keymap = vim.api.nvim_buf_set_keymap
				keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
				keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
				keymap(bufnr, "n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
				keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
				keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
				keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
				keymap(bufnr, "n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
				keymap(bufnr, "n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", opts)
				keymap(bufnr, "n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", opts)
				keymap(bufnr, "n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
				keymap(bufnr, "n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
				keymap(bufnr, "n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
			end

			lsp_zero.set_sign_icons({
				error = "",
				warn = "",
				hint = "󰌵",
				info = "",
			})

			lsp_zero.on_attach(function(client, bufnr)
				-- see :help lsp-zero-keybindings
				-- lsp_zero.default_keymaps({buffer = bufnr})
				lsp_keymaps(bufnr)

				require("illuminate").on_attach(client)
			end)

			require("mason-lspconfig").setup({
				ensure_installed = {},
				handlers = {
					lsp_zero.default_setup,
					lua_ls = function()
						-- (Optional) Configure lua language server for neovim
						local lua_opts = lsp_zero.nvim_lua_ls()
						require("lspconfig").lua_ls.setup(lua_opts)
					end,
				},
			})

			-- fix clangd offset encoding error
			local cmp_nvim_lsp = require("cmp_nvim_lsp")
			require("lspconfig").clangd.setup({
				on_attach = lsp_zero.on_attach,
				capabilities = cmp_nvim_lsp.default_capabilities(),
				cmd = {
					"clangd",
					"--offset-encoding=utf-16",
				},
			})
		end,
	},
}
