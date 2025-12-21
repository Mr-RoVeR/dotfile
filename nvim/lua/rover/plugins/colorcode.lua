return {
	"brenoprata10/nvim-highlight-colors",
	config = function()
		require("nvim-highlight-colors").setup({
			render = "background",
			virtual_symobl_position = "inline",
			enable_hex = true,
			enable_rgb = true,
			enable_hsl = true,
		})
	end,
}
