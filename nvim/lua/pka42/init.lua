require("pka42.set")
require("pka42.remap")
require("colorizer").setup()
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.cmd[[ colorscheme tokyonight-moon ]]

function reload_config()
    require('pka42.remap')
    require("pka42.set")
    require("colorizer").setup()
    vim.cmd[[ colorscheme tokyonight-moon ]]
    vim.opt.tabstop = 4
    vim.opt.softtabstop = 4
    vim.opt.shiftwidth = 4
    vim.opt.expandtab = true
    vim.notify("Nvim configuration reloaded!", vim.log.levels.INFO)
end

vim.keymap.set('n', '<leader><leader>r', reload_config) 

