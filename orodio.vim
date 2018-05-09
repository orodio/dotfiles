" Name: orodio.vim
" Version: 0.1
" Maintainer: github.com/orodio
" License: The MIT License (MIT)
"
" Based On:
" - https://github.com/andreypopp/vim-colors-plain (MIT License)
" - https://github.com/pbrisbin/vim-colors-off (MIT License)
" - https://github.com/reedes/vim-colors-pencil (MIT License)

highlight clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name='orodio'

if &background == "dark"
  " Base Colors
  hi Strong cterm=bold ctermfg=15
  hi Normal ctermfg=15
  hi Subtle ctermfg=238
  hi Mute ctermfg=234
  hi Comment cterm=italic ctermfg=238 " grey

  hi Focus cterm=bold ctermbg=220 ctermfg=0
  hi Accent ctermfg=4
  hi Good ctermfg=2
  hi Meh ctermfg=92
  hi Bad ctermfg=1

  hi Success cterm=bold ctermfg=2
  hi Warning cterm=bold ctermfg=92
  hi Error cterm=bold ctermfg=1 ctermbg=none

  " Autocomplete Menu
  hi Pmenu ctermbg=220 ctermfg=0
  hi PmenuSel ctermbg=0 ctermfg=220
  hi PmenuSbar ctermbg=220 ctermfg=220
  hi PmenuThumb ctermbg=0 ctermfg=0

  " Layout
  hi Fill ctermfg=234 ctermbg=234
  hi FillPrimary cterm=bold ctermfg=220 ctermbg=234
  hi FillSecondary cterm=italic ctermfg=240 ctermbg=234
  hi FillGood ctermfg=2 ctermbg=234
  hi FillBad ctermfg=1 ctermbg=234
else
  " Base Colors
  hi Strong cterm=bold ctermfg=0
  hi Normal ctermfg=0
  hi Subtle ctermfg=248
  hi Mute ctermfg=254
  hi Comment cterm=italic ctermfg=248 " grey

  hi Focus cterm=bold ctermbg=220 ctermfg=0
  hi Accent ctermfg=4
  hi Good ctermfg=2
  hi Meh ctermfg=92
  hi Bad ctermfg=1

  hi Success cterm=bold ctermfg=2
  hi Warning cterm=bold ctermfg=92
  hi Error cterm=bold ctermfg=1 ctermbg=none

  " Autocomplete Menu
  hi Pmenu ctermbg=220 ctermfg=0
  hi PmenuSel ctermbg=0 ctermfg=220
  hi PmenuSbar ctermbg=220 ctermfg=220
  hi PmenuThumb ctermbg=0 ctermfg=0

  " Layout
  hi Fill ctermfg=254 ctermbg=254
  hi FillPrimary cterm=bold ctermfg=0 ctermbg=254
  hi FillSecondary cterm=italic ctermfg=240 ctermbg=254
  hi FillGood ctermfg=2 ctermbg=254
  hi FillBad ctermfg=1 ctermbg=254
endif

hi! link VertSplit Fill
hi! link StatusLine FillPrimary
hi! link StatusLineNC FillSecondary
hi! link StatusLineOk FillGood
hi! link StatusLineError FillBad
hi! link StatusLineWarning FillBad

hi! link IncSearch Focus
hi! link Search Focus
hi! link NonText Mute
hi! link LineNr Subtle
hi! link Folded Subtle
hi! link Visual Focus
hi! link VisualNOS Focus
hi! link WildMenu Focus
hi! link Directory Accent

" Tabs
hi! link Title Accent
hi! link TabLine FillSecondary
hi! link TabLineFill Fill
hi! link TabLineSel FillPrimary

hi! link Noise Accent
hi! link Constant Strong

" Syntax
hi! link Character Strong
hi! link Number Meh
hi! link Float Meh
hi! link Boolean Meh
hi! link String Comment

hi! link Identifier Strong
hi! link Function Normal

hi! link Statement Constant
hi! link Conditional Strong
hi! link Repeat Strong
hi! link Label Strong
hi! link Keyword Strong
hi! link Exception Strong
hi! link Operator Accent

hi! link PreProc Strong
" hi! link Include PreProc
" hi! link Define PreProc
" hi! link Macro PreProc
" hi! link PreCondit PreProc

hi! link Type Normal
" hi! link Structure Type
" hi! link Typedef Type
hi! link StorageClass Strong

hi! link Special Accent
hi! link SpecialChar Accent
hi! link SpecialComment Accent
hi! link Tag Accent
hi! link Delimiter Accent
hi! link Debug Accent

hi Underlined cterm=underline
hi! Ignore ctermfg=none
hi! link Todo Constant
hi! link SpecialKey Bad
hi! link ErrorMsg Error
hi! link MoreMsg Warning
hi! link ModeMsg MoreMsg
hi! link Question Warning
hi! link WarningMsg Warning

" Alt Vim Usage
hi! link DiffAdd Good
hi! link DiffDelete Bad
hi! link DiffText Normal
hi! link DiffRemoved DiffDelete
hi! link DiffAdded DiffAdd
hi! link SignColumn Normal
hi! link SpellBad Bad
hi! link SpellCap Bad
hi! link SpellRare Bad
hi! link SpellLocal Bad

hi! link helpHyperTextEntry Title
hi! link helpHyperTextJump String

hi! link MatchParen Warning

hi! link GitGutterAdd Good
hi! link GitGutterChange Meh
hi! link GitGutterDelete Bad
hi! link GitGutterChangeDelete Bad
