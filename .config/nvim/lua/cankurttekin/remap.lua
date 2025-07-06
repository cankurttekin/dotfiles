vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) 

local harpoon = require("harpoon")

-- Add the current file to the list
vim.keymap.set("n", "<leader>a", function()
  harpoon:list():add()
end, { desc = "Harpoon Add File" })

-- Toggle the Harpoon UI
vim.keymap.set("n", "<leader>h", function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "Harpoon UI" })

-- Toggle Telescope command history
vim.keymap.set("n", "<leader>ch", "<cmd>Telescope command_history<CR>", { desc = "Command history" })

vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle File Explorer" })
