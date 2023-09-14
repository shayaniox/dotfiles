let mapleader = ' '
let maplocalleader=","

execute pathogen#infect()
set rtp+=$GOROOT/misc/vim
syntax on
filetype plugin indent on


" polyglot
let g:polyglot_disabled = ['go']

call plug#begin()
" Lightline
Plug 'itchyny/lightline.vim'

" FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Go
Plug 'fatih/vim-go'

" Database connections
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'
Plug 'kristijanhusak/vim-dadbod-completion'

" themes
Plug 'junegunn/goyo.vim'
Plug 'morhetz/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'ghifarit53/tokyonight-vim'

" LSP
Plug 'ycm-core/YouCompleteMe'

" Syntax highlighting
Plug 'sheerun/vim-polyglot'

" Misc
Plug 'tpope/vim-commentary'
Plug 'preservim/tagbar'

Plug 'mkitt/tabline.vim'
Plug 'mbbill/undotree'

call plug#end()

" Basic options
set scrolloff=5
set termguicolors
set title
set nofoldenable    " disable folding
set foldlevel=99
set nowrap
set splitright
set splitbelow
set cursorline
set colorcolumn=80
set expandtab
set shiftwidth=4
set tabstop=4
set autoindent
set fo-=cro
set nocompatible
set hlsearch
set incsearch
set laststatus=2
" Status line
set statusline=%F
set statusline+=\ -\ 
set statusline+=FileType\ 
set statusline+=%y
set statusline+=%m
set statusline+=%=
set statusline+=%l
set statusline+=/
set statusline+=%L
set statusline+=\ 

nnoremap <leader>_ ddkP
nnoremap <leader>- ddp
nnoremap J :m .+1<CR>==
nnoremap K :m .-2<CR>==
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

inoremap <C-X> <ESC>ddi
nnoremap <C-H> <C-W>h
nnoremap <C-L> <C-W>l
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k

nnoremap <leader>p :echo 'something printed'<CR>

nnoremap <leader>ev :rightbelow vsp $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

inoremap <C-U> <esc>viwUi
" to UPPER CASE
nnoremap <C-U> viwU

" replace <esc> with jk
inoremap jk <esc>

" iabbrev @ shayan@gmail.com

nnoremap <leader>" F a"<esc>f i"
vnoremap <leader>" :s/\%V\(.*\)/"\1"/<CR>

nnoremap H 0
nnoremap L $

nnoremap <leader>ss :w<CR>

autocmd BufWritePre *.html :normal gg=G
autocmd BufNewFile,BufRead *.html setlocal nowrap 
autocmd FileType javascript nnoremap <buffer> <localleader>c I// <esc>
autocmd FileType python nnoremap <buffer> <localleader>c I# <esc>
" autocmd BufEnter *.go nnoremap <buffer> <localleader>c I// <esc>

autocmd FileType javascript iabbrev <buffer> iff if ()<left><left>
autocmd FileType python     iabbrev <buffer> iff if:<left><left>
" autocmd BufEnter *.go       iabbrev <buffer> <localleader>c I// <esc>

nnoremap <buffer> <leader>m :messages<CR>

augroup filetype_html
autocmd!
autocmd FileType html nnoremap <buffer> <localleader>f Vatzf
augroup END

