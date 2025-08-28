return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-tree/nvim-web-devicons' },
      { 'MunifTanjim/nui.nvim' },
    },
    lazy = false,
    opts = {
      use_default_mappings = false,
      filesystem = {
        bind_to_cwd = false,
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
        },
        hijack_netrw_behavior = 'open_current',
        window = {
          mappings = {
            ['%'] = 'add',
            ['-'] = 'navigate_up',
            ['<bs>'] = 'delete',
            ['<cr>'] = function (state)
              local cc = require("neo-tree.sources.filesystem.commands")

              local tree = state.tree
              local node = tree:get_node()
              if node.type == "directory" then
                cc.set_root(state)
              elseif node.type == "file" then
                cc.open(state)
              end
            end,
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
    },
  },
}
