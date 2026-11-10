return {
	"barrett-ruth/live-server.nvim",
	cmd = { "LiveServerStart", "LiveServerStop" },
	config = function()
		require("live-server").setup({
			port = 5500,
			browser = "google-chrome-stable",
		})
	end,
}
