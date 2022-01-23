" Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua.
Plug 'jose-elias-alvarez/null-ls.nvim'

lua << EOF
require("null-ls").setup({
    sources = {
        require("null-ls").builtins.formatting.stylua,
        require("null-ls").builtins.diagnostics.eslint,
        require("null-ls").builtins.completion.spell,
    },
})
EOF
