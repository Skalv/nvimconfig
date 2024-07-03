local lsp_zero = require("lsp-zero")

lsp_zero.extend_lspconfig()

lsp_zero.on_attach(function(client, bufnr)
	lsp_zero.default_keymaps({ buffer = bufnr })
end)

lsp_zero.set_sign_icons({
	error = "✘",
	warn = "▲",
	hint = "⚑",
	info = "»",
})

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "tsserver", "eslint", "html", "jsonls", "somesass_ls", "solc" },
	handlers = {
		function(server_name)
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			require("lspconfig")[server_name].setup({ capabilities = capabilities })
		end,
		lua_ls = function()
			-- (Optional) configure lua language server
			local lua_opts = lsp_zero.nvim_lua_ls()
			require("lspconfig").lua_ls.setup(lua_opts)
		end,
	},
})

local cmp = require("cmp")
local cmp_action = lsp_zero.cmp_action()

require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
	sources = {
		{ name = "path" },
		{ name = "nvim_lsp" },
		{ name = "luasnip", keyword_length = 2 },
		{ name = "buffer", keyword_length = 3 },
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		-- `Enter` key to confirm completion
		["<CR>"] = cmp.mapping.confirm({ select = true }),

		-- Ctrl+Space to trigger completion menu
		["<C-Space>"] = cmp.mapping.complete(),

		-- Navigate between snippet placeholder
		["<C-f>"] = cmp_action.luasnip_jump_forward(),
		["<C-b>"] = cmp_action.luasnip_jump_backward(),

		-- Scroll up and down in the completion documentation
		["<C-u>"] = cmp.mapping.scroll_docs(-4),
		["<C-d>"] = cmp.mapping.scroll_docs(4),
	}),
	formatting = lsp_zero.cmp_format({ details = true }),
})
