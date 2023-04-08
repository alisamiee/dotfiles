local present, barbar = pcall(require, "barbar")
if not present then
	vim.notify("barbar not found.")
	return
end

barbar.setup({
	animation = true,
	auto_hide = false,
	tabpages = true,
	closable = true,
	clickable = true,
    focus_on_close = "left",
	-- diagnostics = {
	--     -- you can use a list
	--     { enabled = true, icon = "ﬀ" }, -- ERROR
	--     { enabled = false }, -- WARN
	--     { enabled = false }, -- INFO
	--     { enabled = true }, -- HINT
	-- },
	-- Excludes buffers from the tabline
	-- exclude_ft = {'javascript'},
	-- exclude_name = {'package.json'},

	-- Hide inactive buffers and file extensions. Other options are `alternate`, `current`, and `visible`.
	-- hide = {extensions = true, inactive = true},
	highlight_alternate = false,
	highlight_inactive_file_icons = false,
	highlight_visible = true,
    icons = {
        button = "",
        filetype = {
            enabled = true;
        },
        separator = {left = "▎", right = ""},
        pinned = {button = "車", filename = true, separator = {right = ""}},
        inactive = {button = "×", separator = {left = ""}},
    },
	maximum_padding = 5,
	minimum_padding = 1,
	maximum_length = 30,
    sidebar_filetypes = {
        NvimTree = {text = "File Explorer"},
    },
	semantic_letters = true,
	letters = "asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP",
	-- Sets the name of unnamed buffers. By default format is "[Buffer X]"
	-- where X is the buffer number. But only a static string is accepted here.
	no_name_title = "Untitled",
})

local nvim_tree_events = require("nvim-tree.events")
local bufferline_api = require("bufferline.api")

local function get_tree_size()
	return require("nvim-tree.view").View.width
end

nvim_tree_events.subscribe("TreeOpen", function()
	bufferline_api.set_offset(get_tree_size(), "File Explorer")
end)

nvim_tree_events.subscribe("Resize", function()
	bufferline_api.set_offset(get_tree_size(), "File Explorer")
end)

nvim_tree_events.subscribe("TreeClose", function()
	bufferline_api.set_offset(0)
end)
