return {
	"barrett-ruth/live-server.nvim",
	cmd = { "LiveServerStart", "LiveServerStop" },
	config = function()
		require("live-server").setup({
			port = 8080,
			browser = "vivaldi-snapshot",
		})
	end,
}
