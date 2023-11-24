local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "FuzzyFinder - list files" })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "FuzzyFinder - search in files" })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "FuzzyFinder - open files" })
vim.keymap.set('n', '<leader>fo', builtin.oldfiles, { desc = "FuzzyFinder - opened files" })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "FuzzyFinder - help" })
