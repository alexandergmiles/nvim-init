-- Map the leader key to space
vim.keymap.set("n", "<Space>", "<Nop>", { silent = true, remap = false })
vim.g.mapleader = " "

-- Load up anything we need to
local builtin = require("telescope.builtin")
local dap = require("dap")
local dapui = require("dapui")
local _99 = require("99")

-- Moving through windows
vim.keymap.set("n", "<C-w><Up>", "<C-w><C-k>")
vim.keymap.set("n", "<C-w><Down>", "<C-w><C-j>")
vim.keymap.set("n", "<C-w><Left>", "<C-w><C-h>")
vim.keymap.set("n", "<C-w><Right>", "<C-w><C-l>")
vim.keymap.set("n", "<C-w><v>", "<C-w><C-v>")


-- Open UIs
vim.keymap.set("n", "<leader>fb", ":Telescope file_browser<CR>")
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>tt", ":ToggleTerm<CR>")

-- nvim-dap
vim.keymap.set("n", "<leader>dc", dap.continue, {})
vim.keymap.set("n", "<leader>du", dapui.toggle, {})
vim.keymap.set("n", "<leader>de", dapui.eval, {})

-- 99
vim.keymap.set("n", "<leader>9f", function() 
	_99.fill_in_function()
end)
vim.keymap.set("v", "<leader>9v", function()
	_99.visual()
end)
vim.keymap.set("v", "<leader>9s", function()
	_99.stop_all_requests()
end)
vim.keymap.set("n", "<leader>9fd", function()
	_99.fill_in_function()
end)
