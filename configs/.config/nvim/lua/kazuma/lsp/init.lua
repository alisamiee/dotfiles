local present, _ = pcall(require, "lspconfig")
if not present then
	vim.notify("lspconfig not found.")
	return
end

require("kazuma.lsp.mason")
require("kazuma.lsp.handlers").setup()
require("kazuma.lsp.null-ls")
