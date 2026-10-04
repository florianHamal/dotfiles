return {
	{
		'ThePrimeagen/harpoon',
		branch = 'harpoon2',
		dependencies = {
			'nvim-lua/plenary.nvim',
		},
		config = function()
			require("harpoon"):setup()
		end,
		keys = {
			{ "<leader>a", function() require("harpoon"):list():add() end,                                        desc = "Harpoon add file" },
			{ "<C-e>",     function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end,    desc = "Harpoon quick menu" },
			--{ "<C-h>",     function() require("harpoon"):list():select(1) end,                                   desc = "Harpoon to file 1" },
			--{ "<C-t>",     function() require("harpoon"):list():select(2) end,                                   desc = "Harpoon to file 2" },
			--{ "<C-n>",     function() require("harpoon"):list():select(3) end,                                   desc = "Harpoon to file 3" },
			--{ "<C-s>",     function() require("harpoon"):list():select(4) end,                                   desc = "Harpoon to file 4" },
			{ "<C-P>",   function() require("harpoon"):list():prev() end,                                      desc = "Harpoon prev buffer" },
			{ "<C-N>",   function() require("harpoon"):list():next() end,                                      desc = "Harpoon next buffer" },
		},
	},
}
