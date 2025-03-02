-- init.vim
-- set clipboard+=unnamedplus
-- call plug#begin('~/.config/nvim/plugged')
-- Plug 'ThePrimeagen/vim-be-good'
-- call plug#end()
require("cankurttekin")
-- set clipboard
vim.opt.clipboard = "unnamedplus"

-- colorscheme
vim.o.number = true
vim.opt.termguicolors = true
-- let ayucolor = "light"
-- vim.cmd("colorscheme ayu")

-- Plugin Manager (vim-plug)
vim.cmd([[
  call plug#begin('~/.config/nvim/plugged')
  Plug 'ThePrimeagen/vim-be-good'
  Plug 'ayu-theme/ayu-vim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'CopilotC-Nvim/CopilotChat.nvim'
  Plug 'github/copilot.vim'
  Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'mbbill/undotree'
  Plug 'tpope/vim-fugitive'
  call plug#end()

  set termguicolors     " Enable true colors
  let ayucolor="mirage" " Change to 'mirage', 'light', or 'dark'
  colorscheme ayu

]])
require('telescope').setup {}
require('CopilotChat').setup {}

