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
                    "pylsp",
                    "jsonls",
                    "gopls",
                    "clangd",
                    "rust_analyzer",
                    "svelte",
                    "bashls",
                    "zls",
                    "vue_ls",
                    "vtsls",
                    "ts_ls",
                    "kotlin_language_server",
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
            end

            local vue_language_server_path = vim.fn.stdpath("data")
                .. "/mason/packages/vue-language-server/node_modules/@vue/language-server"

            local vue_plugin = {
                name = "@vue/typescript-plugin",
                location = vue_language_server_path,
                languages = { "vue" },
                configNamespace = "typescript",
            }

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

            vim.lsp.config("clangd", {
                capabilities = capabilities,
                cmd = {
                    "clangd",
                    "--completion-style=detailed",
                    "--header-insertion=never",
                    "--function-arg-placeholders=false",
                },
            })

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

            vim.lsp.config("zls", {
                capabilities = capabilities,
                on_attach = function(client, bufnr)
                    client.server_capabilities.documentFormattingProvider = false
                    client.server_capabilities.documentRangeFormattingProvider = false
                end,
                settings = {
                    zls = {
                        enable_build_on_save = false,
                    },
                },
            })

            vim.lsp.config("vtsls", {
                capabilities = capabilities,
                on_attach = on_attach,
                settings = {
                    vtsls = {
                        tsserver = {
                            globalPlugins = { vue_plugin },
                        },
                    },
                },
                filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
            })

            vim.lsp.config("kotlin_language_server", {
                cmd = {
                    "env",
                    "JAVA_HOME=/usr/lib/jvm/java-21-openjdk",
                    "PATH=/usr/lib/jvm/java-21-openjdk/bin:" .. vim.env.PATH,
                    vim.fn.stdpath("data") .. "/mason/bin/kotlin-language-server",
                },

                capabilities = capabilities,
                on_attach = on_attach,

                root_dir = function(bufnr, on_dir)
                    local root = vim.fs.root(bufnr, {
                        "settings.gradle.kts",
                        "settings.gradle",
                        "build.gradle.kts",
                        "build.gradle",
                        ".git",
                    })

                    if root then
                        on_dir(root)
                    end
                end,
            })

            vim.lsp.enable("kotlin_language_server")

            vim.lsp.enable({
                "lua_ls",
                "cssls",
                "cssmodules_ls",
                "html",
                "pylsp",
                "jsonls",
                "gopls",
                "clangd",
                "rust_analyzer",
                "svelte",
                "bashls",
                "arduino_language_server",
                "zls",
                "vue_ls",
                "vtsls",
                "ts_ls",
                "kotlin_language_server",
            })
        end,
    },
}
