" -------------------------------------------------------------------------

" General config

lua << EOF

-- Options :set 
vim.opt.number = true
vim.opt.splitright = true
vim.opt.splitbelow = true 
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- Command :
vim.cmd.colorscheme("habamax")

vim.api.nvim_set_hl(0, "VertSplit", { ctermfg = 8, ctermbg = "none" })
vim.api.nvim_set_hl(0, "StatusLine", { ctermfg = 8, ctermbg = "none" })
vim.api.nvim_set_hl(0, "StatusLineNC", { ctermfg = 8, ctermbg = "none" })

vim.api.nvim_set_hl(0, "Identifier",   { ctermfg = 78 }) 
-- vim.api.nvim_set_hl(0, "Structure",    { ctermfg = 11 }) 
-- vim.api.nvim_set_hl(0, "Statement",    { fg = "#c6a0f6" })
-- vim.api.nvim_set_hl(0, "Keyword",      { fg = "#c6a0f6" }) 
-- vim.api.nvim_set_hl(0, "Type",         { fg = "#ffb86c" })
-- vim.api.nvim_set_hl(0, "StorageClass", { fg = "#ff9e64" })
-- vim.api.nvim_set_hl(0, "String",       { fg = "#a9dc76" })
-- vim.api.nvim_set_hl(0, "Number",       { fg = "#ffb86c" })
-- vim.api.nvim_set_hl(0, "Special",      { fg = "#a6c1ff" })
-- vim.api.nvim_set_hl(0, "Error",        { fg = "#ff5555" })

-- Global :let
vim.g.mapleader = " "
vim.g.netrw_liststyle = 3
vim.g.netrw_winsize = 25

-- Keymap :noremap
vim.keymap.set( { "n", "v" }, "<leader>e", ":Lexplore<CR>", { noremap = true, silent = true })
vim.keymap.set( { "n", "v" }, "<leader>y", ":y+<CR>", { noremap = true, silent = true })
vim.keymap.set( "n", "<leader>b", ":bn<CR>", { noremap = true, silent = true } )
vim.keymap.set( "t", "<Esc>", "<C-\\><C-n>" )
vim.keymap.set( "n", "<leader>t", ":Telescope live_grep<CR>")
-- vim.keymap.set( { "n", "v" }, "<leader>t", ":terminal<CR>", { noremap = true, silent = true })
-- vim.keymap.set( "n", "<leader>d", ":lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
-- vim.keymap.set( "n", "<leader>h", ":lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })
-- vim.keymap.set( "n", "<leader>de", ":lua vim.diagnostic.setqflist()<CR>", { noremap = true, silent = true })
-- vim.keymap.set( "n", "<leader>r", ":!javac --release 8 % && java Main<CR>", { noremap = true, silent = true})

EOF

" -------------------------------------------------------------------------

" Plugins

call plug#begin()

Plug 'neovim/nvim-lspconfig'       		

Plug 'hrsh7th/nvim-cmp'             	
Plug 'hrsh7th/cmp-nvim-lsp'         
Plug 'hrsh7th/cmp-buffer'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

call plug#end()

" Plugin config 

lua << EOF

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
-- local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.enable("kotlin_language_server")
vim.lsp.enable("jdtls")

EOF

" -------------------------------------------------------------------------
