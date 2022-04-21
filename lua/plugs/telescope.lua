require("telescope").load_extension("project")

require("telescope").setup {
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {}
    },
    project = {
      base_dirs = {
        "~/Documents/",
        {path = "~/WorkSpace"}
      },
      hidden_files = true -- default: false
    }
  }
}

require("telescope").load_extension("media_files")
require("telescope").load_extension("ui-select")
