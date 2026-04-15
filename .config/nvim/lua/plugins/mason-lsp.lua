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
          "cssls",
          "cssmodules_ls",
          "html",
          "ts_ls",
          "pylsp",
          "jsonls",
          "gopls",
          "clangd",
          "rust_analyzer",
          "svelte",
          "bashls",
        },
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      local signs = {
        Error = "󰅚 ",
        Warn  = "󰀪 ",
        Hint  = "󰌶 ",
        Info  = " ",
      }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end

      vim.diagnostic.config({
        virtual_text = false,
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend(
        "force",
        capabilities,
        require("blink.cmp").get_lsp_capabilities() or {}
      )

      local on_attach = function(client, bufnr)
        -- Might add custom config
      end


      -- rust_analyzer
      vim.lsp.config("rust_analyzer", {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          ["rust-analyzer"] = {
            cargo = { allFeatures = true },
            procMacro = { enable = true },
          },
        },
      })

      -- clangd
      vim.lsp.config("clangd", {
        capabilities = capabilities,
        on_attach = function(client, bufnr)
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.documentRangeFormattingProvider = false
        end,
        cmd = {
          "clangd",
          "--completion-style=detailed",
          "--header-insertion=never",
          "--function-arg-placeholders=false",
        },
      })

      -- arduino_language_server
      vim.lsp.config("arduino_language_server", {
        capabilities = capabilities,
        on_attach = on_attach,
        cmd = {
          "arduino-language-server",
          "-cli", "arduino-cli",
          "-cli-config", os.getenv("HOME") .. "/.arduino15/arduino-cli.yaml",
          "-fqbn", "arduino:avr:uno",
          "-clangd", "clangd",
        },
        filetypes = { "arduino", "ino" },
        root_dir = require("lspconfig.util").root_pattern("sketch.yaml", ".git"),
      })

      -- Enable all configured LSPs
      vim.lsp.enable({
        "lua_ls",
        "cssls",
        "cssmodules_ls",
        "html",
        "ts_ls",
        "pylsp",
        "jsonls",
        "gopls",
        "clangd",
        "rust_analyzer",
        "svelte",
        "bashls",
        "arduino_language_server",
      })
    end,
  },
}
