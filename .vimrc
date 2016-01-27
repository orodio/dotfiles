set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'orodio/Vundle.vim'
Plugin 'orodio/vim-commentary'
Plugin 'orodio/nerdtree'
Plugin 'orodio/ctrlp.vim'
Plugin 'orodio/Spacegray.vim'
" Plugin 'orodio/vim-gitgutter'
Plugin 'orodio/rainbow'
Plugin 'orodio/vim-elixir'
Plugin 'orodio/vim-handlebars'
Plugin 'orodio/vim-fugitive'
Plugin 'orodio/vim-json'
Plugin 'vim-scripts/Align'
Plugin 'vim-scripts/DeleteTrailingWhitespace'
Plugin 'atelierbram/vim-colors_duotones'
" Plugin 'scrooloose/syntastic'
" Plugin 'pmsorhaindo/syntastic-local-eslint.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
call vundle#end()
filetype plugin indent on

syntax enable
colorscheme spacegray

set t_Co=256
set autoindent
set number
set backspace=2
set backupcopy=yes
" set colorcolumn=80,120
set directory-=.
set encoding=utf-8
set expandtab
set incsearch
set ignorecase
set iskeyword+=-
set lazyredraw
set list
set listchars=tab:▸\ ,trail:▫
set scrolloff=10
set shiftwidth=2
set showcmd
set smartcase
set softtabstop=2
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu
set wildmode=longest,list,full
set mouse=a
set mousefocus
set whichwrap+=<,>,h,l,[,]
set laststatus=2
set nowrap

let g:rainbow_active=1
let g:rainbow_conf={ 'ctermfgs' : [66,24,2,28,5,26,48,26,44,32,21,40,2,5,8,3] }
let g:jsx_ext_required=0 " jsx highlighting in .js files

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

" Syntastic
" let g:syntastic_javascript_checkers = ['eslint']
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

