let mapleader = ','
let g:mapleader = ','

" install bundles
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
elseif filereadable(expand("~/.config/nvim/vimrc.bundles")) " neovim
  source ~/.config/nvim/vimrc.bundles
endif

set ch=1
set stl=\ [File]\ %F%m%r%h%y[%{&fileformat},%{&fileencoding}]\ %w\ \ %h\ %=\ [Line]\ %l,%c\ %=\ %P
" set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
set ls=2
" set fileencoding=utf-8
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,gbk,default,latin1
set termencoding=utf-8
set ffs=unix,dos,mac
set formatoptions+=m
set formatoptions+=B

set history=2000
" detect filetype
filetype on
" indent based on filetype
filetype indent on
" allow plugin
filetype plugin on
" allow indent
filetype plugin indent on
" keep screen content after leave vim
" set t_ti= t_te=
set wildignore=*.swp,*.bak,*.pyc,*.class,.svn
set scr=12
set bg=dark
set spc=[.?!]\\_[\\])'\"\	\ ]\\+
set sps=best
set cindent
set ts=4
set sw=4
set si
syntax enable
set showmatch
set matchtime=2
set cursorline
set cursorcolumn
set clipboard=unnamed
" set mouse=a
set selection=exclusive
" set selectmode=mouse,key
set magic
" set smarttab
set lbr
" colorscheme desert
" colorscheme vividchalk
set autochdir
set noerrorbells
set expandtab
set autoindent
set smartindent
set backspace=indent,start
" set backspace=eol,start,indent
" show current line/column
" set ruler
" show command in status line
set showcmd
" show current mode in status line
set showmode
" set scrolloff=7
imap <C-l> <Esc>la
imap <C-h> <Esc>ha
" set foldmethod=indent
" set foldlevel=90
" nnoremap <space> za
set hlsearch
set incsearch
set ignorecase
set foldenable
" 折叠方法
" manual    手工折叠
" indent    使用缩进表示折叠
" expr      使用表达式定义折叠
" syntax    使用语法定义折叠
" diff      对没有更改的文本进行折叠
" marker    使用标记进行折叠, 默认标记是 {{{ 和 }}}
set foldmethod=indent
set foldlevel=99
let g:FoldMethod = 0
map <leader>zz :call ToggleFold()<cr>
fun! ToggleFold()
    if g:FoldMethod == 0
        exe "normal! zM"
        let g:FoldMethod = 1
    else
        exe "normal! zR"
        let g:FoldMethod = 0
    endif
endfun

" Refer: http://sunaku.github.io/vim-256color-bce.html
if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

au FileType css,scss,html,vim,javascript setl shiftwidth=2
au FileType css,scss,html,vim,javascript setl tabstop=2
autocmd FileType python set tabstop=4 shiftwidth=4 expandtab ai
autocmd FileType ruby,javascript,html,css,xml set tabstop=2 shiftwidth=2 softtabstop=2 expandtab ai
autocmd BufRead,BufNewFile *.md,*.mkd,*.markdown set filetype=markdown.mkd
autocmd BufRead,BufNewFile *.part set filetype=html
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript tabstop=2 shiftwidth=2 softtabstop=2 expandtab ai


au BufNewFile,BufRead *.py,*.pyw setf	python
" let g:neocomplcache_enable_at_startup = 1

" function! CHANGE_CURR_DIR()
	" let _dir = expand("%:p:h")
	" exec "cd " . _dir
	" unlet _dir
" endfunction
" autocmd BufEnter * call CHANGE_CURR_DIR()

set t_Co=256
lan en_US.UTF-8

""switch number on or off
nnoremap <silent><C-n> :set invnu<CR>
set completeopt=longest,menu
set wildmenu
" set wildignore=*.o,*~,*.pyc,*.class

autocmd InsertLeave * if pumvisible() == 0|pclose|endif
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
" In the quickfix window, <CR> is used to jump to the error under the
" cursor, so undefine the mapping there.
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
" quickfix window  s/v to open in split window,  ,gd/,jd => quickfix window => open it
autocmd BufReadPost quickfix nnoremap <buffer> v <C-w><Enter><C-w>L
autocmd BufReadPost quickfix nnoremap <buffer> s <C-w><Enter><C-w>K
" command-line window
autocmd CmdwinEnter * nnoremap <buffer> <CR> <CR>
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" au InsertLeave * set nopaste
nnoremap / /\v
vnoremap / /\v
" no highlight search
noremap <silent><leader>/ :nohls<CR>
nnoremap [b :bprevious<cr>
nnoremap ]b :bnext<cr>
" noremap <left> :bp<CR>
" noremap <right> :bn<CR>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprev<cr>
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>
" vnoremap <leader>y "+y
" w!! to sudo & write a file
cmap w!! w !sudo tee >/dev/null %

if has("autocmd")
  " Highlight TODO, FIXME, NOTE, etc.
  if v:version > 701
    autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|CHANGED\|DONE\|XXX\|BUG\|HACK\)')
    autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\|NOTICE\)')
  endif
endif

" set relativenumber number
" au FocusLost * :set norelativenumber number
" au FocusGained * :set relativenumber
" autocmd InsertEnter * :set norelativenumber number
" autocmd InsertLeave * :set relativenumber
" function! NumberToggle()
"   if(&relativenumber == 1)
"     set norelativenumber number
"   else
"     set relativenumber
"   endif
" endfunc
" nnoremap <Leader>n :call NumberToggle()<cr>
"
" Set extra options when running in GUI mode
if has("gui_running")
    set guifont=Monaco:h14
    if has("gui_gtk2")   "GTK2
        set guifont=Monaco\ 12,Monospace\ 12
    endif
    set guioptions-=T
    set guioptions+=e
    set guioptions-=r
    set guioptions-=L
    set guitablabel=%M\ %t
    set showtabline=1
    set linespace=2
    set noimd
    set t_Co=256
