vim.keymap.set("n", "<Space>", "<Nop>", { silent = true, remap = false })
vim.g.mapleader = " "

require("config.lazy")
require("config.keymaps")

require("conform")

vim.cmd("colorscheme rose-pine")

vim.opt.tabstop = 4
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

-- Line numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- LSPs
vim.lsp.enable("gopls")
vim.lsp.enable("terraform_lsp")
vim.lsp.enable("ruff")
vim.lsp.enable("biome")
