vim.g.mapleader = " "

local kmp = vim.keymap
kmp.set("n", "<leader>q", ":q<CR>", { silent = true, desc = "Quit" })
kmp.set("n", "<leader>`", ":w<CR>", { silent = true, desc = "Save file" })
kmp.set("v", "J", ":m '>+1<CR>gv=gv")
kmp.set("v", "K", ":m '<-2<CR>gv=gv")
kmp.set("n", "<C-i>", "<C-d>zz")
kmp.set("n", "<C-o>", "<C-u>zz")
kmp.set("x", "<leader>p", [["_dP]])
kmp.set({ "n", "v" }, "<leader>y", [["+y]], { silent = true, desc = "Yank selected text" })
kmp.set("n", "<leader>Y", [["+Y]], { silent = true, desc = "Yank cursor line" })
kmp.set({ "n", "v" }, "<leader>d", [["_d]], { silent = true, desc = "Delete but no clip" })
kmp.set(
	"n",
	"<leader>S",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ silent = true, desc = "Replace text" }
)

-- window management
kmp.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
kmp.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
kmp.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
kmp.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

kmp.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
kmp.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
kmp.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
kmp.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
kmp.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })
