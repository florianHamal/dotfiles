vim.g.mapleader = " "
vim.keymap.set("n", "<leader>ex" , vim.cmd.Ex)
vim.keymap.set("n", "<leader>dg",  function() vim.diagnostic.open_float() end,                         { desc = "Line diagnostics" })
vim.keymap.set("n", "<leader>dga", function() vim.diagnostic.setqflist({ open = true }) end,           { desc = "Project diagnostics" })
vim.keymap.set({ "n", "v" }, "<leader>fm", function() vim.lsp.buf.format({ async = true }) end, { desc = "Format" })


vim.keymap.set("i", "<C-j>", "<Esc>")
vim.keymap.set("v", "<C-j>", "<Esc>")
vim.keymap.set("c", "<C-j>", "<Esc>")
vim.keymap.set("t", "<C-j>", "<C-\\><C-n>")

vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

vim.keymap.set("n", "<leader>v", ":botright vsplit<CR>", { desc = "Vertical split" })
vim.keymap.set("n", "<leader>h", ":botright split<CR>", { desc = "Horizontal split" })

vim.keymap.set("n", "<leader>tv", ":botright vsplit | terminal<CR>", { desc = "Terminal (vertical)" })
vim.keymap.set("n", "<leader>th", ":botright split | terminal<CR>", { desc = "Terminal (horizontal)" })

vim.keymap.set("n", "<leader>bd", ":bdelete<CR>", { desc = "Delete buffer" })
vim.keymap.set("n", "<leader>bn", ":enew<CR>", { desc = "New buffer" })

