return {
    { "nvim-lua/plenary.nvim" },
    {
        "tpope/vim-fugitive",
        keys = {
            { "<leader>gs", vim.cmd.Git, desc = "[Fugitive] Git" },
        },
    },
    {
        "mbbill/undotree",
        keys = {
            { "<leader>u", vim.cmd.UndotreeToggle, desc = "[Undotree] Toggle" },
        },
    },
    { "ThePrimeagen/vim-be-good", lazy = true },
}
