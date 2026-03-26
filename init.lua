vim.keymap.set("n", "<Space>", "<Nop>", { silent = true, remap = false })
vim.g.mapleader = " "

require("config.lazy")
require("config.keymaps")
require("config.autocmds")
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
vim.lsp.enable("ruff")
vim.lsp.enable("biome")
vim.lsp.enable("lua_ls")
vim.lsp.enable("terraformls")
vim.lsp.enable("ts_ls")
