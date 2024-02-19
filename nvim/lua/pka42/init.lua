require("pka42.set")
require("pka42.remap")
require("pka42.options")
require("colorizer").setup()
vim.cmd[[ colorscheme tokyonight-moon ]]

function reload_config()
    require('pka42.remap')
    require("pka42.set")
    require("colorizer").setup()
    vim.cmd[[ colorscheme tokyonight-moon ]]
    vim.notify("Nvim configuration reloaded!", vim.log.levels.INFO)
end

vim.keymap.set('n', '<leader><leader>r', reload_config) 

