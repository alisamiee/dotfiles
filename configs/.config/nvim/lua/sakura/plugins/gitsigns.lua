return {
    "lewis6991/gitsigns.nvim",
    config = function()
        require("gitsigns").setup({
            signs = {
                add =           { text = "▎" },
                change =        { text = "▎" },
                delete =        { text = "_" },
                topdelete =     { text = "‾" },
                changedelete =  { text = "~" },
                untracked =     { text = "┆" },
            },
            on_attach = function(bufnr)
                local gs = package.loaded.gitsigns

                local function keymap(mode, l, r, opts)
                    opts = opts or {}
                    opts.buffer = bufnr
                    vim.keymap.set(mode, l, r, opts)
                end

                -- Navigation
                keymap("n", "]c", function()
                    if vim.wo.diff then
                        return "]c"
                    end
                    vim.schedule(function()
                        gs.next_hunk()
                    end)
                    return "<Ignore>"
                end, { expr = true })

                keymap("n", "[c", function()
                    if vim.wo.diff then
                        return "[c"
                    end
                    vim.schedule(function()
                        gs.prev_hunk()
                    end)
                    return "<Ignore>"
                end, { expr = true })

                -- Actions
                keymap({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>")
                keymap({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>")
                keymap("n", "<leader>hS", gs.stage_buffer)
                keymap("n", "<leader>hu", gs.undo_stage_hunk)
                keymap("n", "<leader>hR", gs.reset_buffer)
                keymap("n", "<leader>hp", gs.preview_hunk)
                keymap("n", "<leader>hb", function()
                    gs.blame_line({ full = true })
                end)
                keymap("n", "<leader>tb", gs.toggle_current_line_blame)
                keymap("n", "<leader>hd", gs.diffthis)
                keymap("n", "<leader>hD", function()
                    gs.diffthis("~")
                end)
                keymap("n", "<leader>td", gs.toggle_deleted)

                -- Text object
                keymap({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
            end,
        })
    end,
}
