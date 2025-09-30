return {
	-- Bufferline for buffer tabs (at top)
	{
		"akinsho/bufferline.nvim",
		version = "*",
		lazy = false, -- Add this: Load immediately
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("bufferline").setup({
				options = {
					mode = "buffers",
					numbers = "none",
					diagnostics = "nvim_lsp",
					separator_style = "thin",
					show_buffer_close_icons = true,
					show_close_icon = false,
					always_show_bufferline = true,
					offsets = {
						{ filetype = "NvimTree", text = "File Explorer", highlight = "Directory", text_align = "left" },
					},
					name_formatter = function(buf)
						return vim.fn.fnamemodify(buf.name, ":t")
					end,
				},
			})
		end,
	},
}
