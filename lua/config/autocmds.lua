vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.go",
	callback = function()
		vim.lsp.buf.code_action({
			context = {
				only = { "source.organizeImports" },
			},
			apply = true,
		})
	end,
})

vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "*",
	callback = function()
		local linter = require("lint")
		linter.try_lint()
	end,
})
