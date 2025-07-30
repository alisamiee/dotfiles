return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup()

    vim.keymap.set("n", "<leader>mf", function() harpoon:list():add() end, { desc = "[Harpoon] Mark File" })
    vim.keymap.set("n", "<S-tab>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "[Harpoon] Menu" })

    vim.keymap.set("n", "<C-j>", function() harpoon:list():select(1) end)
    vim.keymap.set("n", "<C-k>", function() harpoon:list():select(2) end)
    vim.keymap.set("n", "<C-l>", function() harpoon:list():select(3) end)
    -- vim.keymap.set("n", "<C-h>", function() harpoon:list():select(4) end)

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set("n", "<A-,>", function() harpoon:list():prev() end)
    vim.keymap.set("n", "<A-.>", function() harpoon:list():next() end)
  end
}
