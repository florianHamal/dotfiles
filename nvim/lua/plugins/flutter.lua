return {
	{
		"akinsho/flutter-tools.nvim",
		ft = { "dart" }, -- Only load for Dart files; flutter-tools registers the LSP on first dart buffer
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			{ "<leader>frl", "<cmd>FlutterReload<cr>",    desc = "Flutter Hot Reload" },
			{ "<leader>frs", "<cmd>FlutterRestart<cr>",   desc = "Flutter Hot Restart" },
			{ "<leader>frn", "<cmd>FlutterRun<cr>",       desc = "Flutter run" },
			{ "<leader>flt", "<cmd>FlutterLogToggle<cr>", desc = "Flutter log toggle" },
			{ "<leader>flc", "<cmd>FlutterLogClear<cr>",  desc = "Flutter log clear" },
			{ "<leader>fq",  "<cmd>FlutterQuit<cr>",      desc = "Flutter quit" },
		},
 config = function()
      require("flutter-tools").setup {
        fvm = true,
        lsp = {
          capabilities = require("cmp_nvim_lsp").default_capabilities(),
          flags = {
            debounce_text_changes = 150,
            allow_incremental_sync = true,
          },
          settings = {
            showTodos = true,
            completeFunctionCalls = true,
            enableSnippets = true,
            analysisExcludedFolders = {
              vim.fn.expand "$HOME/.pub-cache",
              vim.fn.expand "$HOME/fvm",
            },
          },
        },
      }

      local flutter_lsp_group = vim.api.nvim_create_augroup("FlutterLspReattach", { clear = true })
      vim.api.nvim_create_autocmd({ "BufEnter", "BufReadPost" }, {
        group = flutter_lsp_group,
        pattern = "*.dart",
        callback = function(args)
          if #vim.lsp.get_clients { bufnr = args.buf, name = "dartls" } == 0 then
            require("flutter-tools.lsp").attach()
          end
        end,
      })
    end,
	},
}


