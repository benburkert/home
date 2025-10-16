vim.lsp.enable('zig')
vim.lsp.inlay_hint.enable()

require("codeactions-on-save").register(
  { "*.zig", "*.zon" },
  { "source.fixAll", "source.organizeImports" }
)

vim.api.nvim_create_autocmd('BufWritePre',{
  pattern = {"*.zig", "*.zon"},
  callback = function()
    vim.lsp.buf.format({ async = false })
  end
})

vim.g.zig_fmt_autosave = 0
