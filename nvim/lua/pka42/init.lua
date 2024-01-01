require("pka42.set")
require("pka42.remap")
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.cmd[[ colorscheme kanagawa-dragon]]

function reload_config()
    require('pka42.remap')
    require("pka42.set")
    vim.cmd[[ colorscheme kanagawa-dragon ]]
    vim.opt.tabstop = 4
    vim.opt.softtabstop = 4
    vim.opt.shiftwidth = 4
    vim.opt.expandtab = true
    vim.notify("Nvim configuration reloaded!", vim.log.levels.INFO)
end

vim.keymap.set('n', '<leader><leader>r', reload_config) 
