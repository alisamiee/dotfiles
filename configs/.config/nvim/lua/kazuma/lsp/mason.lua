local servers = {
	-- "lua-language-server",
	"lua_ls",
	-- "sumneko_lua",
	"cssls",
	"html",
	"pyright",
	"bashls",
	"jsonls",
}

local mason_present, mason = pcall(require, "mason")
if not mason_present then
	vim.notify("mason not found")
	return
end

mason.setup({
	ui = {
		border = "rounded",
		width = 0.5,
		height = 0.7,
		icons = {
			package_installed = "",
			package_pending = "",
			package_uninstalled = "",
		},
	},
	-- log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
})

require("mason-lspconfig").setup({
	ensure_installed = servers,
})

local lspconfig_present, lspconfig = pcall(require, "lspconfig")
if not lspconfig_present then
	vim.notify("lspconfig not found.")
	return
end

local opts = {}

for _, server in pairs(servers) do
	opts = {
		on_attach = require("kazuma.lsp.handlers").on_attach,
		capabilities = require("kazuma.lsp.handlers").capabilities,
	}

	server = vim.split(server, "@")[1]

	local require_ok, conf_opts = pcall(require, "kazuma.lsp.settings." .. server)
	if require_ok then
		opts = vim.tbl_deep_extend("force", conf_opts, opts)
	end

	lspconfig[server].setup(opts)
end
