set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-commentary'
Plugin 'scrooloose/nerdtree'
" Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'luochen1990/rainbow'
Plugin 'elixir-lang/vim-elixir'
Plugin 'vim-scripts/Align'
Plugin 'vim-scripts/DeleteTrailingWhitespace'
Plugin 'rakr/vim-two-firewatch'
Plugin 'rust-lang/rust.vim'
Plugin 'cespare/vim-toml'
Plugin 'nanotech/jellybeans.vim'
Plugin 'ervandew/supertab'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'tpope/vim-surround'
Plugin 'derekwyatt/vim-scala'
Plugin 'groenewege/vim-less'
Plugin 'tpope/vim-fugitive'
Plugin 'craigemery/vim-autotag'
Plugin 'b0wter/spacecadet'
Plugin 'nightsense/seabird'
" Plugin 'vim-syntastic/syntastic'
Plugin 'fatih/vim-go'
Plugin 'reasonml-editor/vim-reason-plus'
Plugin 'junegunn/fzf'
Plugin 'noahfrederick/vim-hemisu'
Plugin 'mileszs/ack.vim'
Plugin 'w0rp/ale'
" Plugin 'fleischie/vim-styled-components'
call vundle#end()
filetype plugin indent on

set background=dark
let g:rehash256 = 1
syntax enable
" colorscheme hemisu

colorscheme jellybeans
let g:jellybeans_use_term_italics = 1
let g:jellybeans_overrides = {
      \  'background': { 'ctermbg': 'none', '256ctermbg': 'none' },
      \}

set t_Co=256
set autoread
set nobackup
set nowritebackup
set noswapfile
set autoindent
set number
set backspace=indent,eol,start
set backupcopy=yes
set nomodeline
set directory-=.
set hidden
set viminfo='1000,<0,@0,/0 " dont remeber things that can compromise data
set encoding=utf-8
set expandtab
set hlsearch
set incsearch
set ignorecase
set smartcase
set smarttab
set smartindent
set shiftround
set iskeyword+=-
set lazyredraw
set list
set listchars=tab:▸\ ,trail:▫
set scrolloff=3
set shiftwidth=2
set ttyfast
set fileformats=unix,mac,dos
set softtabstop=2
set wildmenu
set wildmode=longest,list,full
" set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set mouse=a
set mousefocus
set laststatus=2
set nowrap
set omnifunc=syntaxcomplete#Complete
set visualbell
set noerrorbells
set tags=./tags;,tags;
set foldlevel=2
set foldmethod=syntax
set nofoldenable
set splitright
set splitbelow
set colorcolumn=80,120
" set cursorline
" set cursorcolumn
" set showcmd
" set whichwrap+=<,>,h,l,[,]

set wildignore+=/tmp/*,*.so,*.swp,*.zip,/log/*,/target/*,*.rbc
" let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'


let g:rainbow_active=1
let g:rainbow_conf={ 'ctermfgs' : [66,24,2,28,5,26,48,26,44,32,21,40,2,5,8,3] }
let g:jsx_ext_required=0 " jsx highlighting in .js files
let g:javascript_plugin_jsdoc=1
let g:javascript_plugin_flow=1

" NERDtree
let NERDTreeShowHidden=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

map ; :
inoremap jj <ESC>
nnoremap ,<space> :DeleteTrailingWhitespace<CR>:nohlsearch<cr>
nmap \g <esc>$<left><left><left><left>:vertical wincmd f<cr>

nmap ,t :tabnew<cr>
nmap ,l :Align<space>
nmap ,e :NERDTreeToggle<cr>
nmap ,; :FZF<cr>
nmap ,' :ALEFix<cr>

set exrc
set secure

function! s:RemoveConflictingAlignMaps()
  if exists("g:loaded_AlignMapsPlugin")
    AlignMapsClean
  endi
endfunction
command! -nargs=0 RemoveConflictingAlignMaps call s:RemoveConflictingAlignMaps()
silent! autocmd VimEnter * RemoveConflictingAlignMaps

" spell check git commits
if has('autocmd')
  if has('spell')
    au BufNewFile,BufRead COMMIT_EDITMSG setlocal spell
  endif
endif

hi search cterm=none ctermbg=124 ctermfg=7
hi Nope cterm=none ctermbg=124 ctermfg=7
match Nope /\cudpate\|netowrk/

" language specific stuff
autocmd FileType go setlocal shiftwidth=8 tabstop=8
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 expandtab

let g:ale_fixers={}
let g:ale_fixers['javascript'] = ['prettier']
let g:ale_linters={}
let g:ale_linters['javascript'] = ['prettier', 'eslint', 'flow']
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_fix_on_enter = 1
let g:ale_fix_on_save = 1
let g:ale_sign_error = 'xx'
let g:ale_sign_warning = '!!'
let g:ale_sign_column_always = 1
" use quickfix list instead of loclist
let g:ale_set_loclist=0
let g:ale_set_quickfix=1
