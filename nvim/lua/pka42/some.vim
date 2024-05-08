filetype plugin indent on
au filetype php,phtml,rb call DisableIndent()

function! DisableIndent()
        set autoindent&
        set cindent&
        set smartindent&
        set indentexpr&
endfunction
