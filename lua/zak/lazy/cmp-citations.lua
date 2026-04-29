return {
    "jc-doyle/cmp-pandoc-references",
    dependencies = { "hrsh7th/nvim-cmp" },
    config = function()
        local cmp = require("cmp")
        -- Extend cmp sources for tex and markdown buffers
        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "tex", "markdown" },
            callback = function()
                cmp.setup.buffer({
                    sources = cmp.config.sources({
                        { name = "nvim_lsp" },
                        { name = "pandoc_references" },
                        { name = "luasnip" },
                    }, {
                        { name = "buffer" },
                        { name = "path" },
                    }),
                })
            end,
        })
    end,
}
