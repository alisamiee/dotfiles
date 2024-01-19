return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
        whitespace = {
            remove_blankline_trail = true,
        },
        scope = {
            enabled = true,
        },
        exclude = {
            buftypes = { "terminal", "nofile" },
            filetypes = {
                "help",
                "packer",
                "lazy"
            },
        },
    },
}
