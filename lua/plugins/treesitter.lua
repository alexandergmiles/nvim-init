return {
  {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	opts = {
	  highlight = { enable = true },
	},
	indent = { enable = true },
	ensure_installed = {
	  "python",
	  "c",
	  "lua",
	  "go",
	  "vim",
	  "vimdoc",
	  "query",
	  "markdown",
	  "markdown_inline",
	  "go",
	},
  },
}
