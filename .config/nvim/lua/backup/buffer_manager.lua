return {
	"j-morano/buffer_manager.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{
			"<M-b>",
			function()
				require("buffer_manager.ui").toggle_quick_menu()
			end,
			desc = "Toggle buffer manager",
		},
	},
	config = function()
		require("buffer_manager").setup({
			short_file_names = true,
			short_term_names = true,
			loop_nav = true,
			use_shortcuts = false,
			win_extra_options = { winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder" },
			borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		})

		-- Reorder lines in visual mode
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "buffer_manager",
			command = [[
        vnoremap <buffer> J :m '>+1<CR>gv=gv
        vnoremap <buffer> K :m '<-2<CR>gv=gv
      ]],

			-- Use mini.bufremove for deletion
			vim.keymap.set("n", "dd", function()
				require("mini.bufremove").delete(0, false)
			end, { buffer = true, desc = "Close Buffer (Keep Split)" }),
		})
	end,
}
