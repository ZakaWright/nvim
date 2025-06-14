local wk = require("which-key")
wk.add({
    { "<leader>f", group = "telescope" }, -- group
    {'<leader>ff', desc = "Find Files"},
    {'<leader>fg', desc = "Live Grep"},
    {'<leader>fb', desc = "Find Buffers"},
    {'<leader>fh', desc = "Help Tags"},
    {'<leader>fd', desc = "Find Git Files"},
})
return {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',

    dependencies = {
	"nvim-lua/plenary.nvim"
    },

    	config = function()
	    local builtin = require('telescope.builtin')
	    vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
	    vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
	    vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
	    vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
	    vim.keymap.set('n', '<leader>fd', builtin.git_files, {})

	end
}
