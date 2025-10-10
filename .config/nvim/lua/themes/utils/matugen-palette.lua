local palette = {
	-- Base Colors (High Contrast, Immersive)
	fg = "#e9e2d4",
	bg = "#16130b",
	cursorln = "#2d2a21",
	surface_low = "#1e1b13",
	surface_variant = "#cec6b4",
	surface_bright = "#3d392f", -- New: Bright UI surfaces

	-- Primary & Accent (Dynamic, Vibrant)
	primary = "#e1c46d",
	accent = "#574500",
	secondary = "#d4c5a1",
	tertiary = "#accfaf",
	visual = "#50462a",
	highlight = "#2f4e35", -- New: For brackets, popups

	-- Syntax Colors (Semantic, Distinct)
	comment = "#cec6b4",
	keyword = "#e1c46d",
	string = "#b7d085",
	func = "#accfaf",
	variable = "#e9e2d4",
	constant = "#ffb595",
	type = "#d4c5a1",
	operator = "#e1c46d",
	bracket = "#2f4e35",

	-- Diagnostics (Clear, Visually Distinct)
	error = "#ffb4ab",
	warning = "#ffb595",
	info = "#cebdfe",
	hint = "#50462a",

	-- Git Integration (Semantic, Bold)
	git_add = "#b7d085",
	git_change = "#accfaf",
	git_delete = "#ffb595",

	-- UI Elements (Polished, Immersive)
	border = "#979080",
	selection = "#574500",
	cursor = "#e1c46d",
	statusline = "#50462a", -- New: Statusline background
	tabline = "#1e1b13", -- New: Bufferline background
	active_tab = "#e1c46d", -- New: Active tab highlight
}

return palette
