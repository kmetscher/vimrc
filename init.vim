lua require('plugins')

lua <<EOF
local lsp = require('lsp-zero')
lsp.preset('recommended')
lsp.set_preferences({
	suggest_lsp_servers = true,
  	setup_servers_on_start = true,
  	set_lsp_keymaps = true,
  	configure_diagnostics = true,
  	cmp_capabilities = true,
  	manage_nvim_cmp = true,
  	call_servers = 'local'
})
require'nvim-treesitter.configs'.setup {
		auto_install = true,
		highlight = {
				enable = true,
		},
		additional_vim_regex_highlighting = false,
}
lsp.setup()
vim.diagnostic.config({virtual_text = true})
local rt = require("rust-tools")
rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
})
vim.diagnostic.config({
    virtual_text = false,
})
EOF

tnoremap <C-\> <C-\><C-n>

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
let g:nightflyTransparent = v:true
