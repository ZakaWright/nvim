return {
    "nvim-telescope/telescope-bibtex.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
        require("telescope").load_extension("bibtex")

        local bib_path = vim.fn.expand("~/Dropbox/DSU/bibliography.bib")

        require("telescope._extensions.bibtex").setup({
            depth = 1,
            global_files = { bib_path },
            search_keys = { "author", "year", "title" },
            citation_format = "{{cite{{{key}}}}}",  -- \cite{key} format
            citation_trim_firstname = true,
            citation_max_auth = 2,
            context = true,
            context_fallback = true,
            preview = {
                check_mime_type = false,
            },
            formatter = "plain",
        })

        -- Register the keymap with which-key
        local wk = require("which-key")
        wk.add({
            { "<leader>fc", desc = "Find Citations" },
        })

        vim.keymap.set("n", "<leader>fc", 
            --":Telescope bibtex<CR>",
            "<cmd>Telescope bibtex previewer=false<CR>",
            { desc = "Find Citations" })
    end,
}
