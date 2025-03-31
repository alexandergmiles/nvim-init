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
-- vim.opt.tabstop = 8
-- vim.opt.softtabstop = 2
-- vim.opt.shiftwidth = 2

Options = {
  opt = {
    showmode = true,
    tabstop = 8,
    softtabstop = 2,
    shiftwidth = 2,
  },
}

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
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" }
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

require("lspconfig").gopls.setup{}

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
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "go" },
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
