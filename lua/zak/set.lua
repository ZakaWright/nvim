vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.incsearch = true
vim.opt.hlsearch = false

vim.opt.scrolloff = 8
vim.o.updatetime = 50
vim.o.timeoutlen = 300

-- save undo history
vim.o.undofile = true

vim.o.ignorecase = true
vim.o.smartcase = true

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

--needed to set emmet properly for some reason
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = { "*.js", "*.jsx" },
    command = "set filetype=javascriptreact",
})
