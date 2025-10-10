-- .cache/wal/colors-wal.vim

return {
	"uZer/pywal16.nvim",
	config = function()
		local pywal16_core = require("pywal16.core")
		local colors = pywal16_core.get_colors()

		-- Custom highlights for various plugins
		local function setup_custom_highlights()
			-- Basic Editor Highlights
			vim.api.nvim_set_hl(0, "Normal", { bg = colors.color0, fg = colors.foreground })
			vim.api.nvim_set_hl(0, "Cursor", { fg = colors.color0, bg = colors.cursor })
			vim.api.nvim_set_hl(0, "CursorLine", { bg = colors.color8 })
			vim.api.nvim_set_hl(0, "Visual", { bg = colors.color12 })

			-- NOTE: Handled By Pywal - only work on what it can not do
			-- -- Comment and syntax
			-- vim.api.nvim_set_hl(0, "Comment", { fg = colors.color7, italic = true })
			-- vim.api.nvim_set_hl(0, "Function", { fg = colors.color4, bold = true })
			-- vim.api.nvim_set_hl(0, "String", { fg = colors.color2 })
			-- vim.api.nvim_set_hl(0, "Constant", { fg = colors.color3 })

			-- Telescope
			vim.api.nvim_set_hl(0, "TelescopeSelection", { bg = colors.color12, fg = colors.color0, bold = true })
			vim.api.nvim_set_hl(0, "TelescopeSelectionCaret", { bg = colors.color12, fg = colors.color1 })

			-- CMP
			vim.api.nvim_set_hl(0, "Pmenu", { bg = colors.color8, fg = colors.foreground })
			vim.api.nvim_set_hl(0, "PmenuSel", { bg = colors.color12, fg = colors.color0, bold = true })
			vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = colors.color4, bold = true })
			vim.api.nvim_set_hl(0, "CmpItemMenu", { bg = colors.color8, fg = colors.color7 })

			-- Notify.nvim
			vim.api.nvim_set_hl(0, "NotifyINFOBorder", { fg = colors.color13 })
			vim.api.nvim_set_hl(0, "NotifyINFOTitle", { fg = colors.color13, bold = true })
			vim.api.nvim_set_hl(0, "NotifyINFOBody", { fg = colors.foreground })
			vim.api.nvim_set_hl(0, "NotifyWARNBorder", { fg = colors.color3 })
			vim.api.nvim_set_hl(0, "NotifyWARNTitle", { fg = colors.color3, bold = true })
			vim.api.nvim_set_hl(0, "NotifyWARNBody", { fg = colors.foreground })
			vim.api.nvim_set_hl(0, "NotifyERRORBorder", { fg = colors.color1 })
			vim.api.nvim_set_hl(0, "NotifyERRORTitle", { fg = colors.color1, bold = true })
			vim.api.nvim_set_hl(0, "NotifyERRORBody", { fg = colors.foreground })
			vim.api.nvim_set_hl(0, "NotifyDEBUGBorder", { fg = colors.color5 })
			vim.api.nvim_set_hl(0, "NotifyDEBUGTitle", { fg = colors.color5, bold = true })
			vim.api.nvim_set_hl(0, "NotifyDEBUGBody", { fg = colors.foreground })
			vim.api.nvim_set_hl(0, "NotifyTRACEBorder", { fg = colors.color6 })
			vim.api.nvim_set_hl(0, "NotifyTRACETitle", { fg = colors.color6, bold = true })
			vim.api.nvim_set_hl(0, "NotifyTRACEBody", { fg = colors.foreground })

			-- Lualine highlights using primary accent
			local lualine_theme = {
				normal = {
					a = { bg = colors.color4, fg = colors.color0, gui = "bold" },
					b = { bg = colors.color8, fg = colors.foreground },
					c = { bg = colors.background, fg = colors.foreground },
				},
				insert = {
					a = { bg = colors.color2, fg = colors.color0, gui = "bold" },
					b = { bg = colors.color8, fg = colors.foreground },
					c = { bg = colors.background, fg = colors.foreground },
				},
				visual = {
					a = { bg = colors.color12, fg = colors.color0, gui = "bold" },
					b = { bg = colors.color8, fg = colors.foreground },
					c = { bg = colors.background, fg = colors.foreground },
				},
				replace = {
					a = { bg = colors.color1, fg = colors.color0, gui = "bold" },
					b = { bg = colors.color8, fg = colors.foreground },
					c = { bg = colors.background, fg = colors.foreground },
				},
				command = {
					a = { bg = colors.color3, fg = colors.color0, gui = "bold" },
					b = { bg = colors.color8, fg = colors.foreground },
					c = { bg = colors.background, fg = colors.foreground },
				},
				inactive = {
					a = { bg = colors.background, fg = colors.color8 },
					b = { bg = colors.background, fg = colors.color8 },
					c = { bg = colors.background, fg = colors.color8 },
				},
			}

			require("lualine").setup({
				options = {
					theme = lualine_theme,
				},
			})

			-- Highlight (for search, diff, etc.)
			vim.api.nvim_set_hl(0, "Search", { bg = colors.color12, fg = colors.color0, bold = true })
			vim.api.nvim_set_hl(0, "IncSearch", { bg = colors.color12, fg = colors.color0, underline = true })
			vim.api.nvim_set_hl(0, "VisualNOS", { bg = colors.color8, fg = colors.color0 })
			vim.api.nvim_set_hl(0, "DiffAdd", { bg = colors.color10, fg = colors.color0 })
			vim.api.nvim_set_hl(0, "DiffChange", { bg = colors.color11, fg = colors.color0 })
			vim.api.nvim_set_hl(0, "DiffDelete", { bg = colors.color9, fg = colors.color0 })
			vim.api.nvim_set_hl(0, "DiffText", { bg = colors.color12, fg = colors.color0 })

			-- Remove unwanted underline in code
			vim.api.nvim_set_hl(0, "Underlined", { underline = false })
		end

		-- Apply colorscheme
		vim.cmd.colorscheme("pywal16")
		vim.defer_fn(setup_custom_highlights, 100)
	end,
}
