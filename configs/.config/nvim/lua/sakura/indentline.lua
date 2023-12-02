local present, indent_blankline = pcall(require, "ibl")
if not present then
    vim.notify("indent_blankline not found.")
    return
end

indent_blankline.setup({
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
        },
    },
})
