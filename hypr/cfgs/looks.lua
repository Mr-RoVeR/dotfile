hl.config({
	general = {
		gaps_in = 3,
		gaps_out = 8,
		border_size = 2,
		col = {
			active_border = {
				colors = { "rgba(5FFBF1ee)", "rgba(86A8E7ee)", "rgba(E53F87ee)" },
				angle = 45,
			},
			inactive_border = "rgba(595959aa)",
		},
		resize_on_border = false,
		allow_tearing = false,
		layout = "dwindle",
	},

	decoration = {
		rounding = 10,
		rounding_power = 3,

		-- Opacity
		active_opacity = 1.0,
		inactive_opacity = 0.85,

		-- Shadow
		shadow = {
			enabled = true,
			range = 20,
			offset = { 2, 2 },
			render_power = 3,
			color = "rgba(00000088)",
		},

		-- Blur
		blur = {
			enabled = true,
			size = 4,
			passes = 2,
			ignore_opacity = false,
			new_optimizations = true,
			vibrancy = 0.1696,
		},
	},

	dwindle = {
		pseudotile = true,
		preserve_split = true,
	},

	master = {
		new_status = "slave",
	},
})
