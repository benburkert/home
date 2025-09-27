return {
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'master',
    lazy = false,
    build = ':TSUpdate',
    config = function ()
      require('nvim-treesitter.configs').setup({
        ensure_installed = {
          'c', 'cpp', 'css', 'json', 'nix', 'regex', 'rust', 'sql', 'toml', 'vimdoc', 'yaml',

          -- git
          'diff', 'git_config', 'git_rebase', 'gitattributes', 'gitcommit',

          -- go
          'go', 'gomod', 'gosum', 'gowork',

          -- python
          'python',

          -- ruby
          'ruby', 'embedded_template',

          -- terraform
          'hcl', 'terraform',

          -- vim
          'lua', 'vim', 'vimdoc',

          -- shell
          'bash', 'fish',

          -- zig
          'zig',
        },
      })
    end,
  },
}
