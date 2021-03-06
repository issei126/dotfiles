if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath^=~/.vim/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin(expand('~/.vim'))
" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('tomasr/molokai')
call dein#add('ujihisa/unite-colorscheme')
call dein#add('Shougo/neocomplete')
call dein#add('Shougo/unite.vim')
call dein#add('vim-scripts/ZenCoding.vim')
call dein#add('tpope/vim-rails')
call dein#add('tpope/vim-dispatch')
call dein#add('thoughtbot/vim-rspec')
call dein#add('scrooloose/nerdtree')
call dein#add('scrooloose/syntastic')
call dein#add('vim-scripts/taglist.vim')
call dein#add("altercation/vim-colors-solarized")
call dein#add('Shougo/neosnippet')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('thinca/vim-quickrun' )
call dein#add('Yggdroot/indentLine')
call dein#add('elzr/vim-json')
call dein#add('tpope/vim-endwise')
call dein#add('Shougo/vimshell.vim')
call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
call dein#add('tpope/vim-fugitive')
call dein#add('cohama/lexima.vim')
call dein#add('osyo-manga/vim-monster')
call dein#add('tpope/vim-surround') 
" You can specify revision/branch/tag.
call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

autocmd ColorScheme * highlight lineNr guifg=#adfa2f

" Required:
call dein#end()

" Required:
filetype plugin indent on

"If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

set nocompatible
filetype off
""" pathogen をコメントアウト
" call pathogen#runtime_append_all_bundles()
" call pathogen#helptags()
" set helpfile=$VIMRUNTIME/doc/help.txt

let g:syntastic_check_on_open = 0
let g:syntastic_enable_signs = 1
let g:syntastic_echo_current_error = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_enable_highlighting = 1
let g:syntastic_mode_map = { 'mode': 'active_filetypes',
            \ 'active_filetypes': ['ruby'] }
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_javascript_checkers = ['jshint']

" indentLine
let g:indentLine_color_term = 111
let g:indentLine_color_gui = '#708090'
" let g:indentLine_char = '' "use ¦, ┆ or │
let g:indentLine_char = '¦'

" for neosnippet
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
 
" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"
 
" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

"let g:solarized_termcolors=256
set t_Co=256
set t_Sf=[3%dm
set t_Sb=[4%dm
syntax enable
set background=dark
colorscheme molokai
" unite.vim
" 入力モードで開始する
" let g:unite_enable_start_insert=1
" バッファ一覧
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" レジスタ一覧
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
" 常用セット
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
" 全部乗せ
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

" Toggle NERDTRee
nnoremap <silent> ,nt :<C-u>NERDTreeToggle<CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q

" for coffeescript
autocmd BufWritePost *.coffee silent CoffeeMake! -cb | cwindow | redraw!

let twitvim_browser_cmd = 'firefox'

" for rspec-vim
let g:rspec_command = "Dispatch rspec {spec}"
nnoremap <silent> ,rc :call RunCurrentSpecFile()<CR>

" enable neocomplecache
let g:neocomplcache_enable_at_startup = 1

let Tlist_Ctags_Cmd = "/usr/local/bin/ctags"  " ctagsのコマンド
let Tlist_Show_One_File = 1                         " 現在表示中のファイルのみのタグしか表示しない
let Tlist_Use_Right_Window = 1                    " 右側にtag listのウインドうを表示する
let Tlist_Exit_OnlyWindow = 1                      " taglistのウインドウだけならVimを閉じる
map <silent> ,tl :TlistToggle<CR>     

set shiftwidth=2
set tabstop=2
set expandtab
set autoindent
set number
set ambiwidth=double

set list
set listchars=tab:»-,trail:_,eol:↲,extends:»,precedes:«,nbsp:%
"set list listchars=tab:\¦\ 

set splitright

set statusline=%F%m%r%h%w\%=[TYPE=%Y]\[FORMAT=%{&ff}]\[ENC=%{&fileencoding}]\[LOW=%l/%L]
set laststatus=2

set backspace=indent,eol,start

"タブ、空白、改行の可視化
"set list
set listchars=tab:>.,trail:_,eol:↲,extends:>,precedes:<,nbsp:%

"全角スペースをハイライト表示
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction
   
if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme       * call ZenkakuSpace()
        autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
    augroup END
    call ZenkakuSpace()
endif

"for json quotation visible"
let g:vim_json_syntax_conceal = 0

set foldmethod=indent
set foldlevel=4
set foldcolumn=3

set tags=./tags
nnoremap <F3> :<C-u>tab stj <C-R>=expand('<cword>')<CR><CR>

"enable to use mouse
set mouse=a

set breakindent

" lexima settings
call lexima#init()
call lexima#add_rule({'char': '(', 'at': '\%#.', 'delete':1})
call lexima#add_rule({'char': '[', 'at': '\%#.', 'delete':1})
call lexima#add_rule({'char': '{', 'at': '\%#.', 'delete':1})
call lexima#add_rule({'char': '"', 'at': '\%#.', 'delete':1})

" neocomplete settings
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent><CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  "return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {
        \   "ruby" : '[^. *\t]\.\w*\|\h\w*::',
        \}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" Set tabline.
function! MyTabLine()  "{{{
  let s = ''
  for i in range(1, tabpagenr('$'))
    let bufnrs = tabpagebuflist(i)
    let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears
    let no = i  " display 0-origin tabpagenr.
    let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
    let title = pathshorten(fnamemodify(bufname(bufnr), ':p:~'))
    let title = '[' . title . ']'
    let s .= '%'.i.'T'
    let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
    let s .= no . ':' . title
    let s .= mod
    let s .= '%#TabLineFill# '
  endfor
  let s .= '%#TabLineFill#%T%=%#TabLine#'
  return s
endfunction "}}}
set tabline=%!MyTabLine()
set showtabline=2 " 常にタブラインを表示

