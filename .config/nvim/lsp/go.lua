return {
  cmd = { 'gopls' },
  filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
  root_markers = { 'go.mod', 'go.work', '.git' },
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd('BufWritePre', {
      group = vim.api.nvim_create_augroup('go_on_save_' .. bufnr, { clear = true }),
      buffer = bufnr,
      callback = function()
        require('codeactions-on-save').apply({ 'source.organizeImports' }, bufnr)
        vim.lsp.buf.format({ bufnr = bufnr, id = client.id, async = false })
      end,
    })
  end,
}
