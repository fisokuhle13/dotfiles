local palette = {
	-- Base Colors (High Contrast, Immersive)
	fg = "{{colors.on_surface.default.hex}}",
	bg = "{{colors.surface.default.hex}}",
	cursorln = "{{colors.surface_container_high.default.hex}}",
	surface_low = "{{colors.surface_container_low.default.hex}}",
	surface_variant = "{{colors.on_surface_variant.default.hex}}",
	surface_bright = "{{colors.surface_bright.default.hex}}", -- New: Bright UI surfaces

	-- Primary & Accent (Dynamic, Vibrant)
	primary = "{{colors.primary.default.hex}}",
	accent = "{{colors.primary_container.default.hex}}",
	secondary = "{{colors.secondary.default.hex}}",
	tertiary = "{{colors.tertiary.default.hex}}",
	visual = "{{colors.secondary_container.default.hex}}",
	highlight = "{{colors.tertiary_container.default.hex}}", -- New: For brackets, popups

	-- Syntax Colors (Semantic, Distinct)
	comment = "{{colors.on_surface_variant.default.hex}}",
	keyword = "{{colors.primary.default.hex}}",
	string = "{{colors.green.default.hex}}",
	func = "{{colors.tertiary.default.hex}}",
	variable = "{{colors.on_surface.default.hex}}",
	constant = "{{colors.red.default.hex}}",
	type = "{{colors.secondary.default.hex}}",
	operator = "{{colors.primary.default.hex}}",
	bracket = "{{colors.tertiary_container.default.hex}}",

	-- Diagnostics (Clear, Visually Distinct)
	error = "{{colors.error.default.hex}}",
	warning = "{{colors.red.default.hex}}",
	info = "{{colors.blue.default.hex}}",
	hint = "{{colors.secondary_container.default.hex}}",

	-- Git Integration (Semantic, Bold)
	git_add = "{{colors.green.default.hex}}",
	git_change = "{{colors.tertiary.default.hex}}",
	git_delete = "{{colors.red.default.hex}}",

	-- UI Elements (Polished, Immersive)
	border = "{{colors.outline.default.hex}}",
	selection = "{{colors.primary_container.default.hex}}",
	cursor = "{{colors.primary.default.hex}}",
	statusline = "{{colors.secondary_container.default.hex}}", -- New: Statusline background
	tabline = "{{colors.surface_container_low.default.hex}}", -- New: Bufferline background
	active_tab = "{{colors.primary.default.hex}}", -- New: Active tab highlight
}

return palette
