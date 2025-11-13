-- ~/.config/nvim/lua/plugins/colorscheme.lua
return {
	{
		"slugbyte/lackluster.nvim",
		name = "lackluster",
		lazy = false,
		priority = 1000,
		config = function()
			require("lackluster").setup({
				tweak_color = {},
				tweak_background = {
					normal = "none",
					telescope = "none",
					menu = "default",
					popup = "default",
				},
				tweak_syntax = {
					comment = nil,
				},
				tweak_highlight = {
					["@comment"] = { italic = true },
					["@string"] = { italic = true },
					["@function"] = { bold = true, italic = true },
				},
				tweak_ui = {
					disable_undercurl = false,
					enable_end_of_buffer = false,
				},
				disable_plugin = {
					-- disable highlights for any plugin you don’t use
					bufferline = true,
				},
			})
			vim.cmd.colorscheme("lackluster")
		end,
	},
}
