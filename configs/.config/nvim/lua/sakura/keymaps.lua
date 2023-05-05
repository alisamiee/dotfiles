local keymap = vim.keymap.set

--Remap space as leader key
keymap("", "<Space>", "<nop>")
vim.g.mapleader = " "

-- Netrw
keymap("n", "<leader>e", vim.cmd.Ex)

-- Delete buffer
keymap("n", "<leader>bd", "<cmd>bdelete!<cr>")

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>")
keymap("n", "<C-Down>", ":resize +2<CR>")
keymap("n", "<C-Left>", ":vertical resize -2<CR>")
keymap("n", "<C-Right>", ":vertical resize +2<CR>")

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
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")

-- Save buffer
keymap("n", "<C-s>", "<cmd>w<CR>")
-- Save as sudo without closing
keymap("n", "<leader>ss", ":w !sudo tee %")

-- Move lines up and down
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv")
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv")

-- Paste text without yanking
keymap("v", "<leader>p", [["_dP]])

-- Stay in visual mode after indent
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- System clipboard in neovide
if vim.g.neovide then
	keymap({ "c", "t" }, "<C-S-v>", "<C-R>+")
	keymap({ "n", "v" }, "<C-S-v>", '"+P')
	keymap("i", "<C-S-v>", '<ESC>"+pa')
end

-- Format buffer
keymap("n", "<leader>fb", vim.lsp.buf.format)

-- Make a new tmux session
keymap("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- -- Quickfix navigation
-- keymap("n", "<C-k>", "<cmd>cnext<CR>zz"
-- keymap("n", "<C-j>", "<cmd>cprev<CR>zz")
-- keymap("n", "<leader>k", "<cmd>lnext<CR>zz")
-- keymap("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Plugins --

-- Telescope
keymap("n", "<leader>ff", "<cmd>Telescope find_files hidden=true<CR>")
keymap("n", "<leader>ft", "<cmd>Telescope live_grep<CR>")
keymap("n", "<leader>fp", "<cmd>Telescope projects<CR>")
keymap("n", "<leader>fib", "<cmd>Telescope buffers<CR>")

-- Vim Fugitive
keymap("n", "<leader>gs", vim.cmd.Git)

-- Trouble
keymap("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>")

-- DAP
keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>")
keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>")
keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>")
keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>")
keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>")
keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>")
keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>")
keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>")
keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>")

-- Python DAP
keymap("n", "<leader>dn", ":lua require('dap-python').test_method()<CR>")
keymap("n", "<leader>df", ":lua require('dap-python').test_class()<CR>")
keymap("v", "<leader>ds", "<ESC>:lua require('dap-python').debug_selection()<CR>")

-- Undotree
keymap("n", "<leader>u", vim.cmd.UndotreeToggle)

-- Harpoon
local harpoon_present, _ = pcall(require, "harpoon")
if harpoon_present then
	local mark = require("harpoon.mark")
	local ui = require("harpoon.ui")

	keymap("n", "<leader>mf", mark.add_file)
	keymap("n", "<S-tab>", ui.toggle_quick_menu)

	keymap("n", "<A-.>", function()
		ui.nav_next()
	end)
	keymap("n", "<A-,>", function()
		ui.nav_prev()
	end)
end
