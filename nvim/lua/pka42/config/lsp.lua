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
        { 'L3MON4D3/LuaSnip' },

        --Fidget
        {"j-hui/fidget.nvim"},

        -- Snippets
        { 'rafamadriz/friendly-snippets' },
    },
    config = function()
        require("fidget").setup()
        local lsp_zero = require('lsp-zero')
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "gopls",
                "bashls",
            },
            handlers = {
                function(server_name)
                    require("lspconfig")[server_name].setup {}
                end
            },
            ["lua_ls"] = function ()
               local lspconfig = require("mason-lspconfig")
               lspconfig.lua_ls.setup {
                   settings = {
                       Lua = {
                           diagnostics = {
                               globals = { "vim" }
                           }
                       }
                   }
               }
           end,
        });

        local cmp = require('cmp')
        local cmp_select = { behavior = cmp.SelectBehavior.Select }
        local cmp_mappings = lsp_zero.defaults.cmp_mappings({
            ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
            ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
            ['<C-y>'] = cmp.mapping.confirm({ select = true }),
            ['<C-t>'] = cmp.mapping.confirm({ select = false }),
            ["<C-Space>"] = cmp.mapping.complete(),
        })

        cmp_mappings['<Tab>'] = nil
        cmp_mappings['<S-Tab>'] = nil


        lsp_zero.set_sign_icons({
                error = "",
                warn = "",
                hint = "󰋗",
                info = ""
        })

        lsp_zero.setup()

        vim.diagnostic.config({
            virtual_text = true
        })
    end
}

