set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-vinegar'
Plugin 'scrooloose/nerdtree'
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
Plugin 'leafgarland/typescript-vim'
Plugin 'mxw/vim-jsx'
Plugin 'tpope/vim-surround'
Plugin 'derekwyatt/vim-scala'
Plugin 'groenewege/vim-less'
Plugin 'tpope/vim-fugitive'
Plugin 'craigemery/vim-autotag'
Plugin 'b0wter/spacecadet'
Plugin 'nightsense/seabird'
Plugin 'fatih/vim-go'
Plugin 'reasonml-editor/vim-reason-plus'
Plugin 'junegunn/fzf'
Plugin 'noahfrederick/vim-hemisu'
Plugin 'mileszs/ack.vim'
Plugin 'w0rp/ale'
Plugin 'tpope/vim-markdown'
Plugin 'fenetikm/falcon'
Plugin 'mhinz/vim-startify'
Plugin 'ryanoasis/vim-devicons' " always last
call vundle#end()
filetype plugin indent on

set background=dark
let g:rehash256 = 1
syntax enable
" colorscheme hemisu

" colorscheme jellybeans
colorscheme falcon
let g:jellybeans_use_term_italics = 1
let g:jellybeans_overrides = {
      \  'background': { 'ctermbg': 'none', '256ctermbg': 'none' },
      \}

set t_Co=256
set encoding=utf-8
set guifont=FuraCode\ Nerd\ Font\ Mono:h9
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
set autoread

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

" autocmd BufNewfile,BufRead *.ts set syntax=javascript

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

hi search cterm=None ctermbg=124 ctermfg=7
hi Nope cterm=None ctermbg=124 ctermfg=7
hi ALEWarning ctermbg=None cterm=Underline ctermfg=Red
hi ALEError ctermbg=None cterm=Underline ctermfg=DarkRed
hi Comment cterm=none ctermfg=DarkGrey
hi Visual ctermfg=0 ctermbg=220 cterm=None
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
" let g:ale_sign_column_always = 0
" let g:ale_set_signs = 0
" use quickfix list instead of loclist
let g:ale_set_loclist=0
let g:ale_set_quickfix=1


let g:markdown_fenced_languages = ['javascript', 'js=javascript', 'json=javascript', 'ruby']

" Lightline
let g:falcon_lightline = 1
let g:lightline={}
let g:lightline.colorscheme='falcon'
set noshowmode

" Triger `autoread` when files changes on disk
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
au CursorHold,CursorHoldI * checktime

" NERDTress File highlighting only the glyph/icon
" test highlight just the glyph (icons) in nerdtree:
autocmd filetype nerdtree highlight haskell_icon ctermbg=none ctermfg=Red guifg=#ffa500
autocmd filetype nerdtree highlight html_icon ctermbg=none ctermfg=Red guifg=#ffa500
autocmd filetype nerdtree highlight go_icon ctermbg=none ctermfg=Red guifg=#ffa500

autocmd filetype nerdtree syn match haskell_icon ## containedin=NERDTreeFile
" if you are using another syn highlight for a given line (e.g.
" NERDTreeHighlightFile) need to give that name in the 'containedin' for this
" other highlight to work with it
autocmd filetype nerdtree syn match html_icon ## containedin=NERDTreeFile,html
autocmd filetype nerdtree syn match go_icon ## containedin=NERDTreeFile
