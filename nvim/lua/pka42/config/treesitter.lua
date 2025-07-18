return {
    "nvim-treesitter/nvim-treesitter",
    name = "treesitter",
    dependencies = {
        "nvim-treesitter/playground",
        "nvim-treesitter/nvim-treesitter-context",
    },
    config = function()
        vim.cmd[[TSUpdate]]
        require'nvim-treesitter.configs'.setup {
          -- A list of parser names, or "all" (the five listed parsers should always be installed)

          -- Install parsers synchronously (only applied to `ensure_installed`)
          sync_install = false,

          -- Automatically install missing parsers when entering buffer
          -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
          auto_install = true,

          -- List of parsers to ignore installing (for "all")

          ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
          -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!
          fold = {
            enable = false, 
          },

          highlight = {
            enable = true,

            -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
            -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
            -- the name of the parser)
            -- list of language that will be disabled
            additional_vim_regex_highlighting = true, 
          },
          indent = {
                enable = true,
                disable = {'python', 'html', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'go'},
          },
      }
    end
}
