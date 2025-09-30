return {
	"numToStr/Comment.nvim",
	event = "VeryLazy",
	config = function()
		require("Comment").setup()
	end,
	keys = {
		{ "gcc", mode = "n", desc = "Toggle comment (line)" },
		{ "gc", mode = { "n", "v" }, desc = "Toggle comment (visual or motion)" },
	},
}
