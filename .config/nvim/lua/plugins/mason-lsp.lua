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
					"ruff",
					"cssls",
					"pyright",
					"cssmodules_ls",
					"html",
					"ts_ls",
					"jsonls",
					"gopls",
					"clangd",
					"rust_analyzer",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("lspconfig") -- Load default configurations
			-- Define diagnostic icons (these will show in the sign column)
			local signs = {
				Error = "󰅚 ",
				Warn = "󰀪 ",
				Hint = "󰌶 ",
				Info = " ",
			}

			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
			end

			-- tweak diagnostic display behavior
			vim.diagnostic.config({
				virtual_text = false, -- disable inline messages (keep gutter clean)
				signs = true, -- ensure signs are shown
				underline = true,
				update_in_insert = false,
				severity_sort = true,
			})

			local util = require("lspconfig.util")

			local on_attach_no_format = function(client, bufnr)
				-- Disable LSP formatting
				client.server_capabilities.documentFormattingProvider = false
				client.server_capabilities.documentRangeFormattingProvider = false
				client.server_capabilities.diagnosticProvider = true
			end

			vim.lsp.config("pyright", {
				on_attach = on_attach_no_format,
				settings = {
					python = {
						analysis = {
							diagnosticMode = "off", -- disables all diagnostics
							autoImportCompletions = true, -- get those import suggestions
							typeCheckingMode = "off", -- completely disable type checking
							autoSearchPaths = true,
							useLibraryCodeForTypes = true,
						},
					},
				},
			})

			vim.lsp.config("ruff", {
				on_attach = function(client, bufnr)
					-- Disable formatting for Ruff too
					client.server_capabilities.documentFormattingProvider = false
					client.server_capabilities.documentRangeFormattingProvider = false
				end,
				init_options = {
					settings = {
						lineLength = 120,
						ignore = { "E501" },
						-- disable spell checking / notes
						select = {}, -- empty = disable all extra notes? (depends on ruff version)
						extendSelect = {},
						extendIgnore = { "NPI" },
					},
				},
			})

			vim.lsp.config("gopls", {
				cmd = { "gopls" },
				filetypes = { "go", "gomod", "gowork", "gotmpl" },
				root_dir = util.root_pattern("go.work", "go.mod", ".git"),
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

			vim.lsp.config("rust_analyzer", {
				settings = {
					["rust-analyzer"] = {
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

			vim.lsp.config("clangd", {
				cmd = {
					"clangd",
					"--completion-style=detailed", -- completions without auto-inserted snippets
					"--header-insertion=never", -- don't auto add includes
					"--function-arg-placeholders=false", -- disables auto placeholders in functions
				},
				capabilities = vim.lsp.protocol.make_client_capabilities({
					textDocument = {
						foldingRange = false, -- Disable client request for folding ranges from clangd
					},
				}),
				on_attach = function(client, bufnr)
					-- Disable formatting if using an external tool
					client.server_capabilities.documentFormattingProvider = false
					client.server_capabilities.documentRangeFormattingProvider = false
				end,
			})

			-- Arduino LSP Config
			vim.lsp.config("arduino_language_server", {
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
					return util.root_pattern("sketch.yaml", ".git")(fname) or vim.fn.getcwd()
				end,
			})
		end,
	},
}
