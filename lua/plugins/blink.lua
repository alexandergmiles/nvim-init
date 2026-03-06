return {
	{
		"saghen/blink.cmp",
		dependencies = { "rafamadriz/friendly-snippets" },
		version = "1.*",
		opts = {
			appearance = {
				---use_nvim_cmp_as_default = true,
				nerd_font_variant = "mono",
			},
			completion = {
				menu = {
					draw = {
						padding = { 0, 1 },
						components = {
							kind_icon = {
								text = function(ctx)
									return " " .. ctx.kind_icon .. ctx.icon_gap .. " "
								end,
							},
						},
						columns = {
							{ "label", "label_description", gap = 1 },
							{ "kind_icon", "kind" },
						},
					},
				},
				list = {
					selection = {
						preselect = true,
						auto_insert = true,
					},
				},
				trigger = {
					show_on_keyword = true,
				},
				documentation = {
					auto_show = true,
				},
				ghost_text = {
					enabled = true,
					auto_insert = false,
				},
			},
			sources = {
				--- , "snippets" "path", "buffer"
				default = { "lsp" },
				providers = {
					lsp = {
						name = "lsp",
						module = "blink.cmp.sources.lsp",
					},
				},
			},
			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
		opts_extend = { "sources.default" },
		keymap = {
			["<C-Enter>"] = { "select_and_accept" },
		},
	},
}
