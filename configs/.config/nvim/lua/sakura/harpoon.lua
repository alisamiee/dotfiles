local present, harpoon = pcall(require, "harpoon")
if not present then
    vim.notify("harpoon not found.")
    return
end

harpoon.setup({
    settings = {
        -- any time the ui menu is closed then we will save the state back to the backing list, not to the fs
        save_on_toggle = false,
        -- any time the ui menu is closed then the state of the list will be sync'd back to the fs
        sync_on_ui_close = false,
        -- how the out list key is looked up.
        -- this can be useful when using worktrees and using git remote instead of file path 
        key = function()
            return vim.loop.cwd()
        end,
    }
})
