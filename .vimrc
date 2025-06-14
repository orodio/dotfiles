set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-vinegar'
Plugin 'scrooloose/nerdtree'
Plugin 'elixir-editors/vim-elixir'
Plugin 'vim-scripts/Align'
Plugin 'vim-scripts/DeleteTrailingWhitespace'
Plugin 'nanotech/jellybeans.vim'
Plugin 'ervandew/supertab'
Plugin 'pangloss/vim-javascript'
Plugin 'jparise/vim-graphql'
Plugin 'leafgarland/typescript-vim'
Plugin 'mxw/vim-jsx'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'reasonml-editor/vim-reason-plus'
Plugin 'junegunn/fzf'
Plugin 'mileszs/ack.vim'
Plugin 'w0rp/ale'
Plugin 'tpope/vim-markdown'
Plugin 'fenetikm/falcon'
Plugin 'cohama/agit.vim'
Plugin 'andreypopp/vim-colors-plain'
Plugin 'styled-components/vim-styled-components'
Plugin 'dracula/vim'
Plugin 'craigemery/vim-autotag'
Plugin 'merlinrebrovic/focus.vim'
Plugin 'majutsushi/tagbar'
Plugin 'easymotion/vim-easymotion'
" Plugin 'jiangmiao/auto-pairs'
Plugin 'mattn/emmet-vim'
Plugin 'posva/vim-vue'
Plugin 'fatih/vim-go'
call vundle#end()
filetype plugin indent on

set background=dark
colorscheme dracula
let g:rehash256 = 1
syntax enable

hi Normal ctermbg=None
hi! link xmlEndTag Function
hi Comment cterm=italic
hi SpecialKey cterm=none ctermfg=8

" set t_Co=256
set encoding=utf-8
set guifont=FuraCode\ Nerd\ Font\ Mono:h9
set nobackup
set nowritebackup
set noswapfile
set autoindent
set nonumber
" set number
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
set signcolumn=yes
set shiftround
set iskeyword+=-
set lazyredraw
set list
set listchars=tab:›\ ,trail:•
" set listchars=tab:∆\ ,trail:•
" set listchars=tab:│\ ,trail:•
set scrolloff=3
set shiftwidth=2
set ttyfast
set fileformats=unix,mac,dos
set softtabstop=2
set wildmenu
set wildmode=longest,list,full
set wildignore+=/tmp/*,*.so,*.swp,*.zip,/log/*,/target/*,*.rbc
set mouse=a
set mousefocus
set laststatus=2
set nowrap
set omnifunc=syntaxcomplete#Complete
set tags=./tags;,tags;
set splitright
set splitbelow
set autoread
set noerrorbells
set novisualbell
set foldmethod=manual
set foldnestmax=10
set nofoldenable
set foldlevel=2

function! NeatFoldText()
    let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
    let lines_count = v:foldend - v:foldstart + 1
    let lines_count_text = '| ' . printf("%10s", lines_count . ' lines') . ' |'
    let foldchar = matchstr(&fillchars, 'fold:\zs.')
    let foldtextstart = strpart('+' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
    let foldtextend = lines_count_text . repeat(foldchar, 8)
    let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
    return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
endfunction

set foldtext=NeatFoldText()

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

let g:focusmode_width = 80
let g:focus_use_default_mapping = 0
nmap ,f <Plug>FocusModeToggle

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

let g:fzf_tags_command = 'ctags -R'


" language specific stuff
autocmd FileType go setlocal shiftwidth=4 tabstop=4
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 expandtab

au BufRead,BufNewFile *.ex,*.exs set filetype=elixir
au BufRead,BufNewFile *.eex,*.heex,*.leex,*.sface,*.lexs set filetype=eelixir
au BufRead,BufNewFile mix.lock set filetype=elixir

let g:ale_fixers={}
let g:ale_fixers['elixir'] = ['mix_format']
let g:ale_fixers['javascript'] = ['prettier']
let g:ale_linters={}
let g:ale_linters['javascript'] = ['prettier', 'eslint', 'flow']
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_fix_on_enter = 1
let g:ale_fix_on_save = 1
let g:ale_sign_error = '=>'
let g:ale_sign_warning = '->'

let g:markdown_fenced_languages = ['javascript', 'js=javascript', 'json=javascript', 'ruby']

set noshowmode

" GitGutter
let g:gitgutter_max_signs = 500
let g:gitgutter_map_keys = 0

" Triger `autoread` when files changes on disk
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
au CursorHold,CursorHoldI * checktime

set exrc
set secure
