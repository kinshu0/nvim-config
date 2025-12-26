vim.lsp.enable("pyright")

-- Keymaps when LSP attaches
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local opts = { buffer = args.buf }
    vim.keymap.set("n", "grn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "grr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "gd",  vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K",   vim.lsp.buf.hover, opts)
  end,
})
