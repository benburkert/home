local lsp = require('lsp-zero')

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
    'gopls',
    'lua_ls',
    'jsonls',
    'rust_analyzer',
    'yamlls',
    'zls',

    -- ruby
    'rubocop',
    'ruby_ls',
  },
  handlers = {
    lsp.default_setup,
  },
})

