let mapleader = ' '
let maplocalleader=","

execute pathogen#infect()
set rtp+=$GOROOT/misc/vim
syntax on
filetype plugin indent on
set encoding=UTF-8

" polyglot
let g:polyglot_disabled = ['go']

call plug#begin()
" Lightline
Plug 'itchyny/lightline.vim'

" FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" File explorer
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'

" C
Plug 'kana/vim-operator-user'
Plug 'rhysd/vim-clang-format'
Plug 'bfrg/vim-cpp-modern'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'flazz/vim-colorschemes'
Plug 'justinmk/vim-syntax-extra'

" Go
Plug 'fatih/vim-go'

" Database connections
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'
Plug 'kristijanhusak/vim-dadbod-completion'

" themes
Plug 'morhetz/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'ghifarit53/tokyonight-vim'
Plug 'wadackel/vim-dogrun'

" LSP
Plug 'ycm-core/YouCompleteMe'
Plug 'vim-syntastic/syntastic'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Syntax highlighting
Plug 'sheerun/vim-polyglot'
Plug 'ap/vim-css-color'
Plug 'frazrepo/vim-rainbow'

" Misc
Plug 'tpope/vim-commentary'
Plug 'preservim/tagbar'
Plug 'mkitt/tabline.vim'
Plug 'mbbill/undotree'

" editing
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sensible'
Plug 'junegunn/goyo.vim'
Plug 'jiangmiao/auto-pairs'

" HTTP client
Plug 'nicwest/vim-http'

call plug#end()

" Basic options
set scrolloff=5
set mouse=a
set t_Co=256
set termguicolors
set title
set nofoldenable    " disable folding
set foldlevel=99
set nowrap
set splitright
set splitbelow
set cursorline
set colorcolumn=80
set noexpandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set autoindent
set cindent
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
set signcolumn=yes

set listchars=tab:\│\ 
set list

function! GitStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction
" set statusline+=%{GitStatus()}


nnoremap <leader>_ ddkP
nnoremap <leader>- ddp
nnoremap <silent> J :m .+1<CR>==
nnoremap <silent> K :m .-2<CR>==
vnoremap <silent> J :m '>+1<CR>gv=gv
vnoremap <silent> K :m '<-2<CR>gv=gv

" inoremap <C-X> <ESC>ddi
nnoremap <C-H> <C-W>h
nnoremap <C-L> <C-W>l
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k

nnoremap <leader>p :echo 'something printed'<CR>

nnoremap <leader>ev :rightbelow vsp $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>sc :source %<CR>

inoremap <C-U> <esc>viwUi
" to UPPER CASE
nnoremap <C-U> viwU

" replace <esc> with jk
inoremap jk <esc>

nnoremap <leader>" F a"<esc>f i"
vnoremap <leader>" :s/\%V\(.*\)/"\1"/<CR>

nnoremap H 0
nnoremap L $

nnoremap <leader>ss :w<CR>

autocmd FileType * set formatoptions-=cro
autocmd BufWritePre *.html :normal gg=G
autocmd BufNewFile,BufRead *.html setlocal nowrap 
autocmd FileType javascript nnoremap <buffer> <localleader>c I// <esc>
autocmd FileType python nnoremap <buffer> <localleader>c I# <esc>
" autocmd BufEnter *.go nnoremap <buffer> <localleader>c I// <esc>

autocmd FileType javascript iabbrev <buffer> iff if ()<left><left>
autocmd FileType python     iabbrev <buffer> iff if:<left><left>
" autocmd BufEnter *.go       iabbrev <buffer> <localleader>c I// <esc>

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

nnoremap <silent> <leader>lc :lclose<CR>
nnoremap <silent> <leader>lo :lopen<CR>
nnoremap <silent> <leader>lh :lnext<CR>
nnoremap <silent> <leader>ll :lprevious<CR>

