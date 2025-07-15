return {
  "rose-pine/neovim",
  name = "rose-pine",
  config = function()
    require("rose-pine").setup({
      disable_background = false, -- Enables transparency
    })
    vim.cmd("colorscheme rose-pine")
  end,
}

