local present, project = pcall(require, "project_nvim")
if not present then
	vim.notify("project_nvim not found.")
	return
end

project.setup({
	-- detection_methods = { "lsp", "pattern" },
	detection_methods = { "pattern" },
	patterns = { ".git", "Makefile", "package.json" },
})

local telescope_present, telescope = pcall(require, "telescope")
if telescope_present then
	telescope.load_extension("projects")
end
