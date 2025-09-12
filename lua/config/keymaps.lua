vim.keymap.set("n", "<Space>", "<Nop>", { silent = true, remap = false })
vim.g.mapleader = " "
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})

vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")
vim.keymap.set("n", "<C-w><Up> "<C-w><C-k>")
vim.keymap.set("n", "<C-w><Down>", "<C-w><C-j>")
vim.keymap.set("n", "<C-w><Left>", "<C-w><C-h>")
vim.keymap.set("n", "<C-w><Right>", "<C-w><C-l>")
vim.keymap.set("n", "<C-w><v>", "<C-w><v>")
