local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use { 'VonHeikemen/lsp-zero.nvim',
    branch = 'v4.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'L3MON4D3/LuaSnip' },

      -- Gutter & Styles
      { 'luozhiya/lsp-virtual-improved.nvim' },
    }
  }
  use { 'ellisonleao/gruvbox.nvim' }
  use { 'lewis6991/gitsigns.nvim' }
  use { 'nvim-lualine/lualine.nvim',
    requires = { { 'nvim-tree/nvim-web-devicons' } }
  }
  use { "nvim-neo-tree/neo-tree.nvim",
    requires = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-tree/nvim-web-devicons" },
      { "MunifTanjim/nui.nvim" },
    }
  }
  use { 'nvim-telescope/telescope.nvim',
    tag = '0.1.4',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  use { 'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use { 'sanfusu/neovim-undotree' }
  use { 'wbthomason/packer.nvim' }
  use { 'ray-x/go.nvim' }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
