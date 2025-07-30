return {
  "mason-org/mason-lspconfig.nvim",
  dependencies = {
    {
      "mason-org/mason.nvim",
      opts = {
        ui = {
          border = "rounded",
        },
      }
    },
    "neovim/nvim-lspconfig",
  },
  opts = {},
}
