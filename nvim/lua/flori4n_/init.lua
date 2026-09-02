vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.splitright = true

--local numtoggle = false
--vim.keymap.set("n", "<leader>faa", function()
--    numtoggle = not numtoggle
--    vim.opt.relativenumber = not numtoggle
--end, { desc = "Toggle relative numbers" })

require("flori4n_.remap")
vim.opt.clipboard = "unnamedplus"

--require("notify").setup({
--  background_colour = "#000000",
--})

--require('vim._core.ui2').enable()
--
--



