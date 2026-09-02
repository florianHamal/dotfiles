vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false

--local numtoggle = false
--vim.keymap.set("n", "<leader>faa", function()
--    numtoggle = not numtoggle
--    vim.opt.relativenumber = not numtoggle
--end, { desc = "Toggle relative numbers" })

require("flori4n_.remap")
