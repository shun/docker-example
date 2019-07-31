if &compatible
  set nocompatible
endif

let mapleader = "\<Space>"
augroup GlobalAutoCmd
  autocmd!
augroup END
command! -nargs=* Gautocmd   autocmd GlobalAutoCmd <args>
command! -nargs=* Gautocmdft autocmd GlobalAutoCmd FileType <args>


let g:config_dir = ""
let g:cache_dir = ""
let s:config_home = expand('$HOME/.vim')
let s:cache_home = expand('$HOME/.cache/dein')


if s:config_home != expand("$XDG_CONFIG_HOME")
  if !isdirectory(s:config_home)
    call mkdir(s:config_home)
  endif
  let g:config_dir = s:config_home
else
  let g:config_dir = expand("$XDG_CONFIG_HOME") . '/.vim'
endif

if s:cache_home != expand("$XDG_CACHE_HOME")
  if !isdirectory(s:cache_home)
    call mkdir(s:cache_home, 'p')
  endif
  let g:cache_dir = s:cache_home
else
  let g:cache_dir = expand("$XDG_CACHE_HOME") . '/dein'
endif

" ---------------------------------------------------------
" | setting

set cindent
set clipboard+=unnamedplus
set completeopt-=preview
set cursorline
set encoding=utf-8
set expandtab
set fileencodings=utf-8,sjis,iso-2022-jp,euc-jp
set fileformats=unix,mac,dos
set hidden
set hlsearch
set ignorecase
set list
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
"set mouse=a
set nobackup
"set noincsearch
set noswapfile
set nowrapscan
set nu
"set relativenumber
set ruler
set scrolloff=8
set shiftwidth=4
set showcmd
set showmatch
set smartcase
set softtabstop=0
set t_Co=256
set tabstop=4
set ttimeout
set ttimeoutlen=50
set wildignorecase
set wildmode=longest,full
autocmd InsertLeave * set nopaste


" highlight color
highlight CursorLine    term=reverse cterm=none                 ctermbg=235
highlight Comment                               ctermfg=35
highlight Statement                             ctermfg=Cyan
highlight Search                                ctermfg=White   ctermbg=141
highlight Visual                                ctermfg=White   ctermbg=4
highlight LineNr                                ctermfg=248     ctermbg=234
highlight CursorLineNr                          ctermfg=0       ctermbg=216
highlight PreProc                               ctermfg=141
highlight Special                               ctermfg=141
highlight cSpecial                              ctermfg=141
highlight Pmenu                                 ctermfg=255     ctermbg=238
highlight PmenuSel                              ctermfg=255     ctermbg=19
highlight Type                                  ctermfg=Cyan
highlight Constant                              ctermfg=1
highlight Conceal                               ctermfg=242
highlight MatchParen                 cterm=bold ctermfg=White   ctermbg=26
highlight SpecialKey                            ctermfg=242
highlight DiffChange                            ctermfg=Black   ctermbg=84
highlight DiffAdd                               ctermfg=Black   ctermbg=84
highlight DiffDelete                            ctermfg=Black   ctermbg=218
highlight DiffText                              ctermfg=Black   ctermbg=192
highlight SpellBad                              ctermfg=Black   ctermbg=Red
highlight SpellCap                              ctermfg=Black   ctermbg=Red
highlight NonText                               ctermfg=239

if has("autocmd")
  filetype plugin on
  filetype indent on
  "sw=softtabstop, sts=shiftwidth, ts=tabstop, et=expandtab
  autocmd FileType c           setlocal sw=4 sts=4 ts=4 et
  autocmd FileType python      setlocal sw=4 sts=4 ts=4 et
  autocmd FileType json        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType html        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType css         setlocal sw=2 sts=2 ts=2 et
  autocmd FileType javascript  setlocal sw=2 sts=2 ts=2 et
  autocmd FileType js          setlocal sw=2 sts=2 ts=2 et
endif

filetype plugin indent on

" ---------------------------------------------------------
" | Keybindings

" nomal/visual mode
map <silent> <F3> :<C-u>setlocal relativenumber!<cr>
nmap <ESC><ESC> :noh<cr>
nnoremap ,tn :tabnew<cr>
nnoremap <Leader>Q :bd!<cr>
nnoremap <Leader>q :bd<cr>
nnoremap <Leader>w :w<cr>
nnoremap <S-i> i <ESC><Right>
nnoremap <silent><C-h> :tabprevious<cr>
nnoremap <silent><C-l> :tabnext<cr>
nnoremap <silent><C-k> d$
nnoremap <silent>J n
nnoremap <silent>K N
nnoremap <silent>gr/ :set hlsearch<cr>
nnoremap <silent>j gj
nnoremap <silent>k gk
nnoremap Q <Nop>
nnoremap QQ :q<cr>
nnoremap g/ /
nnoremap gj j
nnoremap gk k
noremap <C-e> <END>
noremap <silent><C-a> :call <SID>home()<cr>

noremap H <C-w>h
noremap J <C-w>j
noremap K <C-w>k
noremap L <C-w>l

" insert mode
inoremap jj <ESC>
inoremap <C-c> <ESC>
inoremap <C-a> <HOME>
inoremap <C-e> <END>
inoremap <C-p> <UP>
inoremap <C-n> <DOWN>
inoremap <C-f> <RIGHT>
inoremap <C-b> <LEFT>
inoremap <C-j> <RETURN>

" visual mode

" console mode
cnoremap <C-a> <Home>
cnoremap <C-b> <Left>
cnoremap <C-d> <Delete>
cnoremap <C-e> <End>
cnoremap <C-f> <Right>
cnoremap <C-n> <Down>
cnoremap <C-p> <Up>

" terminal
tnoremap <Esc> <C-\><C-n>

function! s:home()
    let start_column = col('.')
    normal! ^
    if col('.') == start_column
        normal! 0
    endif
    return ''
endfunction

" Start dein Scripts ------------------------------

let s:dein_dir = g:cache_dir . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if !isdirectory(s:dein_repo_dir)
  execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif
execute 'set runtimepath^=' . s:dein_repo_dir

let g:dein#install_log_filename = '/tmp/dein.log'
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  let s:toml = g:config_dir . '/dein.toml'

  call dein#load_toml(s:toml,      {'lazy' : 0})

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
    call dein#install()
    call dein#remote_plugins()
endif

" End dein Scripts ------------------------------
"
syntax on
if executable('pyls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
endif
