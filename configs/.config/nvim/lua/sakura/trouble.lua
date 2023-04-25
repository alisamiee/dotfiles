local present, trouble = pcall(require, "trouble")
if not present then
    vim.notify("trouble not found.")
    return
end

trouble.setup({
})
