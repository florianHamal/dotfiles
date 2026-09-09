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
    config = function(_, opts)
        require("mason-lspconfig").setup(opts)

        -- Lombok support for jdtls: mason already ships
        -- ~/.local/share/nvim/mason/packages/jdtls/lombok.jar,
        -- but lspconfig doesn't pass it as a javaagent by default.
        local lombok = vim.fn.stdpath("data") .. "/mason/packages/jdtls/lombok.jar"
        if vim.uv.fs_stat(lombok) then
            vim.lsp.config("jdtls", {
                cmd = {
                    vim.fn.stdpath("data") .. "/mason/bin/jdtls",
                    "--jvm-arg=-javaagent:" .. lombok,
                },
                init_options = {
                    -- loads lombok processors from project classpath
                    ["java.jdt.ls.lombokSupport.enabled"] = true,
                },
            })
        else
            vim.notify("jdtls lombok.jar not found: " .. lombok, vim.log.levels.WARN)
        end
    end,
}
