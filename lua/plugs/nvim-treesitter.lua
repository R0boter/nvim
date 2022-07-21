local config = require("nvim-treesitter.configs")
config.setup {
  ensure_installed = {
    "lua",
    "vim",
    "python",
    "html",
    "javascript",
    "css",
    "json",
    "jsonc",
    "vue",
    "php",
    "markdown",
    "c",
    "cpp",
    "rust",
		"go"
  },
  sync_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm"
    }
  },
  indent = {
    enable = true
  },
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  }
}
