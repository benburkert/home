---@type vim.lsp.Config
return {
  cmd = { 'ruby-lsp' },
  filetypes = { 'rb' },
  root_markers = {
    'Gemfile',
    '.jj',
    '.git',
  }
}
