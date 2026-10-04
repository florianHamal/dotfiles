return {
    "mfussenegger/nvim-jdtls",
    ft = { "java" },
    dependencies = {
        "mason-org/mason.nvim",
        "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "java",
            callback = function()
                local jdtls = require("jdtls")
                local jdtls_setup = require("jdtls.setup")

                local root_markers = {
                    ".git",
                    "mvnw",
                    "gradlew",
                    "pom.xml",
                    "build.gradle",
                    "build.gradle.kts",
                    "settings.gradle",
                    "settings.gradle.kts",
                }
                local root_dir = jdtls_setup.find_root(root_markers)
                if not root_dir or root_dir == "" then
                    root_dir = vim.fn.getcwd()
                end

                local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")
                local workspace = vim.fn.stdpath("data") .. "/jdtls-workspace/" .. project_name
                vim.fn.mkdir(workspace, "p")

                local jdtls_bin = vim.fn.stdpath("data") .. "/mason/bin/jdtls"
                local cmd = { jdtls_bin }

                -- Lombok support: mason ships lombok.jar but doesn't pass it by default.
                local lombok = vim.fn.stdpath("data") .. "/mason/packages/jdtls/lombok.jar"
                if vim.uv.fs_stat(lombok) then
                    table.insert(cmd, "--jvm-arg=-javaagent:" .. lombok)
                end
                -- Per-project workspace isolation (required for correct
                -- cross-file index, references and semantic rename).
                table.insert(cmd, "-data")
                table.insert(cmd, workspace)

                local capabilities = nil
                local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
                if ok then
                    capabilities = cmp_nvim_lsp.default_capabilities()
                end

                local config = {
                    name = "jdtls",
                    cmd = cmd,
                    root_dir = root_dir,
                    capabilities = capabilities,
                    -- Tells jdtls Neovim supports its extensions (refactorings,
                    -- organize imports, extract variable/method, etc.).
                    init_options = {
                        bundles = {},
                    },
                    settings = {
                        java = {
                            configuration = {
                                updateBuildConfiguration = "automatic",
                            },
                        },
                    },
                }

                -- Merges vim.lsp.config("*") (cmp capabilities) on 0.11+.
                jdtls.start_or_attach(config)
            end,
        })
    end,
}
