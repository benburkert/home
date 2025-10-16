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
}
