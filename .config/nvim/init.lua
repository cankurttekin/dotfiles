-- init.vim
-- set clipboard+=unnamedplus
-- call plug#begin('~/.config/nvim/plugged')
-- Plug 'ThePrimeagen/vim-be-good'
-- call plug#end()

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
  call plug#end()

  set termguicolors     " Enable true colors
  let ayucolor="mirage" " Change to 'mirage', 'light', or 'dark'
  colorscheme ayu

]])

-- CopilotChat
require("CopilotChat").setup {
  -- See Configuration section for options
}
