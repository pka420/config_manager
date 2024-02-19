return {
    "folke/tokyonight.nvim",
    "lukas-reineke/indent-blankline.nvim",
    {"mbbill/undotree",
        config = function()
            vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
        end
    },
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
         opts = {
             icons = true,
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
         }
    },
    "junegunn/fzf"
}
