return {
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		tag = "v0.2.1",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			local telescope = require("telescope")

			telescope.setup({
				pickers = {
					find_files = {
						theme = "dropdown",
						hidden = true,
					},
				},
				hijack_netrw = false,
			})
		end,
	},
}
