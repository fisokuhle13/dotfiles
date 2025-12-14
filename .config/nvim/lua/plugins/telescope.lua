return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.6",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("telescope").setup({
			defaults = {
				file_ignore_patterns = { "node_modules", "venv" },
			},
			pickers = {
				buffers = {
					mappings = {
						n = {
							["q"] = "close",
							["<M-d>"] = function(prompt_bufnr)
								local picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
								local selection = picker:get_selection()
								require("mini.bufremove").delete(selection.bufnr, false)
								picker:refresh()
							end,
						},
					},
				},
			},
		})
	end,
}
