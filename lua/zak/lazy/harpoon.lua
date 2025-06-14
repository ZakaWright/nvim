return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim"},

    config = function ()
        local harpoon = require("harpoon")
        local wk = require("which-key")

        harpoon.setup()


        vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
        vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
        vim.keymap.set("n", "<C-a>", function () harpoon.rm_file() end)

        vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
        vim.keymap.set("n", "<C-j>", function() harpoon:list():select(2) end)
        vim.keymap.set("n", "<C-k>", function() harpoon:list():select(3) end)
        vim.keymap.set("n", "<C-l>", function() harpoon:list():select(4) end)

        -- Toggle previous & next buffers stored within Harpoon list
        vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
        vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)

        wk.add({
            {"<leader>a", desc = "Harpoon"},
            {"<C-e>", desc = "Harpoon quick menu"},
            {"<C-a>", desc = "Harpoon remove file"},
            {"<C-h>", desc = "Harpoon file 1"},
            {"<C-j>", desc = "Harpoon file 2"},
            {"<C-k>", desc = "Harpoon file 3"},
            {"<C-l>", desc = "Harpoon file 4"},
        })
    end
}