onoremap p i(
onoremap b /return<CR>
onoremap in( :<C-U>normal! f(vi(<CR>| " inside paranthesis

onoremap ih :execute "normal ?^--\\+\\\\|==\\+$\r:nohlsearch\rkvg_"<CR>| " inside header
onoremap ah :execute "normal ?^--\\+\\\\|==\\+$\r:nohlsearch\rg_vk0"<CR>|  " around header

nnoremap <leader>re :e %<CR>

nnoremap <leader>cl 0vg_"+y| " copy line
vnoremap <leader>cc "+y|     " copy

" VimScript file settings -------------------------- {{{
augroup filetype_vim
autocmd!
autocmd FileType vim setlocal foldmethod=indent
augroup END 
" }}}

let @a = "hello"
let &number = 1

nnoremap <leader>tp G100<C-E>

nnoremap <leader>\ :vsp<CR>

nnoremap <leader>; :execute "normal! mqA;\e`q"<CR>

" very magic search
nnoremap <leader>v /\v

" open file vertically
nnoremap <leader>ov :rightbelow vsp 
" open file horizontally
nnoremap <leader>oh :rightbelow sp 

nnoremap <leader>oo o<esc>

" expand window from right side
nnoremap } <C-W>>
" expand window from left side
nnoremap { <C-W><
" set to default window size 
nnoremap <leader>w= :wincmd =<CR>

" save and quit
nnoremap <leader>z ZZ

nnoremap <leader>N :setlocal number!<CR>
nnoremap <silent> <leader>sc :source %<CR>

nnoremap <leader>t; :rightbelow term<CR>

" Ctrl+P 
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_show_hidden = 1
let g:ctrlp_working_path_mode = ''
let g:ctrlp_tabpage_position = 'ac'
" let g:ctrlp_prompt_mappings = {
" \ 'AcceptSelection("e")': ['<c-v>'],
" \ }


" NerdTree
" nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <silent> <leader>n :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
 " Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd StdinReadPre * let s:std_in=1
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeMinimalUI=1
let g:NERDTreeWinSize=20

" colorscheme
colorscheme tokyonight
let g:lightline = {
  \ 'colorscheme': 'dogrun',
  \ }

" open terminal vertically
nnoremap <silent> <leader>tv :rightbelow vertical terminal<CR>
" open terminal horizontally
nnoremap <silent> <leader>th :rightbelow terminal<CR>

" upper case currect word
nnoremap <leader>U viwU
" lower case currect word
nnoremap <leader>u viwu

nnoremap <silent> <leader>; :Goyo<CR>

nnoremap <silent> <leader>bh :bprevious<CR>
nnoremap <silent> <leader>bl :bnext<CR>

nnoremap <silent> <leader>th :tabprevious<CR>
nnoremap <silent> <leader>tl :tabnext<CR>

nnoremap <silent> <leader>f za
nnoremap <silent> <leader>[ zo
nnoremap <silent> <leader>] zc

nnoremap <silent> <leader>sf :Files<CR>
nnoremap <silent> <leader>sg :Rg<CR>
nnoremap <silent> <leader>sb :Buffers<CR>

nnoremap <silent> <leader>tb :TagbarToggle<CR>

nmap <leader>/ gcc
vmap <leader>/ gc

augroup remember_folds
  autocmd!
  autocmd BufWinLeave *.* mkview
  autocmd BufWinEnter *.* silent! loadview
augroup END

" Plugins Options

" YCM
let g:ycm_auto_hover=''
let g:ycm_always_populate_location_list = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1

" Tagbar
let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }

" vim-go
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_doc_keywordprg_enabled = 0
let g:go_debug_windows = {
      \ 'vars':       'rightbelow 60vnew',
      \ 'stack':      'rightbelow 10new',
\ }
let g:go_test_windows = {
      \ 'vars':       'rightbelow 60vnew',
      \ 'stack':      'rightbelow 10new',
\ }
" let g:go_debug=['shell-commands']


" ================================================
" C
let c_out="./a.out"
augroup filetype_c
" clear the group for next sourcing the .vimrc
    autocmd! 
    autocmd FileType c nnoremap <localleader>r :call CCompileAndRun()<CR>
augroup END

fun! CCompileAndRun()
    write
    silent !clear
    silent execute "!gcc -o " . g:c_out . " " . expand("%:p")
    execute "!" . g:c_out
    silent execute "!rm " . g:c_out
endf

" ================================================
" Go
" TODO: snippet code
" TODO: debugging with dlv
" TODO: go to next/previous error
" TODO: export environment variables
" TODO: prevent file trailing newline removal
" TODO: preserve latest search value for loop abbreviations
augroup filetype_go
    " clear the group for next sourcing the .vimrc
    autocmd! 
    autocmd FileType go nnoremap <silent> <localleader>r :call GoCompileAndRun()<CR>
    autocmd FileType go nnoremap <localleader>b :GoDebugBreakpoint<CR>
    autocmd FileType go nnoremap <localleader>d :GoDebugStart<CR>
    autocmd FileType go nnoremap <buffer> <C-[> :GoReferrers<CR>
    autocmd FileType go set foldmethod=syntax
    autocmd FileType go iabbrev <buffer> iferr if err != nil {<CR>}<ESC>O
    autocmd FileType go iabbrev <buffer> for for i := 0; i < num; i++ {<CR>}<ESC>k/num<CR>
    autocmd FileType go iabbrev <buffer> forr for i, v := range vs {<CR>}<ESC>k/vs<CR>
    autocmd FileType go iabbrev <buffer> ret return
augroup END

fun! GoCompileAndRun()
    write
    silent !clear
    GoRun
endf
