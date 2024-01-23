return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            flavour = "mocha",
            transparent_background = true,
            show_end_of_buffer = false,
            styles = {
                comments = { "italic" },
                -- conditionals = { "italic" },
                -- keywords = { "italic" },
            },
            integrations = {
                treesitter = true,
                telescope = true,
                mason = true,
                cmp = true,
                gitsigns = true,
                illuminate = true,
                indent_blankline = {
                    enabled = true,
                    colored_indent_levels = false,
                },
            },
        })

        vim.cmd.colorscheme("catppuccin")
    end,
}
