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

"hi name 			guifg=#xxxxxx		guibg=#xxxxxx		ctermbg=xxxxxxxx	ctermfg=xxxxx		cterm=xxxxxx				gui=xxxxxxxx			term=xxxxxxx

hi Normal			guifg=#c0c0c0		guibg=#000040		ctermbg=black		ctermfg=gray
hi ErrorMsg			guifg=#ffffff		guibg=#287eff		ctermbg=lightblue	ctermfg=white
hi Visual			guifg=#8080ff		guibg=fg			ctermbg=fg			ctermfg=lightblue	cterm=reverse				gui=reverse
hi VisualNOS		guifg=#8080ff		guibg=fg			ctermbg=fg			ctermfg=lightblue	cterm=reverse,underline		gui=reverse,underline
hi Todo				guifg=#d14a14		guibg=#1248d1		ctermbg=darkblue	ctermfg=red
hi Search			guifg=#90fff0		guibg=#2050d0		ctermbg=darkblue	ctermfg=white		cterm=underline										term=underline
hi IncSearch		guifg=#b0ffff		guibg=#2050d0		ctermfg=darkblue	ctermbg=gray

hi SpecialKey		guifg=grey50												ctermfg=darkcyan
hi Directory		guifg=cyan													ctermfg=cyan
hi Title			guifg=magenta												ctermfg=magenta		cterm=bold					gui=none
hi WarningMsg		guifg=red													ctermfg=red
hi WildMenu			guifg=yellow		guibg=black			ctermbg=black		ctermfg=yellow		cterm=none											term=none
hi ModeMsg			guifg=#22cce2												ctermfg=lightblue
hi MoreMsg																		ctermfg=darkgreen
hi Question			guifg=green													ctermfg=green		cterm=none					gui=none
hi NonText			guifg=#0030ff												ctermfg=darkblue

hi StatusLine		guifg=darkblue		guibg=darkgray		ctermbg=gray		ctermfg=blue		cterm=none					gui=none				term=none
hi StatusLineNC		guifg=black			guibg=darkgray		ctermbg=gray		ctermfg=black		cterm=none					gui=none				term=none
hi VertSplit		guifg=black			guibg=darkgray		ctermbg=gray		ctermfg=black		cterm=none					gui=none				term=none

hi Folded			guifg=#808080		guibg=#000040		ctermbg=black		ctermfg=darkgrey	cterm=bold											term=bold
hi FoldColumn		guifg=#808080		guibg=midnightblue	ctermbg=black		ctermfg=darkgrey	cterm=bold											term=bold
hi LineNr			guifg=#90f020		guibg=midnightblue	ctermfg=green		cterm=none

hi DiffAdd			guibg=darkblue							ctermbg=darkblue						cterm=none											term=none
hi DiffChange		guibg=darkmagenta						ctermbg=magenta							cterm=none
hi DiffDelete		guibg=DarkCyan		guifg=Blue			ctermbg=cyan		ctermfg=blue									gui=bold
hi DiffText			guibg=Red								ctermbg=red 							cterm=bold					gui=bold

hi Cursor			guibg=yellow		guifg=black			ctermbg=yellow		ctermfg=black
hi lCursor			guibg=white			guifg=black			ctermbg=white		ctermfg=black

hi Comment								guifg=#80a0ff							ctermfg=darkred									gui=italic
hi Constant								guifg=#ffa0a0							ctermfg=magenta		cterm=none
hi Special								guifg=Orange							ctermfg=brown		cterm=none					gui=none
hi Identifier							guifg=#40ffff							ctermfg=cyan		cterm=none
hi Statement							guifg=#ffff60							ctermfg=yellow		cterm=none					gui=none
hi PreProc								guifg=#ff80ff							ctermfg=magenta		cterm=none					gui=none
hi type									guifg=#60ff60							ctermfg=green		cterm=none					gui=none
hi Underlined																						cterm=underline									term=underline
hi Ignore								guifg=bg								ctermfg=bg

" suggested by tigmoid, 2008 Jul 18
hi Pmenu			guibg=#404080		guifg=#c0c0c0
hi PmenuSel			guibg=#2050d0		guifg=#c0c0c0
hi PmenuSbar		guibg=darkgray		guifg=blue
hi PmenuThumb							guifg=#c0c0c0

" suggested by _rMX_ 12.10.2010 16:09:18 =)
hi lCursor			guibg=Cyan			guifg=NONE
hi User1			guibg=darkgrey		guifg=grey30
hi CursorLine		guibg=MidnightBlue						ctermbg=blue
hi CursorColumn		guibg=MidnightBlue						ctermbg=blue
hi ColorColumn		guibg=darkgrey							ctermbg=darkgrey

hi Error			term=reverse		ctermbg=9	gui=undercurl		guifg=NONE		guibg=NONE			guisp=red
