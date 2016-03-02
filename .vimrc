set nu
set expandtab
set shiftwidth=4
set autoindent
set softtabstop=4
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=b
set guioptions-=B
set cursorline
set cursorcolumn
set cindent
set hlsearch
set t_Co=256
let mapleader=","
"set gcr=a:blinkon0
colorscheme molokai

fun! ToggleFullScreen()
	call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")
endf

noremap <silent> <F11> :call ToggleFullScreen()<CR>

syntax on
syntax enable
if has("autocmd")
  au VimEnter,InsertLeave * silent execute '!echo -ne "\e[2 q"' | redraw!
  au InsertEnter,InsertChange *
    \ if v:insertmode == 'i' | 
    \   silent execute '!echo -ne "\e[6 q"' | redraw! |
    \ elseif v:insertmode == 'r' |
    \   silent execute '!echo -ne "\e[4 q"' | redraw! |
    \ endif
  au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif

""""""""""vundle start"""
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'wakatime/vim-wakatime'
"Plugin 'jeaye/color_coded'
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Valloric/ListToggle'
Plugin 'scrooloose/syntastic'
Plugin 'a.vim'
Plugin 'tell-k/vim-autopep8'
Plugin 'scrooloose/nerdtree'
Plugin 'crusoexia/vim-monokai'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'derekwyatt/vim-protodef'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'scrooloose/nerdcommenter'
Plugin 'xuhdev/SingleCompile'

call vundle#end()
filetype plugin indent on
""""""""""vundle end"""
let g:color_coded_filetypes=['c','cpp','objc','cc','cxx']



set guifont=Consolas\ 12
set path+=/usr/include/c++/5.2.1/
set path+=/usr/include/
set path+=/usr/local/include/

let g:airline_theme='papercolor'
let g:airline#extensions#tabline#enabled=0
let g:airline#extensions#tabline#show_buffers = 0
"let g:airline#extensions#tabline#tab_nr_type=2
let g:airline#extensions#bufferline#overwrite_variables=1
let g:bufferline_rotate=1
let g:airline#extensions#bufferline#enabled=1
let g:airline#extensions#syntastic#enabled=1
let g:airline#extensions#tagbar#enabled=1
let g:airline#extensions#ycm#enabled=1
let g:airline#extensions#ycm#error_symbol='E:'
let g:airline#extensions#ycm#warning_symbol='W:'
let g:airline#extensions#quickfix#quickfix_tex='Quickfix'
let g:airline#extensions#quickfix#location_text='Location'
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

"unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'		          
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.notexists ='∄'
let g:airline_symbols.whitespace ='Ξ'

let g:NERDTreeWinSize=30

let g:tagbar_width=30
nnoremap <silent> <F10> :TagbarToggle<CR>
nnoremap <silent> <F9> :NERDTreeToggle<CR>
nn <M-1> 1gt
nn <M-2> 2gt
nn <M-3> 3gt
nn <M-4> 4gt
nn <M-5> 5gt
nn <M-6> 6gt
nn <M-7> 7gt
nn <M-8> 8gt
nn <M-9> 9gt
nn <M-0> :tablast<CR>
highlight Pmenu ctermfg=81 ctermbg=233 guifg=Cyan guibg=#2E2E2E
highlight PmenuSel ctermfg=59 ctermbg=3 guifg=#005f87 guibg=#EEE8D5

"highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900
let g:ycm_complete_in_comments=1
set completeopt-=preview
let g:ycm_error_symbol='▶'
let g:ycm_warning_symbol='»'
"let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_always_populate_location_list = 1
nn <leader>i : YcmCompleter GoToInclude<CR>
nn <leader>dl : YcmCompleter GoToDeclaration<CR>
nn <leader>df : YcmCompleter GoToDefinition<CR>
au FileType cpp nnoremap <silent><F4> :YcmDiags<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options= '-std=c++11'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1

let g:protodefprotogetter='~/.vim/bundle/vim-protodef/pullproto.pl'
let g:disable_protodef_sorting=1

let g:pymode_rope_complete = 0

