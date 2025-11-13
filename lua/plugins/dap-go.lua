return {
  {
	"leoluz/nvim-dap-go",
  config = function() 
	local dap = require("dap-go")
	
	dap_configurations = {
	  {
		type = "go",
		name = "Attach remote",
		mode = "remote",
	  	request = "attach",
	   },
	 }
	end
  }
}
