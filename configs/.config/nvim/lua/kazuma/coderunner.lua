local present, code_runner = pcall(require, "code_runner")
if not present then
	vim.notify("code_runner not found.")
	return
end

code_runner.setup({
	filetype = {
		-- java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
		python = "clear && python3 -u",
		-- typescript = "deno run",
		-- rust = "cd $dir && rustc $fileName && $dir/$fileNameWithoutExt"
	},
    mode = "toggleterm",
    startinsert = true,
})
