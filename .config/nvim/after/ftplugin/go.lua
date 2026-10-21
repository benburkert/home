require("codeactions-on-save").register(
  { "*.go" },
  { "source.organizeImports" }
)

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = { "*.go" },
  callback = function()
    vim.lsp.buf.format({ async = false })
  end
})