nnoremap [b :bprevious<CR>
nnoremap ]b :bnext<CR>
nnoremap <F5>: make<CR>
nnoremap  <leader>e :botright cwindow<CR>

let g:ycm_python_binary_path='/usr/bin/python3'
let g:syntastic_python_python_exe='python3'
noremap <silent><leader><ESC> : nohl<CR> 
autocmd BufRead *.py set makeprg=python3.5\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\" 
"autocmd BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m  
  
autocmd BufRead *.py set tabstop=4  
autocmd BufRead *.py set nowrap  

autocmd FileType cpp noremap <F8> : SCCompile<CR>
autocmd FileType python noremap <F5> : SCCompileRun <CR>
let g:python_highlight_all = 1
call SingleCompile#ChooseCompiler('python','python3')
call SingleCompile#SetCompilerTemplate('cpp','/home/luoyi/develop/bin/cpplint.py',
            \'Google Style Checker','/home/luoyi/develop/bin/cpplint.py','--verbose=3 --root=/home/luoyi','')
"call SingleCompile#SetOutfile('cpp','cpplint.py','nouseful'),
call SingleCompile#ChooseCompiler('cpp','/home/luoyi/develop/bin/cpplint.py')


function! CodeFormat()
    let lineNum=line(".")
    if &filetype == 'cpp'
        exec "%! astyle --style=google\ -p\ "
    else
        echo "NOT CPP FILE"
    endif

    exec lineNum
endfunction

nn <S-F> : call CodeFormat() <CR>

nn <leader>ad : call TitleDet() <CR>

function AddTitle()
    call append(0,"/*=================================================================")
    call append(1,"#")
    call append(2,"# Copyright ".strftime("%Y-2020"))
    call append(3,"#")
    call append(4,"# Author: luoyi 844262725@qq.com")
    call append(5,"#")
    call append(6,"# Last modified: ".strftime("%Y-%m-%d %H:%M"))
    call append(7,"#")
    call append(8,"# Filename: ".expand("%:t"))
    call append(9,"#")
    call append(10,"# Description: ")
    call append(11,"#")
    call append(12,"==================================================================*/")
    echohl WarningMsg | echo "Successful in adding the copyright." | echohl None
endf

function UpdateTitle()
    normal m'
    execute '/# *Last modified:/s@:.*$@\=strftime(":\t%Y-%m-%d %H:%M")@'
    normal ''
    normal mk
    execute '/# *Filename:/s@:.*$@\=":\t\t".expand("%:t")@'
    execute "noh"
    normal 'k
    echohl WarningMsg | echo "Successful in updating the copy right." | echohl None
endfunction

function TitleDet()
    let n=1
    "默认为添加
    while n < 10
        let line = getline(n)
        if line =~ '^\#\s*\S*Last\smodified:\S*.*$'
            call UpdateTitle()
            return
        endif
        let n = n + 1
    endwhile
    call AddTitle()
endfunction

function InsertPythonComment()
    exe 'normal'.1.'G'
    let line = getline('.')
    if line =~ '^#!.*$' || line =~ '^#.*coding:.*$'
        return
    endif
    normal O
    call setline('.', '#!/usr/bin/env python3')
    normal o
    call setline('.', '# -*- coding:utf-8 -*-')
    normal o
    call setline('.', '#')
    normal o
    call setline('.', '#   Author  :   '.g:python_author)
    normal o
    call setline('.', '#   E-mail  :   '.g:python_email)
    normal o
    call setline('.', '#   Date    :   '.strftime("%y/%m/%d %H:%M:%S"))
    normal o
    call setline('.', '#   Desc    :   ')
    normal o
    call setline('.', '#')
    normal o
    call cursor(7, 17)
endfunction
function InsertCommentWhenOpen()
    if a:lastline == 1 && !getline('.')
        call InsertPythonComment()
    end
endfunc
au FileType python :%call InsertCommentWhenOpen()
au FileType python map <F4> :call InsertPythonComment()<cr>

let g:python_author = 'luoyi'
let g:python_email = '844262725@qq.com'
colorscheme monokai

set tags=/home/luoyi/tags
