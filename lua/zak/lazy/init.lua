return {
	{
		"nvim-lua/plenary.nvim",
		name = "plenary"
	}, {
        "folke/which-key.nvim",
        config = function ()
            require('which-key').setup({})
        end
    }

}