nnoremap <silent> <leader>ch :cnext<CR>
nnoremap <silent> <leader>cl :cprevious<CR>

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
nnoremap } 5<C-W>>
" expand window from left side
nnoremap { 5<C-W><
" set to default window size 
nnoremap <leader>w= :wincmd =<CR>
" expand window from right side
nnoremap ( <C-W>+
" expand window from left side
nnoremap ) <C-W>-

" save and quit
nnoremap <leader>z ZZ

nnoremap <leader>N :setlocal number!<CR>
nnoremap <silent> <leader>sc :source %<CR>

nnoremap <leader>t; :rightbelow term<CR>

nnoremap <silent> <leader>x :%!xxd<CR>
nnoremap <silent> <leader>rx :%!xxd -r<CR>

" paste multiple times
xnoremap p pgvy

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

nnoremap <silent> <leader>tn :tabnew<CR>
nnoremap <silent> <leader>tc :tabclose<CR>
nnoremap <silent> <leader>th :tabprevious<CR>
nnoremap <silent> <leader>tl :tabnext<CR>

nnoremap <silent> <leader>f za
nnoremap <silent> <leader>] zo
nnoremap <silent> <leader>[ zc

nnoremap <silent> <leader>sf :Files<CR>
nnoremap <silent> <leader>sg :Rg<CR>
nnoremap <silent> <leader>sb :Buffers<CR>

nnoremap <silent> <leader>tb :TagbarToggle<CR>

nnoremap <silent> <leader>tt :terminal<CR>

nnoremap <leader>rl :RainbowLoad<CR>
nnoremap <leader>Y Du

nnoremap <silent> <leader>cf :%y+<CR>
nnoremap <silent> <C-E> :wincmd p<CR>

nmap <leader>/ gcc
vmap <leader>/ gc

nnoremap <silent> <leader>m :call Make()<CR>

fun! Make()
    write
    silent !clear
    make!
endf

" vim slow scrolling
set lazyredraw
set synmaxcol=160
syntax sync minlines=256

" colorscheme
colorscheme tokyonight
let g:lightline = {
  \ 'colorscheme': 'dogrun',
  \ }


augroup remember_folds
  autocmd!
  autocmd BufWinLeave *.* mkview
  autocmd BufWinEnter *.* silent! loadview
augroup END

" TODO: write a command that transform the current buffer to json by `jq` and writes the output to a new buffer
command JSON :call JSON_view()
fun! JSON_view()
    silent !clear
    !jq . %
endf

nnoremap <silent> <leader>jv :JSON<CR>

fun! JSON_generate()
    let output = '/tmp/generated.json'
    let fullpath = expand('%:p') 
    let bufnum = bufnr('%')
    exec 'e ' . output
    exec '%d'
    exec 'read ' . fullpath
    exec '%!jq .'
    w
    exec 'nnoremap <buffer> <CR> :b ' . bufnum . '<CR>'
endf

nnoremap <silent> <leader>jj :call JSON_generate()<CR>

" ================ Syntax ================

syn match CustomBraces display '[{}()\[\]]'
hi CustomBraces guifg=seagreen3


" =========== Plugins Options ===========

" Ctrl+P 
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_show_hidden = 1
let g:ctrlp_working_path_mode = ''
let g:ctrlp_tabpage_position = 'ac'
let g:ctrlp_prompt_mappings = {
\ 'AcceptSelection("e")': ['<c-v>'],
\ }


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
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
let NERDTreeMinimalUI=1
let g:NERDTreeWinSize=20

" YCM
let g:ycm_auto_hover=''
let g:ycm_always_populate_location_list = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_clangd_uses_ycmd_caching = 0
let g:ycm_use_clangd = 1
" let g:ycm_clangd_binary_path = exepath("clangd")
let g:ycm_clangd_args = ['-log=verbose', '-pretty']
" let g:ycm_filetype_blacklist = {
"   \ 'go': 1,
"   \ }

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

" syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_c_check_header = 1
let g:syntastic_c_auto_refresh_includes = 1
let g:syntastic_c_remove_include_errors = 1
let g:syntastic_c_errorformat = '%f:%l:%c: %trror: %m'
let g:syntastic_disabled_filetypes=['go']

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
let g:go_fmt_command = "goimports"
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

" Goyo
let g:goyo_width = 100

" C highlight
let g:cpp_function_highlight = 1
let g:cpp_attributes_highlight = 1
let g:cpp_member_highlight = 1
let g:cpp_simple_highlight = 1
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1
let g:cpp_no_function_highlight = 1
let c_no_curly_error=1

" rainbow parenthesis
" let g:rainbow_active = 1
let g:rainbow_guifgs = ['royalblue3', 'darkorange3', 'seagreen3', 'DeepPink3']
let g:rainbow_ctermfgs = ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta']

" nerdtree syntax highlight
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name
let g:NERDTreeLimitedSyntax = 1
let g:NERDTreeHighlightCursorline = 0
let g:WebDevIconsDisableDefaultFolderSymbolColorFromNERDTreeDir = 1
let g:WebDevIconsDisableDefaultFileSymbolColorFromNERDTreeFile = 1
let g:NERDTreeExtensionHighlightColor = {}

let s:blue = '00afff'
let g:NERDTreeExtensionHighlightColor['go'] = s:blue 

" clang format
" TODO: prevent long function break line
let g:clang_format#style_options = {
            \ "AlwaysBreakTemplateDeclarations" : "false",
            \ "AlignAfterOpenBracket": "false",
            \ "AllowShortFunctionsOnASingleLine": "None",
            \ "ColumnLimit": 0,
            \ "AllowShortBlocksOnASingleLine": "Empty",
            \ "AllowShortLoopsOnASingleLine": "true",
            \ "BreakBeforeBraces" : "Stroustrup"}

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<CR>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
" let g:SuperTabDefaultCompletionType = '<CR>'
let g:ycm_add_preview_to_completeopt = 1

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" undotree
nnoremap <F4> :UndotreeToggle<CR>
let g:undotree_WindowLayout = 3

