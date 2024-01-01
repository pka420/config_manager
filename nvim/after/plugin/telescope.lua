local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>gs', builtin.git_status, {})
vim.keymap.set('n', '<leader>stash', builtin.git_stash, {})
vim.keymap.set('n', '<leader>br', builtin.git_branches, {})
vim.keymap.set('n', '<leader>com', builtin.git_commits, {})
--- keymaps missing:
-- git_bcommits git_bcommits_range

-- vim.keymap.set('n', '', builtin.quickfix, {})
--
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fm', builtin.marks, {})
vim.keymap.set('n', '<C-f>', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>theme', builtin.colorscheme, {})

