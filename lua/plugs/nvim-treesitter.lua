local config = require('nvim-treesitter.configs')
config.setup{
	ensure_installed = {"lua", "vim", "python", "html",  "javascript", "css", "json", "jsonc", "vue", "php", "markdown"},
	sync_install = false,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = true,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gnn",
			node_incremental = "grn",
			scope_incremental = "grc",
			node_decremental = "grm",
		},
	},
	indent = {
		enable = true,
	},
}

