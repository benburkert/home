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

local signs = {
  { name = "DiagnosticSignError", text = "" },
  { name = "DiagnosticSignWarn", text = "" },
  { name = "DiagnosticSignHint", text = "" },
  { name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

require('lsp-virtual-improved').setup()

vim.diagnostic.config({
  underline = true,
  virtual_text = false,
  virtual_improved = {
    current_line = 'only',
    prefix = '■',
  },
})
