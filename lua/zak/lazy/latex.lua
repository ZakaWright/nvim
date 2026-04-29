return {
    "lervag/vimtex",
    lazy = false, -- vimtex needs to load early for filetype detection
    init = function()
        vim.g.vimtex_view_method = "zathura"
        vim.g.vimtex_compiler_method = "latexmk"
        vim.g.vimtex_compiler_latexmk = {
            build_dir = "build",
            callback = 1,
            continuous = 1, -- recompile on save automatically
            executable = "latexmk",
            options = {
                "-pdf",
                "-interaction=nonstopmode",
                "-synctex=1",
            },
        }
        -- Disable vimtex's own insert mode mappings so cmp can breathe
        vim.g.vimtex_mappings_disable = { i = { "]]" } }
        vim.g.vimtex_quickfix_mode = 0 -- don't auto-open quickfix on warnings
    end,
}
