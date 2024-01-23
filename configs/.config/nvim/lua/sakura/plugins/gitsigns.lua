return {
    "lewis6991/gitsigns.nvim",
    config = function()
        require("gitsigns").setup({
            signs = {
                add = { text = "▎" },
                change = { text = "▎" },
                delete = { text = "_" },
                topdelete = { text = "‾" },
                changedelete = { text = "~" },
                untracked = { text = "┆" },
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
                end, { expr = true, desc = "[Git] Goto next hunk" })

                keymap("n", "[c", function()
                    if vim.wo.diff then
                        return "[c"
                    end
                    vim.schedule(function()
                        gs.prev_hunk()
                    end)
                    return "<Ignore>"
                end, { expr = true, desc = "[Git] Goto previous hunk" })

                -- Actions
                keymap({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>", { desc = "[Git] Stage hunk" })
                keymap({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>", { desc = "[Git] Reset hunk" })
                keymap("n", "<leader>hS", gs.stage_buffer, { desc = "[Git] Stage buffer" })
                keymap("n", "<leader>hu", gs.undo_stage_hunk, { desc = "[Git] Undo stage buffer" })
                keymap("n", "<leader>hR", gs.reset_buffer, { desc = "[Git] Reset buffer" })
                keymap("n", "<leader>hp", gs.preview_hunk, { desc = "[Git] Preview hunk" })
                keymap("n", "<leader>hb", function() gs.blame_line({ full = true }) end, { desc = "[Git] Full blame" })
                -- keymap("n", "<leader>tb", gs.toggle_current_line_blame, { desc = "[Git] Toggle blame line" })
                keymap("n", "<leader>hd", gs.diffthis, { desc = "[Git] Show diff" })
                -- keymap("n", "<leader>hD", function() gs.diffthis("~") end, { desc = "[Git] Show diff ~" })
                keymap("n", "<leader>hD", gs.toggle_deleted, { desc = "[Git] Toggle deleted lines" })

                -- Text object
                keymap({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
            end,
        })
    end,
}
