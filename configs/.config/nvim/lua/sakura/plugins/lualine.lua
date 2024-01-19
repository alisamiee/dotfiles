return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local lualine = require("lualine")

        local hide_in_width = function()
            return vim.fn.winwidth(0) > 80
        end

        local diagnostics = {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            sections = { "error", "warn" },
            symbols = { error = " ", warn = " " },
            colored = false,
            always_visible = true,
        }

        local diff = {
            "diff",
            colored = false,
            symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
            cond = hide_in_width,
        }

        local colors = {
            base = "#1e1e2e",
            surface0 = "#313244",
            surface1 = "#45475a",
            surface2 = "#585b70",
            overlay0 = "#6c7086",
            overlay1 = "#7f849c",
            overlay2 = "#9399b2",
            text = "#cdd6f4",
            blue = "#89b4fa",
            green = "#a6e3a1",
            yellow = "#f9e2af",
            peach = "#fab387",
            maroon = "#eba0ac",
            mauve = "#cba6f7",
        }

        local neko_theme = {
            normal = {
                a = { fg = colors.base, bg = colors.mauve, gui = "bold" },
                b = { fg = colors.text, bg = colors.surface0 },
                c = { fg = colors.text, bg = "" },
            },
            insert = {
                a = { fg = colors.base, bg = colors.green, gui = "bold" },
            },
            visual = {
                a = { fg = colors.base, bg = colors.blue, gui = "bold" },
            },
            replace = {
                a = { fg = colors.base, bg = colors.maroon, gui = "bold" },
            },
            inactive = {
                a = { fg = colors.overlay0, bg = colors.base, gui = "bold" },
                b = { fg = colors.overlay0, bg = colors.base },
                c = { fg = colors.overlay0, bg = "" },
            },
        }

        lualine.setup({
            options = {
                icons_enabled = true,
                theme = neko_theme,
                component_separators = "|",
                -- component_separators = { left = "⎜", right = "⎜" },
                section_separators = { left = "", right = "" },
                -- section_separators = { left = "", right = "" },
                disabled_filetypes = { "alpha", "dashboard", "NvimTree" },
                ignore_focus = {},
                always_divide_middle = true,
                globalstatus = false,
                refresh = {
                    statusline = 1000,
                    tabline = 1000,
                    winbar = 1000,
                },
            },
            sections = {
                lualine_a = {
                    { "mode", separator = { left = "" } },
                },
                lualine_b = { "branch", diff, "filename" },
                lualine_c = {},
                lualine_x = {},
                lualine_y = { diagnostics, "progress" },
                lualine_z = {
                    { "location", separator = { right = "" } },
                },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { "filename" },
                lualine_x = { "location" },
                lualine_y = {},
                lualine_z = {},
            },
            tabline = {},
            winbar = {},
            inactive_winbar = {},
            extensions = {},
        })
    end,
}
