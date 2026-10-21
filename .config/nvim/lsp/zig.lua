---@type vim.lsp.Config
return {
  cmd = { 'zls' },
  filetypes = { 'zig', 'zon' },
  root_markers = {
    'zls.json',
    'build.zig',
    '.jj',
    '.git',
  },
  on_attach = function(client, bufnr)
    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })

    vim.api.nvim_create_autocmd('BufWritePre', {
      group = vim.api.nvim_create_augroup('zig_on_save_' .. bufnr, { clear = true }),
      buffer = bufnr,
      callback = function()
        require('codeactions-on-save').apply({ 'source.fixAll', 'source.organizeImports' }, bufnr)
        vim.lsp.buf.format({ bufnr = bufnr, id = client.id, async = false })
      end,
    })
  end,
}
