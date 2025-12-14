return {
	"rcarriga/nvim-notify",
	event = "VeryLazy",
	config = function()
		local notify = require("notify")
		notify.setup({
			background_colour = function()
				-- Pull the current background color from the Normal highlight group
				local normal = vim.api.nvim_get_hl(0, { name = "Normal" })
				return normal.bg and string.format("#%06x", normal.bg) or "#000000"
			end,
			stages = "fade_in_slide_out",
			timeout = 3000,
			render = "compact",
			top_down = true,
		})

		vim.notify = notify
	end,
}
