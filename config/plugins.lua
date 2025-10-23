local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug 'neovim/nvim-lspconfig'       		

Plug 'hrsh7th/nvim-cmp'             	
Plug 'hrsh7th/cmp-nvim-lsp'         
Plug 'hrsh7th/cmp-buffer'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

vim.call('plug#end')
