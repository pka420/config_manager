return {
    "VonHeikemen/lsp-zero.nvim",
    branch = 'v3.x',
    dependencies = {
        -- LSP Support
        { 'neovim/nvim-lspconfig' },
        { 'williamboman/mason.nvim' },
        { 'williamboman/mason-lspconfig.nvim' },

        -- Autocompletion
        { 'hrsh7th/nvim-cmp' },
        { 'hrsh7th/cmp-buffer' },
        { 'hrsh7th/cmp-path' },
        { 'saadparwaiz1/cmp_luasnip' },
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'hrsh7th/cmp-nvim-lua' },
        { 'L3MON4D3/LuaSnip', version = 'v2.5.0' },

        -- Fidget (LSP progress UI)
        { "j-hui/fidget.nvim" },

        -- Snippets
        { 'rafamadriz/friendly-snippets' },
    },
    config = function()
        vim.g.lsp_zero_extend_lspconfig = false
        local lsp_zero = require('lsp-zero')

        vim.lsp.config('*', {
            capabilities = require('cmp_nvim_lsp').default_capabilities(),
        })

        vim.lsp.config('lua_ls', {
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" }
                    }
                }
            }
        })

        require("mason").setup()
        require("mason-lspconfig").setup()

        require("fidget").setup()

        local cmp = require('cmp')
        local luasnip = require("luasnip")

        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = {
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-y>'] = cmp.config.disable,
                ['<C-e>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
                ['<C-n>'] = cmp.mapping.select_next_item(),
                ['<C-p>'] = cmp.mapping.select_prev_item(),
            },
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'buffer' },
                { name = 'path' },
            }),
        })

        lsp_zero.set_sign_icons({
            error = "",
            warn = "",
            hint = "󰋗",
            info = ""
        })

        vim.diagnostic.config({
            virtual_text = true
        })
    end
}
