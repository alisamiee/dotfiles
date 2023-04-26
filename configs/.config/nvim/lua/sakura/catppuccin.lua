local present, catppuccin = pcall(require, "catppuccin")
if not present then
	vim.notify("catppuccin was not found.")
	return
end

catppuccin.setup({
	flavour = "mocha",
	transparent_background = true,
    show_end_of_buffer = false,
	styles = {
		comments = { "italic" },
		-- conditionals = { "italic" },
		-- keywords = { "italic" },
	},
	integrations = {
		treesitter = true,
		telescope = true,
		nvimtree = true,
		mason = true,
		cmp = true,
		gitsigns = true,
		barbar = true,
		illuminate = true,
		indent_blankline = {
			enabled = true,
			colored_indent_levels = false,
		},
	},
	-- highlight_overrides = {
	-- 	all = function(colors)
	-- 		return {
	-- 			BufferCurrentSign = { fg = colors.mauve },
	-- 			BufferInactiveSign = { fg = colors.surface0 },
	-- 			NvimTreeFolderName = { fg = colors.mauve },
	-- 			NvimTreeFolderIcon = { fg = colors.mauve },
	-- 			NvimTreeOpenedFolderName = { fg = colors.mauve },
	--                NvimTreeRootFolder = { fg = colors.rosewater, style = { "bold" } },
	-- 			-- CmpBorder = { fg = "#3e4145" },
	-- 		}
	-- 	end,
	-- },
})

vim.cmd.colorscheme("catppuccin")
