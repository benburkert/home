-- leader key

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- colors & theme

vim.o.background = 'dark'
vim.o.termguicolors = true

-- uncatagorized

vim.opt.backspace = 'indent,eol,start'
vim.opt.showcmd = true
vim.opt.laststatus = 2

vim.api.nvim_set_option_value('clipboard', 'unnamed', {})

-- file sync

vim.opt.autoread = true
vim.opt.autowrite = true
vim.opt.updatetime = 50

-- gutters & visuals

vim.opt.wrap = false
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.cursorlineopt = 'number'
vim.opt.signcolumn = 'yes'

-- tabs & spaces

vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.shiftround = true
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.softtabstop = -1
vim.opt.tabstop = 4
vim.opt.listchars = {
  eol = '⁋',
  extends = '▸',
  nbsp = '◇',
  precedes = '◂',
  space = '·',
  tab = '→ ',
  trail = '⋅',
}

-- swap, backup, & undo

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
