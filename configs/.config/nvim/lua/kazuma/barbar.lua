local present, bufferline = pcall(require, "bufferline")
if not present then
	vim.notify("barbar not found.")
	return
end

bufferline.setup({
	animation = true,
	auto_hide = false,
	tabpages = true,
	closable = true,
	clickable = true,
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
	icons = true,
	icon_custom_colors = false,
	-- Configure icons on the bufferline.
	icon_separator_active = "▎",
	icon_separator_inactive = "▎",
	icon_close_tab = "",
	icon_close_tab_modified = "●",
	icon_pinned = "車",
	maximum_padding = 5,
	minimum_padding = 1,
	maximum_length = 30,
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
