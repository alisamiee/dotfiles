local opt = vim.opt
-- :help options
opt.backup = false                          -- creates a backup file
opt.writebackup = false                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited

-- opt.clipboard = "unnamedplus"            -- allows neovim to access the system clipboard
opt.cmdheight = 1                           -- neovim command line height displaying messages
opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp
opt.conceallevel = 0                        -- so that `` is visible in markdown files
opt.fileencoding = "utf-8"                  -- the encoding written to a file
opt.mouse = "a"                             -- allow the mouse to be used in neovim
opt.pumheight = 10                          -- pop up menu height
opt.showtabline = 2                         -- always show tabs
opt.smartcase = true

opt.splitbelow = true                       -- force all horizontal splits to go below current window
opt.splitright = true                       -- force all vertical splits to go to the right of current window

opt.swapfile = true                         -- creates a swap file

opt.timeoutlen = 1000                       -- time to wait for a mapped sequence to complete (in milliseconds)
opt.undofile = true                         -- enable persistent undo
opt.undodir = os.getenv("HOME") .. "/.config/nvim/undodir"
opt.updatetime = 300                        -- faster completion (4000ms default)

opt.tabstop = 4                             -- insert 4 spaces for a tab
opt.softtabstop = 4
opt.shiftwidth = 4                          -- the number of spaces inserted for each indentation
opt.expandtab = true                        -- convert tabs to spaces

opt.smartindent = true                      -- make indenting smarter again

opt.number = true                           -- set numbered lines
opt.relativenumber = true                   -- set relative numbered lines
opt.numberwidth = 4                         -- set number column width 4
opt.signcolumn = "yes:1"                    -- always show the sign column, otherwise it would shift the text each time
opt.wrap = false                            -- display lines as one long line
opt.virtualedit = "block"                   -- select spaces in visual block mode even if there are no characters

opt.scrolloff = 16
opt.sidescrolloff = 16

opt.guifont = "FiraCode Nerd Font:h12"      -- the font used in graphical neovim applications

opt.hlsearch = false                        -- highlight all matches on previous search pattern
opt.ignorecase = true                       -- ignore case in search patterns
opt.incsearch = true

opt.colorcolumn = "80"
opt.cursorline = true


vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
