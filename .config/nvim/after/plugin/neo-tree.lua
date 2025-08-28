local cmd = require('neo-tree.command')

vim.keymap.set('n', '-', function()
  cmd.execute({
    action = 'show',
    source = 'filesystem',
    position = 'current',
    dir = vim.fn.expand('%:p:h'),
  })
end, { desc = "NeoNetrw - filesystem" })

vim.keymap.set('n', '<leader>-', function()
  cmd.execute({
    action = 'show',
    source = 'buffers',
    position = 'current',
    dir = vim.fn.getcwd(),
  })
end, { desc = "NeoNetrw - buffers" })

vim.keymap.set('n', '<leader>_', function()
  cmd.execute({
    action = 'show',
    source = 'git_status',
    position = 'current',
    dir = vim.fn.getcwd(),
  })
end, { desc = "NeoNetrw - git" })