" db ui
nnoremap <silent> <leader>db :DBUIToggle<CR>
let g:db_ui_win_position = 'right'
let g:db_ui_show_database_icon = 1
let g:db_ui_use_nerd_fonts = 1
" Source is automatically added, you just need to include it in the chain complete list
let g:completion_chain_complete_list = {
    \   'sql': [
    \    {'complete_items': ['vim-dadbod-completion']},
    \   ],
    \   'mysql': [
    \    {'complete_items': ['vim-dadbod-completion']},
    \   ],
    \ }
" Make sure `substring` is part of this list. Other items are optional for this completion source
let g:completion_matching_strategy_list = ['exact', 'substring']
" Useful if there's a lot of camel case items
let g:completion_matching_ignore_case = 1
autocmd FileType sql setlocal omnifunc=vim_dadbod_completion#omni
autocmd FileType mysql setlocal omnifunc=vim_dadbod_completion#omni


" ================= FILE TYPE ACTIONS ===============================
" file type detection
" FIXME: BufWrite doesn't work
augroup filetypedetect
    au! BufWritePost,BufRead,BufNewFile *.h setfiletype c
augroup END

" C
" TODO: use options to convert spaces to tabs instead of autocmd
augroup filetype_c
" clear the group for next sourcing the .vimrc
    autocmd! 
    autocmd BufWritePost *.c %retab!
    autocmd FileType c %retab!
    autocmd FileType c setlocal foldmethod=syntax
    autocmd FileType c nnoremap <silent> <C-]> :YcmCompleter GoTo<CR>
    " autocmd BufWrite *.c,*.h ClangFormat
    autocmd FileType c,h ClangFormatAutoEnable
    autocmd FileType c,h RainbowLoad
    autocmd FileType c,h inoremap <buffer> -- ->
    autocmd FileType c,h nnoremap <silent> <buffer> <localleader>c :YcmCompleter GoToCallers<CR> 
    autocmd FileType c,h nnoremap <buffer> <localleader>e :YcmCompleter RefactorRename 
    autocmd FileType c,h nnoremap <silent> <buffer> <leader><space> :YcmCompleter GetDoc<CR>
augroup END

" ================================================
" Go
" TODO: snippet code
" TODO: debugging with dlv
" TODO: go to next/previous error
" TODO: export environment variables
" TODO: prevent file trailing newline removal
" TODO: preserve latest search value for loop abbreviations
" TODO: preserve location list upon going to a reference
augroup filetype_go
    " clear the group for next sourcing the .vimrc
    autocmd! 
    autocmd FileType go nnoremap <silent> <localleader>tt :GoTestFile<CR>
    autocmd FileType go nnoremap <silent> <localleader>tf :GoTestFunc<CR>
    autocmd FileType go nnoremap <silent> <localleader>r :call GoCompileAndRun()<CR>
    autocmd FileType go nnoremap <silent> <localleader>e :GoRename<CR>
    autocmd FileType go nnoremap <localleader>b :GoDebugBreakpoint<CR>
    autocmd FileType go nnoremap <localleader>d :GoDebugStart<CR>
    autocmd FileType go nnoremap <buffer> <C-[> :GoReferrers<CR>
    autocmd FileType go nnoremap <silent> <buffer> <leader><space> :GoInfo<CR>
    autocmd FileType go set foldmethod=syntax
    autocmd FileType go iabbrev <buffer> :: :=
    autocmd FileType go iabbrev <buffer> !! !=
    autocmd FileType go iabbrev <buffer> !n != nil
    autocmd FileType go iabbrev <buffer> iferr if err != nil {<CR>}<ESC>O
    autocmd FileType go iabbrev <buffer> for for i := 0; i < num; i++ {<CR>}<ESC>k/num<CR>
    autocmd FileType go iabbrev <buffer> forr for i, v := range vs {<CR>}<ESC>k/vs<CR>
    autocmd FileType go iabbrev <buffer> ret return
    autocmd FileType go let g:syntastic_always_populate_loc_list = 0
    autocmd FileType go let g:syntastic_auto_loc_list = 0
augroup END

fun! GoCompileAndRun()
    write
    silent !clear
    GoRun
endf

augroup filetype_env
    " clear the group for next sourcing the .vimrc
    autocmd! 
    autocmd BufEnter *.env* setlocal ft=sh
augroup END

augroup filetype_nerdtree
    " clear the group for next sourcing the .vimrc
    autocmd! 
    autocmd FileType nerdtree set signcolumn=no
augroup END

