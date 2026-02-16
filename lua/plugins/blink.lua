return {
  {
	'saghen/blink.cmp',
	dependencies = { 'rafamadriz/friendly-snippets' },
	version = '1.*',
	opts = {
	  appearance = {
		use_nvim_cmp_as_default = true,
		nerd_font_variant = 'mono'
	  },
	  completion = {
		documentation = {
		  auto_show = true,
		},
		ghost_text = {
		  enabled = false,
		},
	  },
	  sources = {
		default = { "lazydev", "lsp", "path", "snippets", "buffer" },
	  	providers = {
		  lazydev = {
			name = "LazyDev",
			module = "lazydev.integrations.blink",
			score_offset = 100,
		  },
		},
	  },
	  fuzzy = { implementation = "prefer_rust_with_warning" }
	},
	opts_extend = { "sources.default" },
	keymap = {
	  ["<C-Enter>"] = { "select_and_accept" }, 
	}
  },
}
