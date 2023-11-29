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
    'taplo',
    'terraformls',
    'yamlls',
    'zls',

    -- ruby
    'rubocop',
    'solargraph',
  },
  handlers = {
    lsp.default_setup,
  },
})

