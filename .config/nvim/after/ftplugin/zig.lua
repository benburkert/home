vim.lsp.enable('zig')

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
