return {
	{
		"nickjvandyke/opencode.nvim",
		version = "*",
		config = function()
			vim.g.opencode_opts = {}
		end,
		keys = {
			{
				"<C-a>",
				function() require("opencode").ask("@", { submit = true }) end,
				desc = "Ask OpenCode…",
				mode = { "n", "x" },
			},
			{
				"<leader>oc",
				function() require("opencode").select() end,
				desc = "Select OpenCode…",
				mode = "n",
			},
			{
				"<leader>os",
				function() require("opencode.config").opts.server.start() end,
				desc = "Start OpenCode server",
				mode = "n",
			},
			{
				"<C-.>",
				function()
					for _, buf in ipairs(vim.api.nvim_list_bufs()) do
						local name = vim.api.nvim_buf_get_name(buf)
						if name:match("term://.*opencode") then
							for _, win in ipairs(vim.api.nvim_list_wins()) do
								if vim.api.nvim_win_get_buf(win) == buf then
									vim.api.nvim_win_close(win, false)
									return
								end
							end
							vim.cmd("vsplit")
							vim.api.nvim_win_set_buf(0, buf)
							return
						end
					end
					require("opencode").ask()
				end,
				desc = "Toggle OpenCode",
			},
		},
	},
}
