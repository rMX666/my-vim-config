" Vim color file
" Maintainer:	Bohdan Vlasyuk <bohdan@vstu.edu.ua>
" Last Change:	2008 Jul 18

" darkblue -- for those who prefer dark background
" [note: looks bit uglier with come terminal palettes,
" but is fine on default linux console palette.]
"
" Modified: 12.10.2010 16:14:03
" By: _rMX_
" Description: Support of version 7.3

set bg=dark

hi clear
if exists("syntax_on")
	syntax reset
endif

let colors_name = "darkblue_rmx"

"hi name			guifg=#xxxxxx		guibg=#xxxxxx		ctermbg=xxxxxxxx	ctermfg=xxxxx		cterm=xxxxxx				gui=xxxxxxxx			term=xxxxxxx

hi Normal			guifg=#c0c0c0		guibg=#000040		ctermbg=Black		ctermfg=LightGray
hi ErrorMsg			guifg=#ffffff		guibg=#287eff		ctermbg=LightBlue	ctermfg=White
hi Visual			guifg=#8080ff		guibg=fg			ctermbg=fg			ctermfg=LightBlue	cterm=reverse				gui=reverse
hi VisualNOS		guifg=#8080ff		guibg=fg			ctermbg=fg			ctermfg=LightBlue	cterm=reverse,underline		gui=reverse,underline
hi Todo				guifg=#d14a14		guibg=#1248d1		ctermbg=DarkBlue	ctermfg=Red
hi Search			guifg=#90fff0		guibg=#2050d0		ctermbg=DarkBlue	ctermfg=White		cterm=underline										term=underline
hi IncSearch		guifg=#b0ffff		guibg=#2050d0		ctermfg=DarkBlue	ctermbg=Gray

hi SpecialKey		guifg=Grey50												ctermfg=DarkGrey
hi Directory		guifg=Cyan													ctermfg=Cyan
hi Title			guifg=Magenta												ctermfg=Magenta		cterm=bold					gui=none
hi WarningMsg		guifg=Red													ctermfg=Red
hi WildMenu			guifg=Yellow		guibg=Black			ctermbg=Black		ctermfg=Yellow		cterm=none											term=none
hi ModeMsg			guifg=#22cce2												ctermfg=LightBlue
hi MoreMsg																		ctermfg=DarkGreen
hi Question			guifg=Green													ctermfg=Green		cterm=none					gui=none
hi NonText			guifg=#0030ff												ctermfg=DarkBlue

hi StatusLine		guifg=DarkBlue		guibg=DarkGray		ctermbg=Gray		ctermfg=Blue		cterm=none					gui=none				term=none
hi StatusLineNC		guifg=Black			guibg=DarkGray		ctermbg=Gray		ctermfg=Black		cterm=none					gui=none				term=none
hi VertSplit		guifg=Black			guibg=DarkGray		ctermbg=Gray		ctermfg=Black		cterm=none					gui=none				term=none

hi Folded			guifg=#808080		guibg=#000040		ctermbg=Black		ctermfg=DarkGrey	cterm=bold											term=bold
hi FoldColumn		guifg=#808080		guibg=MidnightBlue	ctermbg=Black		ctermfg=DarkGrey	cterm=bold											term=bold
hi LineNr			guifg=#90f020		guibg=MidnightBlue						ctermfg=Green		cterm=none

hi DiffAdd			guibg=DarkBlue							ctermbg=DarkBlue						cterm=none											term=none
hi DiffChange		guibg=DarkMagenta						ctermbg=Magenta							cterm=none
hi DiffDelete		guibg=DarkCyan		guifg=Blue			ctermbg=Cyan		ctermfg=Blue									gui=bold
hi DiffText			guibg=Red								ctermbg=Red 							cterm=bold					gui=bold

hi Cursor			guibg=Yellow		guifg=NONE			ctermbg=Yellow		ctermfg=Black
hi lCursor			guibg=Cyan			guifg=NONE			ctermbg=White		ctermfg=Black

hi Comment								guifg=#80a0ff							ctermfg=DarkCyan								gui=italic
hi Constant								guifg=#ffa0a0							ctermfg=Magenta		cterm=none
hi Special								guifg=Orange							ctermfg=Brown		cterm=none					gui=none
hi Identifier							guifg=#40ffff							ctermfg=Cyan		cterm=none
hi Statement							guifg=#ffff60							ctermfg=Yellow		cterm=none					gui=none
hi PreProc								guifg=#ff80ff							ctermfg=Magenta		cterm=none					gui=none
hi type									guifg=#60ff60							ctermfg=Green		cterm=none					gui=none
hi Underlined																						cterm=underline									term=underline
hi Ignore								guifg=bg								ctermfg=bg

" suggested by tigmoid, 2008 Jul 18
hi Pmenu			guibg=#404080		guifg=#c0c0c0
hi PmenuSel			guibg=#2050d0		guifg=#c0c0c0
hi PmenuSbar		guibg=DarkGray		guifg=Blue
hi PmenuThumb							guifg=#c0c0c0

" suggested by _rMX_ 12.10.2010 16:09:18 =)
hi User1			guibg=DarkGrey		guifg=Grey30		ctermbg=DarkGrey	ctermfg=Blue
hi CursorLine		guibg=MidnightBlue						ctermbg=DarkBlue	ctermfg=NONE
hi CursorColumn		guibg=MidnightBlue						ctermbg=DarkBlue	ctermfg=NONE
hi ColorColumn		guibg=DarkGrey							ctermbg=DarkGrey

hi Error			guibg=NONE			guifg=NONE			ctermbg=LightBlue													gui=undercurl		term=reverse	guisp=red
