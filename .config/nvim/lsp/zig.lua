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
  settings = {
    zls = {
      enable_argument_placeholders = true,
      enable_build_on_save = true,
    },
  },
}
