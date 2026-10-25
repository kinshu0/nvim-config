require("plugins")
require("session")
require("lsp")

-- Disable filetype-based indentation (but keep filetype detection for LSP)
vim.cmd("filetype plugin on")
vim.cmd("filetype indent off")

vim.opt.number = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.termguicolors = true
vim.opt.cursorline = false

vim.cmd("colorscheme vim")

vim.api.nvim_create_autocmd("TermOpen", {
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.signcolumn = "no"
  end,
})
