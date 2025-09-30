-- Catppuccin Theme with Matugen Palette Integration
local status, palette = pcall(require, "themes.utils.matugen-palette")
if not status then
	vim.notify("Error loading matugen-palette: " .. palette, vim.log.levels.ERROR)
	return {}
end

return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		opts = {
			flavour = "mocha",
			background = { light = "latte", dark = "mocha" },
			transparent_background = true, -- Keep main editor transparent
			show_end_of_buffer = false,
			term_colors = false,
			dim_inactive = { enabled = false },
			no_italic = false,
			no_bold = false,
			no_underline = false,
			styles = {
				comments = { "italic" },
				conditionals = { "italic" },
				loops = {},
				functions = {},
				keywords = {},
				strings = {},
				variables = {},
				numbers = {},
				booleans = {},
				properties = {},
				types = {},
				operators = {},
			},

			-- Map matugen colors to Catppuccin's palette
			color_overrides = {
				mocha = {
					-- Base colors
					base = palette.bg,
					mantle = palette.cursorln,
					crust = palette.cursorln,

					-- Text colors
					text = palette.fg,
					subtext0 = palette.comment,
					subtext1 = palette.fg,

					-- Primary colors (where the theme shines)
					rosewater = palette.primary, -- Main highlights
					flamingo = palette.accent, -- UI accents
					pink = palette.primary, -- Alternative highlight
					mauve = palette.keyword, -- Keywords

					-- Status colors
					red = palette.error, -- Errors
					maroon = palette.error, -- Alternative error
					peach = palette.warning, -- Warnings
					orange = palette.warning, -- Alternative warning
					yellow = palette.info, -- Info
					green = palette.git_add, -- Success
					teal = palette.info, -- Alternative info
					sky = palette.info, -- Alternative info
					blue = palette.info, -- Alternative info
					lavender = palette.accent, -- UI elements

					-- Syntax colors
					sapphire = palette.type, -- Types

					-- Surface colors
					surface0 = palette.cursorln,
					surface1 = palette.comment,
					surface2 = palette.comment,

					-- Overlay colors
					overlay0 = palette.visual, -- Visual selection
					overlay1 = palette.visual, -- Secondary selection
					overlay2 = palette.comment,
				},
			},

			integrations = {
				cmp = true,
				gitsigns = true,
				nvimtree = true,
				treesitter = true,
				notify = false,
				mini = { enabled = true },
				bufferline = {
					enabled = true,
					transparent = true,
				},
			},
		},

		config = function(_, opts)
			-- setup plugin
			require("catppuccin").setup(opts)

			-- alias for LazyVim compatibility with bufferline
			local bufferline_int = require("catppuccin.groups.integrations.bufferline")
			bufferline_int.get = bufferline_int.get_theme

			-- safely apply colorscheme
			local ok, _ = pcall(vim.cmd, "colorscheme catppuccin")
			if not ok then
				vim.o.termguicolors = true
				vim.notify("Failed to load colorscheme 'catppuccin'", vim.log.levels.WARN)
			end

			-- === Custom Highlights ===
			local cp = require("catppuccin.palettes").get_palette(opts.flavour)

			-- Semantic Highlights
			vim.api.nvim_set_hl(0, "Comment", { fg = palette.comment, italic = true })
			vim.api.nvim_set_hl(0, "Keyword", { fg = palette.keyword, bold = true })
			vim.api.nvim_set_hl(0, "Function", { fg = palette.func })
			vim.api.nvim_set_hl(0, "Variable", { fg = palette.fg })
			vim.api.nvim_set_hl(0, "String", { fg = palette.string })
			vim.api.nvim_set_hl(0, "Constant", { fg = palette.constant })
			vim.api.nvim_set_hl(0, "Number", { fg = palette.number })
			vim.api.nvim_set_hl(0, "Type", { fg = palette.type })
			vim.api.nvim_set_hl(0, "Operator", { fg = palette.operator })

			-- LSP + CMP Popups
			vim.api.nvim_set_hl(0, "Pmenu", { bg = palette.hint, fg = palette.fg })
			vim.api.nvim_set_hl(0, "PmenuSel", { bg = palette.accent, fg = palette.fg, bold = true })
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = palette.bg })
			vim.api.nvim_set_hl(0, "FloatBorder", { bg = palette.bg, fg = palette.accent })

			-- Diagnostics
			vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { undercurl = true, sp = palette.error })
			vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = palette.warning })
			vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", { undercurl = true, sp = palette.info })
			vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", { undercurl = true, sp = palette.hint })

			-- Visual / Cursor
			vim.api.nvim_set_hl(0, "Visual", { bg = palette.visual })
			vim.api.nvim_set_hl(0, "CursorLine", { bg = palette.cursorln })
			vim.api.nvim_set_hl(0, "Cursor", { fg = palette.cursor })
		end,
	},
}
