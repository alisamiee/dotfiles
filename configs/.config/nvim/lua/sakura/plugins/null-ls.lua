return {
    {
        "nvimtools/none-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
        lazy = true,
        config = function()
            -- local formatting = null_ls.builtins.formatting
            -- local diagnostics = null_ls.builtins.diagnostics
            require("null-ls").setup({
                sources = {
                    -- formatting.prettier.with {

                    --     extra_filetypes = { "toml" },
                    --     extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
                    -- },
                    -- formatting.black, -- .with { extra_args = { "--fast" } },
                    -- formatting.stylua,
                    -- formatting.google_java_format,
                    -- diagnostics.flake8,
                },
            })
        end,
    },
    {
        "jay-babu/mason-null-ls.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "nvimtools/none-ls.nvim",
        },
		event = { "BufReadPre", "BufNewFile" },
        lazy = true,
        config = function()
            require("mason-null-ls").setup({
                ensure_installed = nil,
                automatic_installation = true,
                handlers = {
                    -- Here you can add functions to register sources.
                    -- See https://github.com/jay-babu/mason-null-ls.nvim#handlers-usage
                    --
                    -- If left empty, mason-null-ls will  use a "default handler"
                    -- to register all sources
                },
            })
        end,
    },
}
