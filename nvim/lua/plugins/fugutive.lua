return {
  {
    "tpope/vim-fugitive",
    cmd = "Git",                       -- lazy-load when :Git is invoked
    keys = {
      { "<leader>gs", "<cmd>Git<cr>",  desc = "Git status" },
      { "<leader>gc", "<cmd>Git commit<cr>", desc = "Git commit" },
     { "<leader>gd", "<cmd>Gvdiffsplit<cr>", desc = "Git diff (vertical)" },
        { "<leader>gfh", "<cmd>Gclog<cr>",       desc = "Git file history" },
      { "<leader>gh", "<cmd>0Gclog<cr>",      desc = "Git repo history" },
    },
  },
}
