-- Setup nvim-cmp.
local present, autopairs = pcall(require, "nvim-autopairs")
if not present then
    vim.notify("nvim-autopairs not found.")
	return
end

autopairs.setup({
	check_ts = true, -- treesitter integration
	disable_filetype = { "TelescopePrompt" },
	--   ts_config = {
	    -- lua = { "string", "source" }, -- it will not add a pair on that treesitter node
	--     javascript = { "string", "template_string" },
	--     java = false, -- don't check treesitter on java
	--   },

	fast_wrap = {
		map = "<M-e>",
		chars = { "{", "[", "(", '"', "'" },
		pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
		offset = 0, -- Offset from pattern match
		end_key = "$",
		keys = "qwertyuiopzxcvbnmasdfghjkl",
		check_comma = true,
		highlight = "PmenuSel",
		highlight_grey = "LineNr",
	},
})

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp_present, cmp = pcall(require, "cmp")
if cmp_present then
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({}))
end
