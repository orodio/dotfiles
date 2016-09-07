set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'orodio/Vundle.vim'
Plugin 'orodio/vim-commentary'
Plugin 'orodio/nerdtree'
Plugin 'orodio/ctrlp.vim'
Plugin 'orodio/rainbow'
Plugin 'orodio/vim-elixir'
Plugin 'vim-scripts/Align'
Plugin 'vim-scripts/DeleteTrailingWhitespace'
Plugin 'orodio/vim-luna'
Plugin 'orodio/1989.vim'
Plugin 'rakr/vim-two-firewatch'
Plugin 'orodio/rust.vim'
Plugin 'orodio/vim-colors-japanesque'
Plugin 'orodio/CSApprox'
Plugin 'orodio/vim-toml'
Plugin 'nanotech/jellybeans.vim'
Plugin 'ervandew/supertab'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'tpope/vim-surround'
" Plugin 'calebsmith/vim-lambdify'
" Plugin 'flowtype/vim-flow'
call vundle#end()
filetype plugin indent on

syntax enable
" colorscheme delek
" colorscheme spacegray
" colorscheme luna-term
" colorscheme 1989

" colorscheme two-firewatch
" let g:two_firewatch_italics=1
" set background=dark
" set background=light
" let g:airline_theme='twofirewatch'
colorscheme jellybeans
let g:jellybeans_use_term_italics = 1
let g:jellybeans_overrides = {
      \  'background': { 'ctermbg': 'none', '256ctermbg': 'none' },
      \}


" set t_Co=256
set nobackup
set nowritebackup
set noswapfile
set autoindent
set number
set backspace=2
set backupcopy=yes
" set colorcolumn=80,120
set directory-=.
set encoding=utf-8
set expandtab
set hlsearch
set incsearch
set ignorecase
set smartcase
set iskeyword+=-
set lazyredraw
set list
set listchars=tab:▸\ ,trail:▫
set scrolloff=10
set shiftwidth=2
" set showcmd
set softtabstop=2
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu
set wildmode=longest,list,full
set mouse=a
set mousefocus
" set whichwrap+=<,>,h,l,[,]
set laststatus=2
set nowrap
set omnifunc=syntaxcomplete#Complete

let g:rainbow_active=1
let g:rainbow_conf={ 'ctermfgs' : [66,24,2,28,5,26,48,26,44,32,21,40,2,5,8,3] }
let g:jsx_ext_required=0 " jsx highlighting in .js files
" let g:NERDTreeWinPos='right'

map ; :
inoremap jj <ESC>
nnoremap ,<space> :DeleteTrailingWhitespace<CR>:nohlsearch<cr>

nmap ,t :tabnew<cr>
nmap ,l :Align<space>
nmap ,e :NERDTreeToggle<cr>
nmap ,; :CtrlP<cr>

set exrc
set secure

function! s:RemoveConflictingAlignMaps()
  if exists("g:loaded_AlignMapsPlugin")
    AlignMapsClean
  endif
endfunction
command! -nargs=0 RemoveConflictingAlignMaps call s:RemoveConflictingAlignMaps()
silent! autocmd VimEnter * RemoveConflictingAlignMaps

" spell check git commits
if has('autocmd')
  if has('spell')
    au BufNewFile,BufRead COMMIT_EDITMSG setlocal spell
  endif
endif

" let g:flow#enable = 1
" let g:flow#autoclose = 1
