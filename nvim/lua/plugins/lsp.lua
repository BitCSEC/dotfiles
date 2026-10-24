require("mason").setup()

-- Lua
vim.lsp.config("lua_ls", {
    settings = {
        Lua= {
            diagnostics = {
                globals = { "vim" },
            },
        },
    },
})
vim.lsp.enable("lua_ls")

-- Python
vim.lsp.config("basedpyright", {
    on_init = function (client)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
    end,
})
vim.lsp.enable("basedpyright")
vim.lsp.enable("ruff")

-- C/C++
vim.lsp.enable("clangd")

-- Typst
vim.lsp.enable("tinymist")

-- Docker
vim.lsp.enable("docker_language_server")

-- Rust
vim.lsp.enable("rust_analyzer")

-- HTML
vim.lsp.enable("html")

-- CSS
vim.lsp.enable("cssls")

-- JavaScript
vim.lsp.enable("vtsls")

-- LaTeX
vim.lsp.enable("texlab")

-- Ltx-plus
vim.lsp.config("ltex_plus", {
    -- cmd = { "ltex-ls-plus"  },
    -- filetypes = { "markdown", "tex", "bib", "plaintex", "text" },
    settings = {
        ltex = {
            language = "es-ES",
            -- enabled = { "latex", "tex", "bib", "markdown", "plaintex", "text" },
            additionalRules = "~/.ngrams/",
        },
    },
})

vim.lsp.enable("ltex_plus")
