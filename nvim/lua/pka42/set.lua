vim.opt.guicursor=""
vim.opt.nu=true
vim.opt.relativenumber=true

vim.o.tabstop=4
vim.o.softtabstop=4
vim.o.shiftwidth=4
vim.o.expandtab=true

--vim.o.smartindent=true
--vim.o.indentexpr=true

vim.opt.wrap=false

vim.opt.swapfile=false
vim.opt.backup=false
vim.opt.undodir=os.getenv("HOME").."/.vim/undodir"
vim.opt.undofile=true

vim.opt.hlsearch=true
vim.opt.incsearch=true

vim.opt.termguicolors=true

vim.opt.scrolloff=8
vim.opt.signcolumn="yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime=50

vim.opt.colorcolumn="80"


