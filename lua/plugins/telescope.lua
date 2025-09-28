return {
  {
	"nvim-telescope/telescope.nvim", 
	tag = "0.1.6",
	dependencies = {
	  "nvim-lua/plenary.nvim"
	},
	config = function()
	  local telescope = require("telescope")

	  telescope.setup({
		pickers = {
		  find_files = {
			theme = "dropdown"
		  },
		},
		hijack_netrw = false,
	  })

	end,
  }
}
