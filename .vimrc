set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-commentary'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
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
Plugin 'vim-syntastic/syntastic'
" Plugin 'fleischie/vim-styled-components'
Plugin 'fatih/vim-go'
" Plugin 'orodio/vim-luna'
" Plugin 'orodio/1989.vim'
" Plugin 'orodio/vim-colors-japanesque'
" Plugin 'vim-scripts/CSApprox'
call vundle#end()
filetype plugin indent on

syntax enable

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
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
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
" set colorcolumn=80,120
" set cursorline
" set cursorcolumn
" set showcmd
" set whichwrap+=<,>,h,l,[,]


let g:rainbow_active=1
let g:rainbow_conf={ 'ctermfgs' : [66,24,2,28,5,26,48,26,44,32,21,40,2,5,8,3] }
let g:jsx_ext_required=0 " jsx highlighting in .js files
" let g:NERDTreeWinPos='right'
let g:javascript_plugin_jsdoc=1
let g:javascript_plugin_flow=1

map ; :
inoremap jj <ESC>
nnoremap ,<space> :DeleteTrailingWhitespace<CR>:nohlsearch<cr>
nmap \g <esc>$<left><left><left><left>:vertical wincmd f<cr>

nmap ,t :tabnew<cr>
nmap ,l :Align<space>
nmap ,e :NERDTreeToggle<cr>
nmap ,; :CtrlP<cr>

nmap \c <esc>:w<cr>:! git commit % -nm "AUTO: %"<cr>
nmap \[ <esc>:w<cr>:! npm run lint<cr>
nmap \] <esc>:w<cr>:! npm run test<cr>

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

hi search cterm=none ctermbg=124 ctermfg=7
hi Nope cterm=none ctermbg=124 ctermfg=7
match Nope /\cudpate\|netowrk/

" syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_mode_map = { "mode": "passive" }
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_javascript_eslint_exe = '$(npm bin)/eslint'
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

" let g:flow#enable = 1
" let g:flow#autoclose = 1

" language specific stuff
autocmd FileType go setlocal shiftwidth=8 tabstop=8
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 expandtab

