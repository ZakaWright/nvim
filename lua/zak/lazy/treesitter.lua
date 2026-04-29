return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
        ensure_installed = {
            "vimdoc", "javascript", "typescript", "c", "lua",
            "python", "jsdoc", "bash", "html", "go", "rust", "templ"
        },
        auto_install = true,
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = { "markdown" },
        },
        indent = {
            enable = true,
        },
    },
}
