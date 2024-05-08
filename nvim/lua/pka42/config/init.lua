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
        "github/copilot.vim",
    },
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    },


}
