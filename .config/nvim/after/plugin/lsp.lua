-- Set up keymaps when LSP attaches to buffer
local on_attach = function(_, bufnr)
	local map = function(mode, lhs, rhs, desc)
		vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, noremap = true, desc = desc })
	end

	map("n", "gd", vim.lsp.buf.definition, "Go to definition")
	map("n", "K", vim.lsp.buf.hover, "Hover info")
	map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
	map("n", "<leader>ca", vim.lsp.buf.code_action, "Code actions")
	map("n", "gr", vim.lsp.buf.references, "References")
	map("n", "[d", vim.diagnostic.goto_prev, "Previous diagnostic")
	map("n", "]d", vim.diagnostic.goto_next, "Next diagnostic")
end

-- Enable LSP servers
local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Lua
lspconfig.lua_ls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		Lua = {
			diagnostics = { globals = { "vim" } },
		},
	},
})

-- Python
lspconfig.pyright.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

