return {
  {
	"jellydn/99",
	config = function()
	  local ninenine = require("99")
	  local cwd = vim.uv.cwd()
	  local basename = vim.fs.basename(cwd)
	  
	  ninenine.setup({
		provider = ninenine.OpenCodeProvider,
		model = "opencode/kimi-k2.5-free",

		logger = {
		  level = ninenine.DEBUG,
		  path = "/tmp/" .. basename .. ".99.debug",
		  print_on_error = true,
		},
		
		completion = {
		  source = "blink",
		},
		
		md_files = {
		  "AGENT.md",
		},
	  })
	end
  },
}
