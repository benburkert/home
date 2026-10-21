-- Enable every server config in lsp/, named by file (lsp/go.lua -> 'go').
-- Each config must set filetypes, or it will attach to every buffer.

local servers = {}
for name, type in vim.fs.dir(vim.fn.stdpath('config') .. '/lsp') do
  if type == 'file' and name:match('%.lua$') then
    table.insert(servers, name:sub(1, -5))
  end
end
vim.lsp.enable(servers)
