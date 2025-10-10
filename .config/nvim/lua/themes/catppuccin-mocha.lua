-- Catppuccin Theme
return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000, -- load before other plugins
		opts = {
			flavour = "mocha", -- latte, frappe, macchiato, mocha
			background = { light = "latte", dark = "mocha" },
			transparent_background = true, -- fully transparent
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
			integrations = {
				cmp = true,
				gitsigns = true,
				nvimtree = true,
				treesitter = true,
				bufferline = true, -- ✅ enable bufferline integration
				notify = false,
				mini = { enabled = true },
			},
		},
		config = function(_, opts)
			-- setup plugin
			require("catppuccin").setup(opts)

			-- safely apply colorscheme
			local ok, _ = pcall(vim.cmd, "colorscheme catppuccin")
			if not ok then
				vim.o.termguicolors = true
				vim.notify("Failed to load colorscheme 'catppuccin'", vim.log.levels.WARN)
			end

			-- === Custom Highlights ===
			local cp = require("catppuccin.palettes").get_palette(opts.flavour)

			-- LSP + CMP popups
			vim.api.nvim_set_hl(0, "Pmenu", { bg = cp.base, fg = cp.text })
			vim.api.nvim_set_hl(0, "PmenuSel", { bg = cp.surface1, fg = cp.text })
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = cp.base })
			vim.api.nvim_set_hl(0, "FloatBorder", { bg = cp.base, fg = cp.overlay0 })

			-- Diagnostics - squiggly underline
			vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { undercurl = true, sp = cp.red })
			vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = cp.yellow })
			vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", { undercurl = true, sp = cp.blue })
			vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", { undercurl = true, sp = cp.teal })
		end,
	},
}
