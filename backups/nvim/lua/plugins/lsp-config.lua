return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "arduino_language_server",
          "lua_ls",
          "pylsp",
          "ruff",
          "cssls",
          "cssmodules_ls",
          "html",
          "ts_ls",
          "astro",
          "tailwindcss",
          "jsonls",
          "quick_lint_js",
          -- "harper_ls",
          "ast_grep",
          "gopls",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      -- Setup each language server
      lspconfig.lua_ls.setup({})
      lspconfig.pylsp.setup({})
      lspconfig.cssls.setup({})
      lspconfig.jsonls.setup({})
      lspconfig.quick_lint_js.setup({})
      lspconfig.cssmodules_ls.setup({})
      lspconfig.html.setup({})
      lspconfig.ts_ls.setup({})
      lspconfig.ruff.setup({})

      require("lspconfig").clangd.setup({})
      lspconfig.gopls.setup({
        cmd = { "gopls" },
        filetypes = { "go", "gomod", "gowork", "gotmpl" },
        root_dir = require("lspconfig.util").root_pattern("go.work", "go.mod", ".git"),
        settings = {
          gopls = {
            analyses = {
              unusedparams = true,
              nilness = true,
              unusedwrite = true,
            },
            staticcheck = true,
          },
        },
      })

      -- lspconfig.harper_ls.setup({})
      lspconfig.rust_analyzer.setup({
        settings = {
          ["rust_analyzer"] = {
            cargo = {
              loadOutDirsFromCheck = true,
              allFeatures = true,
            },
            procMacro = {
              enable = true,
            },
          },
        },
      })
      lspconfig.ast_grep.setup({})
      lspconfig.astro.setup({})
      lspconfig.tailwindcss.setup({})

      -- Arduino LSP Config
      lspconfig.arduino_language_server.setup({
        cmd = {
          "arduino-language-server",
          "-cli",
          "arduino-cli",
          "-cli-config",
          os.getenv("HOME") .. "/.arduino15/arduino-cli.yaml",
          "-fqbn",
          "arduino:avr:uno", -- Change this to your board's fqbn
          "-clangd",
          "clangd",
        },
        filetypes = { "arduino", "ino" },
        root_dir = function(fname)
          return lspconfig.util.root_pattern("sketch.yaml", ".git")(fname) or vim.fn.getcwd()
        end,
      })
    end,
  },
}
