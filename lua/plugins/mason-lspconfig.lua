return {
  {
    "mason-org/mason-lspconfig.nvim", 
	enabled = false,
    opts = {},
    dependencies = {
      { "mason-org/mason.nvim", opts = {}},
      { "neovim/nvim-lspconfig" },
    },
  },
}
