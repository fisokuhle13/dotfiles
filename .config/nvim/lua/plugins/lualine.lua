return {
	{
		"nvim-lualine/lualine.nvim",
		lazy = false, -- Load at startup
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"lewis6991/gitsigns.nvim", -- Explicit git support
		},
		config = function()
			require("lualine").setup({
				options = {
					theme = "auto",
					globalstatus = true,
					section_separators = { left = "", right = "" },
					component_separators = { left = "", right = "" },
					disabled_filetypes = {
						statusline = { "dashboard" },
						winbar = { "dashboard" },
					},
				},
				sections = {
					lualine_a = { { "mode", icon = "" } },
					lualine_b = { "branch", "diff" },
					lualine_c = {
						{
							"filename",
							path = 1, -- show relative path
							file_status = true,
							symbols = {
								modified = "●",
								readonly = "",
								unnamed = "[No Name]",
							},
						},
					},
					lualine_x = {
						"diagnostics",
						{
							"filetype",
							colored = true,
							icon_only = false,
						},
					},
					lualine_y = { "progress" },
					lualine_z = { "location" },
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = { "filename" },
					lualine_x = { "location" },
					lualine_y = {},
					lualine_z = {},
				},
				extensions = { "fugitive" },
			})
		end,
	},
}
