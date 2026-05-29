return {
	{
		"romus204/tree-sitter-manager.nvim",
		dependencies = {},
		config = function()
			require("tree-sitter-manager").setup({
				ensure_installed = {
					"go",
					"python",
					"rust",
					"c",
					"lua",
				},
				auto_install = true,
			})
		end,
	},
}
