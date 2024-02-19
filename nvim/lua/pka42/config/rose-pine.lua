return {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
        vim.g.rose_pine_disable_background = true
        vim.g.rose_pine_enable_italics = true
        vim.cmd[[colorscheme rose-pine]]
    end
}
