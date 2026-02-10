return {
  {
	"ThePrimeagen/99",
	config = function()
	  local ninenine = require("99")
	  local cwd = vim.uv.cwd()
	  local basename = vim.fs.basename(cwd)
	  
	  ninenine.setup({
		logger = {
		  level = ninenine.DEBUG,
		  path = "/tmp/" .. basename .. ".99.debug",
		  print_on_error = true,
		},

		completion = {
		  source = "cmp",
		},
		
		md_files = {
		  "AGENT.md",
		},
	  })
	end
  },
}