endif



" theme
set background=dark
set t_Co=256

hi! link SignColumn   LineNr
hi! link ShowMarksHLl DiffAdd
hi! link ShowMarksHLu DiffChange

" for error highlight
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Python comment
function InsertPythonComment()
    exe 'normal'.1.'G'
    let line = getline('.')
    if line =~ '^#!.*$' || line =~ '^#.*coding:.*$'
        return
    endif
    normal O
    call setline('.', '#!/usr/bin/env python')
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
" au FileType python map <A-F4> :call InsertPythonComment()<cr>
let g:python_author = 'Jiadi Yue'
let g:python_email  = 'jdyue19@gmail.com'

"""""""""""""""virtualenv start"""""""""""""""""""""""""""""
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF
"""""""""""""""virtualenv end"""""""""""""""""""""""""""""
" A buffer becomes hidden when it is abandoned
set hidden
set wildmode=list:longest
set ttyfast
nnoremap <leader>v V`}


" colorscheme solarized
colorscheme molokai

" http://stackoverflow.com/questions/13194428/is-better-way-to-zoom-windows-in-vim-than-zoomwin
" Zoom / Restore window.
function! s:ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
        execute t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction
command! ZoomToggle call s:ZoomToggle()
nnoremap <silent> <Leader>z :ZoomToggle<CR>


" set ofu=syntaxcomplete#Complete
" autocmd FileType php set omnifunc=phpcomplete#CompletePHP
" autocmd FileType c set omnifunc=ccomplete#Complete
" autocmd FileType python set omnifunc=pythoncomplete#Complete
" autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
" autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
" autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
" autocmd FileType css,scss set omnifunc=csscomplete#CompleteCSS
" autocmd FileType java set omnifunc=javacomplete#Complete

" add tags path
" set tags=./tags,./../tags,./*/tags,./../../tags


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" """"""""""""""The-NERD-tree"""""""""""""""""""
" " map <F10> :NERDTreeToggle<CR>
" nnoremap <C-j> :NERDTreeToggle<CR>
"
" """"""""""""""taglist"""""""""""""""""""""""""
" " map <silent> <F11> :TlistToggle<CR>
" nnoremap <C-k> :TlistToggle<CR>
" let Tlist_Auto_Highlight_Tag = 1
" let Tlist_Auto_Open = 0
" let Tlist_Auto_Update = 1
" let Tlist_Close_On_Select = 0
" let Tlist_Compact_Format = 0
" let Tlist_Display_Prototype = 0
" let Tlist_Display_Tag_Scope = 1
" let Tlist_Enable_Fold_Column = 0
" let Tlist_Exit_OnlyWindow = 0
" let Tlist_File_Fold_Auto_Close = 0
" let Tlist_GainFocus_On_ToggleOpen = 1
" let Tlist_Hightlight_Tag_On_BufEnter = 1
" let Tlist_Inc_Winwidth = 0
" let Tlist_Max_Submenu_Items = 1
" let Tlist_Max_Tag_Length = 30
" let Tlist_Process_File_Always = 0
" let Tlist_Show_Menu = 0
" let Tlist_Show_One_File = 0
" let Tlist_Sort_Type = "order"
" let Tlist_Use_Horiz_Window = 0
" let Tlist_Use_Right_Window = 1
" let Tlist_WinWidth = 40
" let tlist_php_settings = 'php;c:class;i:interfaces;d:constant;f:function'
"
" """"""""""""""taglist"""""""""""""""""""""""""
" let g:C_Ctrl_j   = 'off'
"
" """"""""""""""Pydiction"""""""""""""""""""""""""
" "let g:pydiction_location = '~/.vim/bundle/Pydiction/complete-dict'
"
" """"""""""""""vim-powerline"""""""""""""""""""""""""
" ""let g:Powerline_symbols='unicode'
"
" """"""""""""""SimpylFold"""""""""""""""""""""""""""
" let g:SimpylFold_docstring_preview=1
"
"
"
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""
" """"""""""""""""""""""""For  vundle"""""""""""""""""""""
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""
" set nocompatible
" filetype off
" set rtp+=~/.vim/bundle/vundle/
" call vundle#rc()
" Bundle 'gmarik/vundle'
"
" """"""""""""""""""""""""vim script rep""""""""""""""""""
" Bundle 'The-NERD-tree'
" Bundle 'vividchalk.vim'
" colorscheme vividchalk
" Bundle 'taglist.vim'
" Bundle 'Emmet.vim'
" Bundle 'c.vim'
" Bundle 'python.vim'
" Bundle 'bash-support.vim'
" Bundle 'ervandew/supertab'
" Bundle 'Gundo'
" map <C-h> :GundoToggle<CR>
" Bundle 'Tagbar'
" map <C-l> :TagbarToggle<CR>
" let g:tagbar_autofocus = 1
" "Bundle 'ctrlp.vim'
" Bundle 'actionscript.vim'
" augroup filetypedetect
"   au! BufNewFile,BufRead *.as setf actionscript
" augroup END
" "Bundle 'SimpylFold'
"
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""
" filetype plugin indent on
"
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""
" """"""""""""""""""""""""For  vundle end"""""""""""""""""
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""
