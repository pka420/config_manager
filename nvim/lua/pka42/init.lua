require("pka42.remap")
require("pka42.set")
vim.cmd[[ colorscheme tokyonight ]]

function reload_config()
    for name,_ in pairs(package.loaded) do
        if name:match('^pka42') then
            package.loaded[name] = nil
        end
    end

    require('pka42.remap')
    require("pka42.set")

    -- Reload after/ directory
    local glob = vim.fn.stdpath('config') .. '/after/**/*.lua'
    local after_lua_filepaths = vim.fn.glob(glob, true, true)

    for _, filepath in ipairs(after_lua_filepaths) do
        dofile(filepath)
    end

    vim.notify("Nvim configuration reloaded!", vim.log.levels.INFO)
end
vim.keymap.set('n', '<leader>r', reload_config)
