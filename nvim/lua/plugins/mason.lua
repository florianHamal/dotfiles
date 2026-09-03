return {
    "mason-org/mason-lspconfig.nvim",
    opts = {
	    ensure_installed = {
	    "html",
	    "lua_ls",
	    "jdtls",
	    "kotlin-lsp",
    },
    },
    dependencies = {
    { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
}
