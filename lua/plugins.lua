local vim = vim

local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  print("Installing packer close and reopen Neovim...")
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

return packer.startup(function(use)
  use 'simrat39/rust-tools.nvim'
  use 'bluz71/vim-nightfly-colors'
  use 'wbthomason/packer.nvim'
  use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
  }
  use {
	'VonHeikemen/lsp-zero.nvim',
  	requires = {
    	-- LSP Support
    		{'neovim/nvim-lspconfig'},
    		{'williamboman/mason.nvim'},
    		{'williamboman/mason-lspconfig.nvim'},

    	-- Autocompletion
   		{'hrsh7th/nvim-cmp'},
    		{'hrsh7th/cmp-buffer'},
    		{'hrsh7th/cmp-path'},
    		{'saadparwaiz1/cmp_luasnip'},
    		{'hrsh7th/cmp-nvim-lsp'},
    		{'hrsh7th/cmp-nvim-lua'},
	-- Snippets
    		{'L3MON4D3/LuaSnip'},
    		{'rafamadriz/friendly-snippets'},
  	}
}

  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
