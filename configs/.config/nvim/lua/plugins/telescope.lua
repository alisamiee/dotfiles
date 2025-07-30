return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>ff", ":Telescope find_files hidden=true<CR>", desc = "[Telescope] Find Files" },
      { "<leader>ft", ":Telescope live_grep<CR>",              desc = "[Telescope] Grep" },
      { "<leader>fp", ":Telescope projects<CR>",               desc = "[Telescope] Projects" },
      { "<leader>fb", ":Telescope buffers<CR>",                desc = "[Telescope] Buffers" },
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")

      telescope.setup({
        defaults = {

          prompt_prefix = "  ",
          selection_caret = "  ",
          path_display = { "smart" },
          file_ignore_patterns = { ".git/", "node_modules" },

          pickers = {
            find_files = {
              hidden = true,
            },
          },
          mappings = {
            i = {
              ["<Down>"] = actions.cycle_history_next,
              ["<Up>"] = actions.cycle_history_prev,
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
            },
          },
        },
      })
    end,
  },
  {
    "ahmedkhalf/project.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("project_nvim").setup({
        -- detection_methods = { "lsp", "pattern" },
        detection_methods = { "pattern" },
        patterns = { ".git", "Makefile", "package.json" },
      })
      require("telescope").load_extension("projects")
    end,
  },
}
