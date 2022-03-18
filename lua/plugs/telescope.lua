require("telescope").load_extension("project")

require("telescope").setup {
  extensions = {
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
