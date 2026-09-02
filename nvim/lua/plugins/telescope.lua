return {
	{
		'nvim-telescope/telescope.nvim',
		version = '*',
		dependencies = {
			'nvim-lua/plenary.nvim',
			{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
		},
		keys = {
			{ "<leader>ff", function() require("telescope.builtin").find_files() end, desc = "Telescope find files" },
			{ "<leader>fg", function() require("telescope.builtin").live_grep() end,  desc = "Telescope live grep" },
			{ "<leader>fb", function() require("telescope.builtin").buffers({ sort_mru = true, ignore_current_buffer = true }) end, desc = "Telescope buffers" },
			{ "<leader>fh", function() require("telescope.builtin").help_tags() end,  desc = "Telescope help tags" },
		},
		opts = {
			pickers = {
				buffers = {
					mappings = {
						i = { ["<C-d>"] = "delete_buffer" },
						n = { ["<C-d>"] = "delete_buffer", ["dd"] = "delete_buffer" },
					},
				},
			},
		},
	},
}
