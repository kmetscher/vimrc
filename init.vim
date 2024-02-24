lua require('plugins')

lua <<EOF
local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {'gopls'},
  handlers = {
    lsp_zero.default_setup,
    gopls = function() 
        local util = require 'lspconfig.util'
        local mod_cache = '/home/c0w80yd4n/go/pkg/mod'
        require('lspconfig').gopls.setup({})
    end,
  },
})
EOF

set scrolloff=8
set hidden
set incsearch
set number
set relativenumber
set termguicolors
set splitbelow
set splitright
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
set shiftround
set smarttab
set cursorline
set wildmenu
set wildmode=list:longest
set nowrap
set mouse=

colorscheme nightfly
