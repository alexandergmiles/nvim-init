return {
  { 
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
	  local tt = require("toggleterm").setup({
		direction = 'float'
	  })
	end,
  },
}
