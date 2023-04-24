local keymap = vim.keymap.set
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<nop>", opts)
vim.g.mapleader = " "

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Keep curser at the end of the joining line
keymap("n", "J", "mzJ`z")

-- While scrolling up and down keep curser in the middle
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")

-- While searching keep the curser in the middle
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")

-- Yank to system clipboard register
keymap({ "n", "v" }, "<leader>y", [["+y]])
keymap("n", "<leader>Y", [["+Y]])

-- Delete to void register
keymap({ "n", "v" }, "<leader>d", [["_d]])

keymap("n", "Q", "<nop>")

keymap("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Save buffer
keymap("n", "<C-s>", "<cmd>w<CR>", opts)
-- Save as sudo without closing
keymap("n", "<leader>ss", ":w !sudo tee %")

-- Move lines up and down
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv")
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv")

-- Paste text without yanking
keymap("v", "<leader>p", [["_dP]])

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- System clipboard in neovide
if vim.g.neovide then
    keymap({ "c", "t" }, "<C-S-v>", "<C-R>+", opts)
    keymap({ "n", "v" }, "<C-S-v>", '"+P', opts)
    keymap("i" , "<C-S-v>", '<ESC>"+pa', opts)
end

-- Format buffer
keymap("n", "<leader>f", vim.lsp.buf.format)

-- Plugins --

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>ft", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fp", ":Telescope projects<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)

-- Vim Fugitive
keymap("n", "<leader>gs", vim.cmd.Git)

-- Comment
keymap("n", "<C-/>", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts)
keymap("x", "<C-/>", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", opts)
keymap("n", "<C-_>", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts)
keymap("x", "<C-_>", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", opts)

-- Nvim-tree
keymap("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", opts)

-- Barber
keymap("n", "<A-,>", "<cmd>BufferPrevious<CR>", opts)
keymap("n", "<A-.>", "<cmd>BufferNext<CR>", opts)
-- Re-order to previous/next
keymap("n", "<A-<>", "<cmd>BufferMovePrevious<CR>", opts)
keymap("n", "<A->>", "<cmd>BufferMoveNext<CR>", opts)
-- Goto buffer in position...
keymap("n", "<A-1>", "<cmd>BufferGoto 1<CR>", opts)
keymap("n", "<A-2>", "<cmd>BufferGoto 2<CR>", opts)
keymap("n", "<A-3>", "<cmd>BufferGoto 3<CR>", opts)
keymap("n", "<A-4>", "<cmd>BufferGoto 4<CR>", opts)
keymap("n", "<A-5>", "<cmd>BufferGoto 5<CR>", opts)
keymap("n", "<A-6>", "<cmd>BufferGoto 6<CR>", opts)
keymap("n", "<A-7>", "<cmd>BufferGoto 7<CR>", opts)
keymap("n", "<A-8>", "<cmd>BufferGoto 8<CR>", opts)
keymap("n", "<A-9>", "<cmd>BufferGoto 9<CR>", opts)
keymap("n", "<A-0>", "<cmd>BufferLast<CR>", opts)
-- Pin/unpin buffer
keymap("n", "<A-p>", "<cmd>BufferPin<CR>", opts)
-- Close buffer
keymap("n", "<A-c>", "<cmd>BufferClose<CR>", opts)
keymap("n", "<C-q>", "<cmd>BufferClose<CR>", opts)
-- Buffer Picker
keymap("n", "<C-p>", "<cmd>BufferPick<CR>", opts)

-- DAP
keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts)
keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)

-- Python DAP
keymap("n", "<leader>dn", ":lua require('dap-python').test_method()<CR>", opts)
keymap("n", "<leader>df", ":lua require('dap-python').test_class()<CR>", opts)
keymap("v", "<leader>ds", "<ESC>:lua require('dap-python').debug_selection()<CR>", opts)

-- Code runner
keymap('n', '<leader>r', ':RunCode<CR>', { noremap = true, silent = false })
keymap('n', '<leader>rf', ':RunFile<CR>', { noremap = true, silent = false })
keymap('n', '<leader>rft', ':RunFile tab<CR>', { noremap = true, silent = false })
keymap('n', '<leader>rp', ':RunProject<CR>', { noremap = true, silent = false })
keymap('n', '<leader>rc', ':RunClose<CR>', { noremap = true, silent = false })
