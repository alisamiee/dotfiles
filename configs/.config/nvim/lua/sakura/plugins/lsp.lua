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
			-- { "RRethy/vim-illuminate" },
		},
		config = function()
			local lsp_zero = require("lsp-zero")
			lsp_zero.extend_lspconfig()

			local function lsp_keymaps(bufnr)
				local keymap = vim.api.nvim_buf_set_keymap
				keymap( bufnr, "n", "gD", ":lua vim.lsp.buf.declaration()<CR>",
					{ noremap = true, desc = "[LSP] Goto declaration" })
				keymap( bufnr, "n", "gd", ":lua vim.lsp.buf.definition()<CR>",
					{ noremap = true, desc = "[LSP] Goto definition" })
				keymap(bufnr, "n", "gh", ":lua vim.lsp.buf.hover()<CR>",
                    { noremap = true, desc = "[LSP] Hover" })
				keymap( bufnr, "n", "gI", ":lua vim.lsp.buf.implementation()<CR>",
					{ noremap = true, desc = "[LSP] Goto implementation" })
				keymap( bufnr, "n", "gr", ":lua vim.lsp.buf.references()<CR>",
					{ noremap = true, desc = "[LSP] References" })
				keymap( bufnr, "n", "gl", ":lua vim.diagnostic.open_float()<CR>",
					{ noremap = true, desc = "[LSP] Diagnostic" })
				keymap( bufnr, "n", "<leader>la", ":lua vim.lsp.buf.code_action()<cr>",
					{ noremap = true, desc = "[LSP] Code actions" })
				keymap( bufnr, "n", "<leader>lj", ":lua vim.diagnostic.goto_next({buffer=0})<cr>",
					{ noremap = true, desc = "[LSP] Goto next diagnostic" })
				keymap( bufnr, "n", "<leader>lk", ":lua vim.diagnostic.goto_prev({buffer=0})<cr>",
					{ noremap = true, desc = "[LSP] Goto previous diagnostic" })
				keymap( bufnr, "n", "<leader>lr", ":lua vim.lsp.buf.rename()<cr>",
					{ noremap = true, desc = "[LSP] Rename symbol" })
				keymap( bufnr, "n", "<leader>ls", ":lua vim.lsp.buf.signature_help()<CR>",
					{ noremap = true, desc = "[LSP] Signature info" })
				keymap( bufnr, "n", "<leader>lq", ":lua vim.diagnostic.setloclist()<CR>",
					{ noremap = true, desc = "[LSP] Add to location list" })
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

				-- require("illuminate").on_attach(client)
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
