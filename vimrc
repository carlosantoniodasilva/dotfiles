source ~/.vim/vimrc

"set cursorline
"set cursorcolumn
set linespace=1
set showbreak=…
set tabstop=2
"set list listchars=tab:»·,trail:·
set colorcolumn=80

" automatically remove trailing whitespace before write
"function! StripTrailingWhitespace()
"  normal mZ
"  %s/\s\+$//e
"  if line("'Z") != line(".")
"    echo "Stripped whitespace\n"
"  endif
"  normal `Z
"endfunction
"autocmd BufWritePre *.rb,*.erb,*.yml,Gemfile,README*,*.css,*.js,*.html,*.txt :call StripTrailingWhitespace()

if has("gui_running")
    set columns=160

    if has("gui_mac") || has("gui_macvim")
        set guifont=Monaco:h12
        " key binding for Command-T to behave properly
        " uncomment to replace the Mac Command-T key to Command-T plugin
        "macmenu &File.New\ Tab key=<nop>
        "map <D-t> :CommandT<CR>
        " make Mac's Option key behave as the Meta key
    endif
endif

