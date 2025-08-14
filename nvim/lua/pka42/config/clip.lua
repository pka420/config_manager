return {
  {
    "ojroques/vim-oscyank",
    config = function()
      -- Map `y` in visual mode to also send to local clipboard
      vim.api.nvim_set_keymap("v", "<leader>y", ":OSCYank<CR>", { noremap = true, silent = true })
      
      -- Optionally: map to yank to system clipboard by default
      vim.cmd([[
        augroup OSCYank
          autocmd!
          autocmd TextYankPost * if v:event.operator ==# 'y' && v:event.regname == '' | execute 'OSCYankRegister "' | endif
        augroup END
      ]])
    end
  }
}

