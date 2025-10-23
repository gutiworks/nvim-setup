-- Diagnostic configuration
vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
	float = { border = "rounded" },
})

-- Cmp
local cmp = require'cmp'

cmp.setup({
	mapping = cmp.mapping.preset.insert({
	  ['<C-b>'] = cmp.mapping.scroll_docs(-4),
	  ['<C-f>'] = cmp.mapping.scroll_docs(4),
	  ['<C-Space>'] = cmp.mapping.complete(),
	  ['<C-e>'] = cmp.mapping.abort(),
	  ['<CR>'] = cmp.mapping.confirm({ select = true }),   
	}),
	window = {
     -- documentation = cmp.config.window.bordered(), 
  	},
	sources = cmp.config.sources({
	  { name = 'nvim_lsp' },
	  { name = 'buffer' },
	})
})

-- Set up lspconfig.
vim.lsp.enable("kotlin_language_server")
vim.lsp.enable("jdtls")
