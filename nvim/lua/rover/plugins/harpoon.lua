return {
	"ThePrimeagen/harpoon",
	event = "VeryLazy",
	config = function()
		local harpoon = require("harpoon")
		local mark = require("harpoon.mark")
		local ui = require("harpoon.ui")

		vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "Harpoon: Add file" })
		vim.keymap.set("n", "<leader>M", ui.toggle_quick_menu, { desc = "Harpoon: Toggle quick menu" })

		vim.keymap.set("n", "<leader>1", function()
			ui.nav_file(1)
		end, { desc = "Harpoon: Go to file 1" })
		vim.keymap.set("n", "<leader>2", function()
			ui.nav_file(2)
		end, { desc = "Harpoon: Go to file 2" })
		vim.keymap.set("n", "<leader>3", function()
			ui.nav_file(3)
		end, { desc = "Harpoon: Go to file 3" })
		vim.keymap.set("n", "<leader>4", function()
			ui.nav_file(4)
		end, { desc = "Harpoon: Go to file 4" })
	end,
}
