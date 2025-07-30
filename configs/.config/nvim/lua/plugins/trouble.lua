return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {},
  cmd = "Trouble",
  keys = {
    {
      "<leader>tw",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "[Trouble] Diagnostics",
    },
    {
      "<leader>tb",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "[Trouble] Buffer diagnostics",
    },
    {
      "<leader>ts",
      "<cmd>Trouble symbols toggle focus=false<cr>",
      desc = "[Trouble] Symbols",
    },
    {
      "<leader>tq",
      "<cmd>Trouble qflist toggle<cr>",
      desc = "[Trouble] Quickfix",
    },
    {
      "<leader>tl",
      "<cmd>Trouble loclist toggle<cr>",
      desc = "[Trouble] Location list",
    },
    {
      "<leader>tr",
      "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
      desc = "[Trouble] References",
    },
  },
}
