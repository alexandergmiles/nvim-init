return {
	{
		"mason-org/mason.nvim",
		version = "v2.0.1",
		opts = {
			ensured_installed = {
				"gofumpt",
				"golangci-lint",
				"gofmt",
				"ruff",
				"stylua",
				"terraform",
				"terraform-ls",
				"tflint",
				"lua-language-server",
			},
			ui = {
				icons = {
					package_installed = "✓",
				},
			},
		},
	},
}
