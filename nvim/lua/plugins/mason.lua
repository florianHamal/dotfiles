return {
    "mason-org/mason-lspconfig.nvim",
    opts = {
	    ensure_installed = {
	    "html",
	    "lua_ls",
	    "jdtls",
	    "kotlin_lsp",
    },
        -- nvim-jdtls manages jdtls itself via start_or_attach(),
        -- so don't let mason-lspconfig auto-enable it via vim.lsp.enable().
        automatic_enable = {
            exclude = { "jdtls" },
        },
    },
    dependencies = {
    { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
    config = function(_, opts)
        require("mason-lspconfig").setup(opts)
        -- NOTE: jdtls cmd/lombok/workspace config lives in plugins/jdtls.lua
        -- (nvim-jdtls start_or_attach). Don't add vim.lsp.config("jdtls")
        -- here, it would fight with nvim-jdtls.
    end,
}
