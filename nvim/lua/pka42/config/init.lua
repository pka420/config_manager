return {
    "folke/tokyonight.nvim",
    "lukas-reineke/indent-blankline.nvim",
    {
        "mbbill/undotree",
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
        opts = { rename_files = false },
        keys = {
            {
                '<leader>h',
                function() require('replacer').run() end,
            }
        }
    },
    {
        'git@gitlab.com:gitlab-org/editor-extensions/gitlab.vim.git',
        -- Activate when a file is created/opened
        event = { 'BufReadPre', 'BufNewFile' },
        -- Activate when a supported filetype is open
        ft = { 'go', 'javascript', 'python', 'ruby' },
        cond = function()
            -- Only activate if token is present in environment variable.
            -- Remove this line to use the interactive workflow.
            return vim.env.GITLAB_TOKEN ~= nil and vim.env.GITLAB_TOKEN ~= ''
        end,
        opts = {
            statusline = {
                -- Hook into the built-in statusline to indicate the status
                -- of the GitLab Duo Code Suggestions integration
                enabled = true,
            },
        },
    }
}
