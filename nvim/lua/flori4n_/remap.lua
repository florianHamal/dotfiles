vim.g.mapleader = " "
vim.keymap.set("n", "<leader>ex" , vim.cmd.Ex)
vim.keymap.set("n", "<leader>dg",  function() vim.diagnostic.open_float() end,                         { desc = "Line diagnostics" })
vim.keymap.set("n", "<leader>dga", function() vim.diagnostic.setqflist({ open = true }) end,           { desc = "Project diagnostics" })
vim.keymap.set({ "n", "v" }, "<leader>fm", function() vim.lsp.buf.format({ async = true }) end, { desc = "Format" })


vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")
