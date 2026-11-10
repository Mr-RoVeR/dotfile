hl.window_rule({
	match = { class = ".*" },
	suppress_event = "maximize",
})

-- Tile Kitty terminal
hl.window_rule({
	match = { class = "^(kitty)$" },
	tile = true,
})

-- Floating audio control & network dialogs
hl.window_rule({
	match = { class = "^(org\\.pulseaudio\\.pavucontrol)$" },
	float = true,
})

hl.window_rule({
	match = { class = "^(nm-connection-editor)$" },
	float = true,
})

-- Floating Kitty btop centered with 1400x800 dimensions
hl.window_rule({
	match = { class = "^(kitty-btop)$" },
	float = true,
	size = { 1400, 800 },
	center = true,
})

-- Floating Bluetooth managers
hl.window_rule({
	match = { class = "^(blueman-manager)$" },
	float = true,
})

hl.window_rule({
	match = { class = "^(Blueman-manager)$" },
	float = true,
})
