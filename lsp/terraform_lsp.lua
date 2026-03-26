---@type vim.lsp.Config
return {
	cmd = { "terraform-lsp" },
	filetypes = { "*.tf", "terraform", "hcl" },
	root_markers = { ".tf", ".terraform", ".git" },
}
