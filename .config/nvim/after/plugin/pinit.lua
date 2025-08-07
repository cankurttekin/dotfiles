local pinit = require("pinit")

pinit:setup({
  notes_dir = "~/pinit-notes",
})

vim.keymap.set("n", "<leader>pn", function()
  pinit:open()
end, { desc = "Toggle pinit" })
