return {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},

      -- Snippets
      {'rafamadriz/friendly-snippets'},
    },
    config = function()
        local lsp = require('lsp-zero')
        require("mason").setup()

        lsp.preset('recommended')

        local cmp = require('cmp')
        local cmp_select = {behavior = cmp.SelectBehavior.Select}
        local cmp_mappings = lsp.defaults.cmp_mappings({
          ['<Up>'] = cmp.mapping.select_prev_item(cmp_select),
          ['<Down>'] = cmp.mapping.select_next_item(cmp_select),
          ['<Enter>'] = cmp.mapping.confirm({ select = true }),
          ["<C-Space>"] = cmp.mapping.complete(),
        })

        cmp_mappings['<Tab>'] = nil
        cmp_mappings['<S-Tab>'] = nil


        lsp.set_preferences({
            suggest_lsp_servers = true,
            sign_icons = {
                error = 'E',
                warn = 'W',
                hint = 'H',
                info = 'I'
            }
        })

        lsp.on_attach(function(client, bufnr)
          local opts = {buffer = bufnr, remap = false}

          vim.keymap.set("n", "gf", function() vim.lsp.buf.definition() end, opts)
          vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
          vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
          vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
          vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
          vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
          vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
          vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
          vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
          vim.keymap.set("v", "<leader>h", function() vim.lsp.buf.signature_help() end, opts)
        end)

        lsp.setup()

        vim.diagnostic.config({
            virtual_text = true
        })
    end
}
