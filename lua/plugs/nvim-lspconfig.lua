-- Setup lspconfig.
local installer = require("nvim-lsp-installer")
local lspconfig = require("lspconfig")
local dap = require("dap")

-- Set sumneko_lua_language_server executable file
local lua_server_exe = {
  vim.fn.stdpath("data") .. "/lsp_servers/sumneko_lua/extension/server/bin/lua-language-server"
}
-- Update this path
local extension_path = vim.fn.stdpath("data") .. "/lsp_servers/codelldb/"
local codelldb_path = extension_path .. "adapter/codelldb"
local liblldb_path = extension_path .. "lldb/lib/liblldb.so"
-- Lsp installer
-- nvim-lsp-installer ui
installer.settings(
  {
    ui = {
      icons = {
        server_installed = "✓",
        server_pending = "➜",
        server_uninstalled = "✗"
      }
    }
  }
)


-- language server name's table
local servers = {
  "pyright",
  "tsserver",
  "tailwindcss",
  "sumneko_lua",
  "intelephense",
  --[[ "emmet_ls",
  "html",
  "cssls",
  "jsonls", ]]
  "clangd",
  "rus_analyzer"
}

-- auto install language server
for _, name in pairs(servers) do
  local server_is_found, server = installer.get_server(name)
  if server_is_found then
    if not server:is_installed() then
      print("Installing " .. name)
      server:install()
    end
  end
end

local function on_attach(client, bufnr)
  -- Set up buffer-local keymaps (vim.api.nvim_buf_set_keymap()), etc.
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Mappings.
  local opts = {noremap = true, silent = true}
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  buf_set_keymap("n", "gd", ":Telescope lsp_definitions<CR>", opts)
  buf_set_keymap("n", "gr", ":Telescope lsp_references<CR>", opts)
  buf_set_keymap("n", "gi", ":Telescope lsp_implementations<CR>", opts)
  buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
  buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
  buf_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
  buf_set_keymap("n", "<space>D", ":Telescope lsp_type_definitions()<CR>", opts)
  buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  buf_set_keymap("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action<CR>", opts)
  buf_set_keymap("n", "<space>di", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
  buf_set_keymap("n", "<space>dn", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
  buf_set_keymap("n", "<space>dp", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
  buf_set_keymap("n", "<space>dl", ":Telescope diagnostics<CR>", opts)
  -- buf_set_keymap("n", "<space>fb", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  buf_set_keymap("n", "<space>fb", "<cmd>Format<CR>", opts)
end

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

installer.on_server_ready(
  function(server)
    -- Specify the default options which we'll use to setup all servers
    local default_opts = {
      on_attach = on_attach,
      capabilities = capabilities
    }

    -- Now we'll create a server_opts table where we'll specify our custom LSP server configuration
    local server_opts = {
      ["sumneko_lua"] = function()
        default_opts.cmd = lua_server_exe
        default_opts.root_dir = function()
          return vim.fn.getcwd()
        end
        default_opts.workspace = {
          maxPreload = 10000,
          preloadFileSize = 10000
        }
        default_opts.settings = {
          Lua = {
            runtime = {
              version = "LuaJIT",
              path = vim.split(package.path, ";")
            },
            diagnostics = {
              globals = {"vim"}
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true)
            },
            telemetry = {
              enable = false
            }
          }
        }
        return default_opts
      end,
      ["tsserver"] = function()
        default_opts.filetypes = {
          "html",
          "javascript",
          "javascriptreact",
          "typescript",
          "typescriptreact"
        }
        default_opts.root_dir = lspconfig.util.root_pattern("package.json", "node_modules", ".git")

        return default_opts
      end,
      ["tailwindcss"] = function()
        default_opts.filetypes = {
          "html",
          "css",
          "less",
          "sass",
          "scss",
          "javascript",
          "javascriptreact",
          "vue"
        }
        default_opts.root_dir =
          lspconfig.util.root_pattern(
          "tailwind.config.js",
          "tailwind.config.ts",
          "postcss.config.js",
          "postcss.config.ts",
          "package.json",
          "node_modules",
          ".git"
        )
        default_opts.settings = {
          tailwindCSS = {
            classAttributes = {"class", "className", "classList", "ngClass"},
            lint = {
              cssConflict = "warning",
              invalidApply = "error",
              invalidConfigPath = "error",
              invalidScreen = "error",
              invalidTailwindDirective = "error",
              invalidVariant = "error",
              recommendedVariantOrder = "warning"
            },
            validate = true
          }
        }
        return default_opts
      end,
      ["pyright"] = function()
        default_opts.root_dir = lspconfig.util.root_pattern(".env", ".git")

        default_opts.settings = {
          python = {
            pythonPath = ".env/bin/python",
            analysis = {
              autoImportCompletions = true,
              autoSearchPaths = true,
              diagnosticMode = "workspace",
              useLibraryCodeForTypes = true
            }
          }
        }
      end,
      ["rus_analyzer"] = function()
        require("rust-tools").setup(
          {
            server = vim.tbl_deep_extend("force", server:get_default_options(), {}),
            dap = {
              adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path)
            }
          }
        )
        server:attach_buffers()
        require("rest-tools").start_standalone_if_required()
      end
      --["html"] = function()
      --  default_opts.filetypes = {
      --    "html"
      --  }
      --  default_opts.root_dir = function()
      --    return vim.fn.getcwd()
      --  end
      --end,
      --["cssls"] = function()
      --  default_opts.filetypes = {"css", "scss", "less", "html"}
      --  default_opts.root_dir = function()
      --    return vim.fn.getcwd()
      --  end
      --  return default_opts
      --end,
      --    ["jsonls"] = function ()
      --      default_opts.settings = {}
      --    end,
      --
      --    ["intelephense"] = function ()
      --      default_opts.settings = {}
      --    end,
    }

    -- Use the server's custom settings, if they exist, otherwise default to the default options
    local server_options = server_opts[server.name] and server_opts[server.name]() or default_opts
    server:setup(server_options)
  end
)
