return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		local lspconfig = require("lspconfig")
		local mason_lspconfig = require("mason-lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local opts = { buffer = ev.buf, silent = true }
				local keymap = vim.keymap

				local keybinds = {
					{ "n", "gR", "<cmd>Telescope lsp_references<CR>", "Show LSP references" },
					{ "n", "gD", vim.lsp.buf.declaration, "Go to declaration" },
					{ "n", "gd", "<cmd>Telescope lsp_definitions<CR>", "Show LSP definitions" },
					{ "n", "gi", "<cmd>Telescope lsp_implementations<CR>", "Show LSP implementations" },
					{ "n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", "Show LSP type definitions" },
					{ "n", "<leader>ca", vim.lsp.buf.code_action, "See available code actions" },
					{ "n", "<leader>rn", vim.lsp.buf.rename, "Smart rename" },
					{ "n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", "Show buffer diagnostics" },
					{ "n", "<leader>d", vim.diagnostic.open_float, "Show line diagnostics" },
					{ "n", "[d", vim.diagnostic.goto_prev, "Go to previous diagnostic" },
					{ "n", "]d", vim.diagnostic.goto_next, "Go to next diagnostic" },
					{ "n", "K", vim.lsp.buf.hover, "Show documentation for cursor" },
					{ "n", "<leader>rs", ":LspRestart<CR>", "Restart LSP" },
				}

				for _, bind in ipairs(keybinds) do
					opts.desc = bind[4]
					keymap.set(bind[1], bind[2], bind[3], opts)
				end
			end,
		})

		local capabilities = cmp_nvim_lsp.default_capabilities()

		vim.diagnostic.config({
			signs = {
				error = { text = "", texthl = "DiagnosticSignError" },
				warn = { text = "", texthl = "DiagnosticSignWarn" },
				info = { text = "", texthl = "DiagnosticSignInfo" },
				hint = { text = "", texthl = "DiagnosticSignHint" },
			},
		})

		mason_lspconfig.setup({
			function(server_name)
				lspconfig[server_name].setup({
					capabilities = capabilities,
				})
			end,
			["lua_ls"] = function()
				lspconfig["lua_ls"].setup({
					capabilities = capabilities,
					settings = {
						Lua = {
							diagnostics = { globals = { "vim" } },
							completion = { callSnippet = "Replace" },
						},
					},
				})
			end,
		})
	end,
}
