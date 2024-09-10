return {
    "folke/tokyonight.nvim",
    "lukas-reineke/indent-blankline.nvim",
    {"mbbill/undotree",
        config = function()
            vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
        end
    },
    "junegunn/fzf",
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    },
    {
        'gabrielpoca/replacer.nvim',
        opts = {rename_files = false},
        keys = {
            {
                '<leader>h',
                function() require('replacer').run() end,
            }
        }
    }
}
