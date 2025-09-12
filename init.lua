vim.keymap.set("n", "<Space>", "<Nop>", { silent = true, remap = false })
vim.g.mapleader = " "

require("autocmds")
require("config.lazy")

vim.cmd("colorscheme rose-pine")

vim.opt.tabstop = 4
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

-- Line numbers
vim.wo.number = true
vim.wo.relativenumber = true
