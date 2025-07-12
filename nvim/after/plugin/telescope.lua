local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Telescope git file search' })
vim.keymap.set('n', '<leader>ps', function()
  builtin.grep_string({ search = vim.fn.input('Grep >  ') })
end)
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })

