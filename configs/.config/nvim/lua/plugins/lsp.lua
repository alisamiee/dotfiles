return {
  "neovim/nvim-lspconfig",
  keys = {
    { "gD",         "<cmd>lua vim.lsp.buf.declaration()<CR>",            noremap = true, desc = "[LSP] Goto declaration" },
    { "gd",         "<cmd>lua vim.lsp.buf.definition()<CR>",             noremap = true, desc = "[LSP] Goto definition" },
    { "gh",         "<cmd>lua vim.lsp.buf.hover()<CR>",                  noremap = true, desc = "[LSP] Hover" },
    { "gI",         "<cmd>lua vim.lsp.buf.implementation()<CR>",         noremap = true, desc = "[LSP] Goto implementation" },
    { "gr",         "<cmd>lua vim.lsp.buf.references()<CR>",             noremap = true, desc = "[LSP] References" },
    { "gl",         "<cmd>lua vim.diagnostic.open_float()<CR>",          noremap = true, desc = "[LSP] Diagnostic" },
    { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>",            noremap = true, desc = "[LSP] Code actions" },
    { "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0},<cr>", noremap = true, desc = "[LSP] Goto next diagnostic" },
    { "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0},<cr>", noremap = true, desc = "[LSP] Goto previous diagnostic" },
    { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>",                 noremap = true, desc = "[LSP] Rename symbol" },
    { "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>",         noremap = true, desc = "[LSP] Signature info" },
    { "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>",          noremap = true, desc = "[LSP] Add to location list" },
  }
}
