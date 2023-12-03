local function enter(state)
  local cc = require("neo-tree.sources.filesystem.commands")

  local tree = state.tree
  local node = tree:get_node()
  if node.type == "directory" then
    cc.set_root(state)
  elseif node.type == "file" then
    cc.open(state)
  end
end

require('neo-tree').setup({
  use_default_mappings = false,
  filesystem = {
    hijack_netrw_behavior = 'open_current',
    window = {
      mappings = {
        ['%'] = 'add',
        ['-'] = 'navigate_up',
        ['<bs>'] = 'delete',
        ['<cr>'] = enter,
        ['D'] = 'delete',
        ['d'] = 'add_directory',
        ['o'] = 'open_split',
        ['r'] = 'rename',
        ['v'] = 'open_vsplit',
      },
    },
  },
  window = {
    mappings = {
      ['<cr>'] = 'open',
      ['o'] = 'open_split',
      ['v'] = 'open_vsplit',
    },
  },
})

vim.keymap.set('n', '-', function()
  require('neo-tree.command').execute({
    action = 'show',
    source = 'filesystem',
    position = 'current',
    dir = vim.fn.expand('%:p:h'),
  })
end, { desc = "NeoNetrw - filesystem" })

vim.keymap.set('n', '<leader>-', function()
  require('neo-tree.command').execute({
    action = 'show',
    source = 'buffers',
    position = 'current',
    dir = vim.fn.getcwd(),
  })
end, { desc = "NeoNetrw - buffers" })

vim.keymap.set('n', '<leader>_', function()
  require('neo-tree.command').execute({
    action = 'show',
    source = 'git_status',
    position = 'current',
    dir = vim.fn.getcwd(),
  })
end, { desc = "NeoNetrw - git" })
