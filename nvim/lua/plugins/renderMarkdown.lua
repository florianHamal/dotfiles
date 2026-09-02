return {
	{
		"MeanderingProgrammer/render-markdown.nvim",
		ft = { "markdown" },
		cmd = { "RenderMarkdown" },
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" },
		---@module "render-markdown"
		---@type render.md.UserConfig
		opts = {},
		keys = {
			{ "<leader>gs", "<cmd>Git<cr>", desc = "Git status" },
		},
	},
}
