local palette = {
	-- Base Colors (High Contrast, Immersive)
	fg = "#e5e1e9",
	bg = "#141318",
	cursorln = "#2a292f",
	surface_low = "#1c1b20",
	surface_variant = "#c9c5d0",
	surface_bright = "#3a383e", -- New: Bright UI surfaces

	-- Primary & Accent (Dynamic, Vibrant)
	primary = "#c8bfff",
	accent = "#473f77",
	secondary = "#c9c3dc",
	tertiary = "#ecb8ce",
	visual = "#474459",
	highlight = "#613b4d", -- New: For brackets, popups

	-- Syntax Colors (Semantic, Distinct)
	comment = "#c9c5d0",
	keyword = "#c8bfff",
	string = "#95d5a7",
	func = "#ecb8ce",
	variable = "#e5e1e9",
	constant = "#ffb2b9",
	type = "#c9c3dc",
	operator = "#c8bfff",
	bracket = "#613b4d",

	-- Diagnostics (Clear, Visually Distinct)
	error = "#ffb4ab",
	warning = "#ffb2b9",
	info = "#c3c0ff",
	hint = "#474459",

	-- Git Integration (Semantic, Bold)
	git_add = "#95d5a7",
	git_change = "#ecb8ce",
	git_delete = "#ffb2b9",

	-- UI Elements (Polished, Immersive)
	border = "#928f99",
	selection = "#473f77",
	cursor = "#c8bfff",
	statusline = "#474459", -- New: Statusline background
	tabline = "#1c1b20", -- New: Bufferline background
	active_tab = "#c8bfff", -- New: Active tab highlight
}

return palette
