require("autocmds")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Have tabs be two spaces wide which IMO just looks nicer
vim.opt.tabstop = 4
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

-- Line numbers
vim.wo.number = true
vim.wo.relativenumber = true

require("lazy").setup({
  "folke/which-key.nvim",
  { "folke/neoconf.nvim", cmd = "Neoconf" },
  { "folke/neodev.nvim" },
  { "nvim-telescope/telescope.nvim", tag = "0.1.6", dependencies = { "nvim-lua/plenary.nvim" }},
  { "VonHeikemen/lsp-zero.nvim", branch = "v3.x"},
  { "neovim/nvim-lspconfig"},
  { "hrsh7th/cmp-nvim-lsp"},
  { "hrsh7th/nvim-cmp"},
  { "L3MON4D3/LuaSnip" },
  { "rose-pine/neovim", name = "rose-pine" },
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  { "akinsho/toggleterm.nvim", version = "*", config = true },
})

-- Mason config
require("mason").setup {
  ui = {
    icons = {
      package_installed = "✓"
    }
  }
}

require("mason-lspconfig").setup {
}

-- Telescope stuff
local telescopeBuiltin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", telescopeBuiltin.find_files, {})

-- Lsp-zero
local lsp_zero = require("lsp-zero")

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr })
end)

local cmp = require("cmp")

cmp.setup({
  mapping = {
	["<C-Enter>"] = cmp.mapping(function(fallback)
	  if cmp.visible() then
		local entry = cmp.get_selected_entry()
		if not entry then
		  cmp.select_next_item({ behaviour = cmp.SelectBehaviour.Select })
		end
		cmp.confirm()
	  else
		fallback()
	  end
	end, {"i", "s", "c"}),
  },
})

require("lspconfig").lua_ls.setup {
  on_init = function(client)
    local path = client.workspace_folders[1].name
    if vim.loop.fs_stat(path.."/.luarc.json") or vim.loop.fs_stat(path.."/.luarc.jsonc") then
      return
    end

    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = {
	version = "LuaJIT"
      },
      workspace = {
	checkThirdParty = false,
	library = {
	  vim.env.VIMRUNTIME
	}
      }
    })
  end,
  settings = {
    Lua = {}
  }
}

require("lspconfig").gopls.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {"gopls"},
  filetypes = {"go", "gomod"},
  settings = {
	gopls = {
	  completeUnimported = true,
	  usePlaceholders = true,
	  analyses = {
		unusedparams = true,
	  },
	},
  },
}

require("toggleterm").setup{}

-- Ctrl+[ to escape insert mode
vim.keymap.set("i", "<C-[>", "<Esc>")

-- Space as our leader
vim.keymap.set("n", "<Space>", "<Nop>", { silent = true, remap = false })
vim.g.mapleader = " "

-- Colour scheme
require("rose-pine").setup({
  enable = {
    terminal = true
  }
})
vim.cmd("colorscheme rose-pine")

-- Telescope jazz
require("telescope").setup({
  pickers = {
    find_files = {
      theme = "dropdown"
    },
  }
})

-- Treesitter lets gooo
require("nvim-treesitter.configs").setup {
  ensure_installed = { "python", "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "go" },
  auto_install = true,
  highlight = {
    enabled = true,
  },
  indent = {
    enabled = true,
  },
}

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

vim.wo.number = true

local job_id = 0
-- Fun new terminal
vim.keymap.set("n", "<space>st", function()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 15)
  job_id = vim.bo.channel
end)

vim.keymap.set("n", "<space>build", function()
  vim.fn.chansend(job_id, { "clear\r\n" })
end)

vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")

vim.keymap.set("n", "<C-w><Up>", "<C-w><C-k>")
vim.keymap.set("n", "<C-w><Down>", "<C-w><C-j>")
vim.keymap.set("n", "<C-w><Left>", "<C-w><C-h>")
vim.keymap.set("n", "<C-w><Right>", "<C-w><C-l>")
