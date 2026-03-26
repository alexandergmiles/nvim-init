return {
	{
		"stevearc/conform.nvim",
		config = function()
			local conform = require("conform")

			conform.setup({
				formatters_by_ft = {
					lua = { "stylua" },
					python = { "ruff" },
					go = { "gofumpt" },
					terraform = { "terraform_fmt" },
					markdown = { "mardownfmt" },
				},
				log_level = vim.log.levels.INFO,
				format_on_save = {
					timeout_ms = 500,
					lsp_format = "fallback",
				},
			})
		end,
	},
}
