return {
  "catppuccin/nvim",
  name = "catppuccin",
  opts = {
    flavour = "mocha",
    transparent_background = true,
    show_end_of_buffer = false,
    styles = {
      comments = { "italic" },
      -- conditionals = { "italic" },
      -- keywords = { "italic" },
    },
    auto_integrations = true,
  },
  config = function ()
    vim.cmd.colorscheme("catppuccin")
  end
}
