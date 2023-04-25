local present, impatient = pcall(require, "impatient")
if not present then
	vim.notify("impatient not found.")
	return
end

impatient.enable_profile()
