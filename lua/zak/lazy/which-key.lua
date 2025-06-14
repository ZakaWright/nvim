local wk = require("which-key")
wk.add({
    {"<leader>pv", desc = "File System"},
    {"<leader>y", desc = "Copy to clipboard", mode = "n"},
    {"<leader>y", desc = "Copy to clipboard", mode = "v"},
    {"<leader>Y", desc = "Copy line to clipboard", mode = "n"},
    
})
return {
    "folke/which-key.nvim",
    config = function ()
        require('which-key').setup({})
    end
}
