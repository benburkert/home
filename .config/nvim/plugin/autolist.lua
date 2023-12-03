local function auto_list()
  local current_pos = vim.fn.getpos('.')
  vim.o.list = (vim.fn.search('^\t') > 0 and vim.fn.search('^ ') > 0)
  vim.fn.setpos('.', current_pos)
end

vim.api.nvim_create_augroup('autolist', { clear = true })

vim.api.nvim_create_autocmd('BufEnter', {
  group = 'autolist',
  callback = auto_list,
})

vim.api.nvim_create_autocmd({'BufEnter', 'ModeChanged'}, {
  group = 'autolist',
  pattern = '*:n',
  callback = auto_list,
})
