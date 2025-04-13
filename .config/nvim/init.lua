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
-- vim.cmd("colorscheme ayu")
-- vim.cmd("colorscheme uvbox")
-- Plugin Manager (vim-plug)
vim.cmd([[
  call plug#begin('~/.config/nvim/plugged')
  Plug 'ThePrimeagen/vim-be-good'
  "Plug 'ayu-theme/ayu-vim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'CopilotC-Nvim/CopilotChat.nvim'
  Plug 'github/copilot.vim'
  Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'mbbill/undotree'
  Plug 'tpope/vim-fugitive'
  Plug 'stevearc/dressing.nvim'
  Plug 'MunifTanjim/nui.nvim'
  Plug 'MeanderingProgrammer/render-markdown.nvim'

  " Optional deps
  Plug 'hrsh7th/nvim-cmp'
  Plug 'nvim-tree/nvim-web-devicons' "or Plug 'echasnovski/mini.icons'
  Plug 'HakonHarnes/img-clip.nvim'
  Plug 'yetone/avante.nvim', { 'branch': 'main', 'do': 'make' }
  
  Plug 'maxmx03/solarized.nvim'
  
  call plug#end()

  set termguicolors     " Enable true colors
  "autocmd! User avante.nvim lua << EOF
]])
vim.o.background = "light"
vim.cmd.colorscheme("solarized")
require('solarized').setup {
  theme = "neo", -- or "default"
  transparent = false,
  styles = {
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},
  },
}
require('telescope').setup {}
require('CopilotChat').setup {}
--require('avante').setup()
