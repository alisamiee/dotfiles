local keymap = vim.keymap.set
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<nop>", opts)
vim.g.mapleader = " "

-- Netrw
keymap("n", "<leader>e", vim.cmd.Ex, { desc = "Open netrw" })

-- Delete buffer
keymap("n", "<leader>bd", ":bdelete<cr>", { desc = "Delete buffer" })

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Keep cursor in place while joining lines
keymap("n", "J", "mzJ`z", opts)

-- While scrolling up and down keep curser in the middle
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

-- While searching keep the curser in the middle
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)

-- Yank to system clipboard register
keymap({ "n", "v" }, "<leader>y", '"+y', opts)
keymap("n", "<leader>Y", '"+Y', opts)

-- Delete to void register
keymap({ "n", "v" }, "<leader>d", '"_d', opts)

-- Screw Q
keymap("n", "Q", "<nop>", opts)

-- Replace the word under the cursor in entire buffer
keymap("n", "<leader>s", ":%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>", { desc = "Replace word in buffer" })

-- Save as sudo without closing
keymap("n", "<leader>ss", ":w !sudo tee %", { desc = "Save as sudo" })

-- Move lines up and down
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- Paste text without yanking
keymap("v", "<leader>p", '"_dP', opts)

-- Stay in visual mode after indent
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Format buffer
keymap({ "n", "v" }, "<leader>fo", vim.lsp.buf.format, { desc = "Format buffer" })

-- Make a new tmux session
keymap("n", "<C-f>", ":silent !tmux neww tmux-sessionizer<CR>", opts)
