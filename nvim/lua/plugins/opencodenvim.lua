return {
	{
		"nickjvandyke/opencode.nvim",
		version = "*",
		dependencies = {
			{
				"folke/snacks.nvim",
				optional = true,
				opts = {
					input = {},
					picker = {
						actions = {
							opencode_send = function(...)
								return require("opencode").snacks_picker_send(...)
							end,
						},
						win = {
							input = {
								keys = {
									["<a-a>"] = { "opencode_send", mode = { "n", "i" } },
								},
							},
						},
					},
					terminal = {
						win = {
							keys = {
								["<C-x>"] = { "<C-\\><C-n>", mode = "t", desc = "Exit terminal mode" },
							},
						},
					},
				},
			},
		},
		keys = {
			{ "<C-a>", function() require("opencode").ask("@this: ") end, desc = "Ask OpenCode…" },
			{ "<C-x>", function() require("opencode").select() end, desc = "Ask OpenCode…" },
			{ "go", function() return require("opencode").operator("@this ") end, desc = "Append range to OpenCode", expr = true, mode = { "n", "x" } },
			{ "goo", function() return require("opencode").operator("@this ") .. "_" end, desc = "Append line to OpenCode", expr = true },
			{ "<S-C-u>", function() require("opencode").command("session.half.page.up") end, desc = "Scroll OpenCode up" },
			{ "<S-C-d>", function() require("opencode").command("session.half.page.down") end, desc = "Scroll OpenCode down" },
			{ "<C-.>", function() require("opencode").toggle() end, desc = "Toggle OpenCode window" },
		},
	},
}
