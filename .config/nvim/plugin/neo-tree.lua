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
      ['o'] = 'open_split',
      ['v'] = 'open_vsplit',
    },
  },
})

local function neo_netrw(opts)
  local fn = function()
    require('neo-tree.command').execute(opts)
  end

  return fn
end

vim.keymap.set('n', '-',
  neo_netrw({ action = 'show', source = 'filesystem', position = 'current' }),
  { desc = "NeoNetrw - filesystem" })
vim.keymap.set('n', '<leader>-',
  neo_netrw({ action = 'show', source = 'buffers', position = 'current', dir = vim.fn.getcwd() }),
  { desc = "NeoNetrw - buffers" })
vim.keymap.set('n', '<leader>_',
  neo_netrw({ action = 'show', source = 'git_status', position = 'current', dir = vim.fn.getcwd() }),
  { desc = "NeoNetrw - git" })
