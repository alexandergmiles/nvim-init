local autocmd_group = vim.api.nvim_create_augroup("Custom auto-commands", { clear = true })

vim.api.nvim_create_autocmd({ "BufWritePost" },{
  pattern = { "*.py" },
  desc = "Python auth format",
  callback = function()
	local fileName = vim.api.nvim_buf_get_name(0)
	vim.cmd(":!ruff check --fix " .. fileName)
	vim.cmd(":!ruff format " .. fileName)
  end,
  group = autocmd_group,
})
