" Last edit date: 21.10.2010 11:33:47
set nocompatible

colorscheme darkblue_rmx

syntax on
filetype on
filetype plugin on

" number lines
set number
set numberwidth=5

" enable moving on russian words
set iskeyword=@,a-z,A-Z,48-57,_,128-175,192-255
" russian keymap
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
" Switch
inoremap <C-Q> <C-^>

let g:my_tabwidth = 2 " This is my favorite tabwidth =)
" tabwidth
set tabstop=4
" tabwidth to expand in spaces
set shiftwidth=4
set noexpandtab

set formatoptions=crql

" Function to switch between my lovely 2-char tabwidth with tabs-expandig 
" and fucked up default tabwidth without tabs-expanding
function! ToggleMyTabWidth()
	if &tabstop == 2
		set shiftwidth=4
		set tabstop=4
		set noexpandtab
		echo "< Tab mode (tabwidth=4) >"
	elseif &tabstop == 4
		set tabstop=8
		set shiftwidth=8
		set noexpandtab
		echo "< Tab mode (default tabwidth=8) >"
	elseif &tabstop == 8
		execute "set shiftwidth=" . g:my_tabwidth
		execute "set tabstop=" . g:my_tabwidth
		set expandtab
		echo "< No tab mode (tabwidth=" . g:my_tabwidth . ") >"
	endif
endfunction
nmap <F11> :execute ToggleMyTabWidth()<CR>

set list
set listchars=tab:\|-,trail:.

set smarttab
set smartindent

set autoindent

" split window vertically
set splitbelow
" split window horizontally
set splitright

" use wildmenu ...
set wildmenu
" ... with auto-complete
set wildcharm=<TAB>

" Search and highlight search-results
set showmatch
set hlsearch
set incsearch
set ignorecase

" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set whichwrap+=<,>,[,]

set nobackup		" do not keep a backup file, use versions instead
set history=100		" keep 50 lines of command line history
set ruler			" show the cursor position all the time
set showcmd			" display incomplete commands

" folding
set foldenable
set foldmethod=syntax
set foldcolumn=2
set foldlevel=9999 " don't fold by default

" codepage sequence
if has('unix')
	set ffs=unix,dos
else
	set ffs=dos,unix
endif
set fencs=utf-8,cp1251,koi8-r,cp866

if has('gui')
	winpos 0 0
	set guioptions-=T "disable toolbar
	set guioptions+=b
	if has('win32')
		set guifont=Consolas:h10:cRUSSIAN::
		" Maximize goes automatically
	elseif has('unix')
		set guifont=Droid\ Sans\ Mono\ 10
		" Maximization
		set lines=999 columns=999
	endif
endif

set showtabline=2 "always show tab-header
set nowrap

function! ToggleWrap()
	if &wrap
		set nowrap
		set nolinebreak
		set list
		echo "< No wrap mode >"
	else
		set nolist
		set wrap
		set linebreak
		set showbreak=>\ 
		echo "< Wrap mode >"
	endif
endfunction
map <F3> :execute ToggleWrap()<CR>

set laststatus=2 "always show status
set statusline=%<%F\ %y\ %{'Enc:\ '.&fileencoding}\ %m%r%=[%b\ 0x%B]\ %c%1*%V%*,%l/%1*%L%*\ %P\ %1*%o%*\ 

" line highlight
nmap <F12> :set cursorcolumn!<CR>
vmap <F12> :set cursorcolumn!<CR>
imap <F12> <Esc>:set cursorcolumn!<CR>a
set cursorline

" Highlight the divider comments
" e.g. // ---------- //============ // -_-_-_-_=====-_-_-_ "---------==-=-=-=-=-=-=-=
let s:divHiEnabled = 0
function! ToggleDividerHighlight()
	if s:divHiEnabled == 0
		syntax match DivComment /\M\/\/\[\ \"\_=-]\+/
		highlight DivComment gui=italic guifg=#80a0ff guibg=darkgrey
		let s:divHiEnabled = 1
		echo "< Divider highlight enabled >"
	else
		highlight clear DivComment
		syntax clear DivComment
		let s:divHiEnabled = 0
		echo "< Divider highlight disabled >"
	endif
endfunction
map <F4> mz:execute ToggleDividerHighlight()<CR>'z

" ----- Some mappings --------------------------------------------------------------------------------------------------

" helpers for editing .vimrc
" execute .vimrc
nmap ,s :source $MYVIMRC<CR>
" edit .vimrc
nmap ,vt :tabnew $MYVIMRC<CR>
nmap ,v :new $MYVIMRC<CR>

" mappings for tabs
map <F5> :tabclose<CR>
map <F6> :tabprev<CR>
map <F7> :tabnext<CR>
map <F8> :tabnew<CR>

" insert new line without entering insert mode
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

" insert date-time
map <F2> a<C-R>=strftime("%c")<CR><Esc>

" Press space to clear search highlighting and any message already displayed.
nnoremap <silent> <Space> :silent noh<Bar>echo<CR>
" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-X and SHIFT-Del are Cut
vnoremap <C-X>		"+x
vnoremap <S-Del>	"+x

" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C>		"+y
vnoremap <C-Insert>	"+y

" CTRL-V and SHIFT-Insert are Paste
map <C-V>			"+gP
map <S-Insert>		"+gP

cmap <C-V>			<C-R>+
cmap <S-Insert>		<C-R>+

" Pasting blockwise and linewise selections is not possible in Insert and
" Visual mode without the +virtualedit feature. They are pasted as if they
" were characterwise instead.
" Uses the paste.vim autoload script.

exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']

imap <S-Insert>		<C-V>
vmap <S-Insert>		<C-V>

" Use CTRL-Q to do what CTRL-V used to do
noremap <C-Q>		<C-V>

" Alt-Space is System menu
if has("gui")
	noremap <M-Space> :simalt ~<CR>
	inoremap <M-Space> <C-O>:simalt ~<CR>
	cnoremap <M-Space> <C-C>:simalt ~<CR>
endif

" For CTRL-V to work autoselect must be off.
" On Unix we have two selections, autoselect can be used.
if !has("unix")
	set guioptions-=a
endif

" make a border right line
set colorcolumn=+1
set textwidth=120

" ----------------------------------------------------------------------------------------------------------------------
" Make own tab-headers -->
function! MyTabLine()
	let tabline = ''

	" Make tabline for every tab -->
	for i in range(tabpagenr('$'))
	" Highlihgt current tab header
		if i + 1 == tabpagenr()
			let tabline .= '%#TabLineSel#'
		else
			let tabline .= '%#TabLine#'
		endif

		" Add tab number
		let tabline .= '%' . (i + 1) . 'T'

		" Add tab name
		let tabline .= ' %{MyTabLabel(' . (i + 1) . ')} |'
	endfor
	" Stop making tabline <--

	" Append space to the end
	let tabline .= '%#TabLineFill#%T'

	" Right-aligned close button
	if tabpagenr('$') > 1
		let tabline .= '%=%#TabLine#%999XX'
	endif

	return tabline
endfunction

function! MyTabLabel(n)
	let label = ''
	let buflist = tabpagebuflist(a:n)

	" File name, window count and tab number -->
	let label = substitute(bufname(buflist[tabpagewinnr(a:n) - 1]), '.*/', '', '')

	if label == ''
		let label = '[No Name]'
	endif

	let label .= ' (T:' . a:n . ')'
	let winnr = tabpagewinnr(a:n, '$')
	if winnr > 1
		let label .= ' [W:' . winnr . ']'
	endif
	" File name, window count and tab number <--

	" Search for modified buffers -->
	for i in range(len(buflist))
		if getbufvar(buflist[i], "&modified")
			let label = '[+] ' . label
			break
		endif
	endfor
	" <--

	return label
endfunction

" Make own tooltip
function! MyGuiTabToolTip()
	let tt = "Files:"

	let buflist = tabpagebuflist(tabpagenr())
	for bufnr in buflist
		if tt != ''
			let tt .= "\n"
		endif
		let name = bufname(bufnr)
		if name == '' 
			if getbufvar(bufnr, "&quickfix")
				let name = "[Quick Fix]"
			else
				let name = "[No Name]"
			endif
		endif
		let tt .= "	" . name
		if getbufvar(bufnr, "&modified")
			let tt .= " [+]"
		endif

		if !getbufvar(bufnr, "&modifiable")
			let tt .= " [RO]"
		endif
	endfor

	return tt
endfunction

function! MyGuiTabLabel()
	return '%{MyTabLabel(' . tabpagenr() . ')}'
endfunction

set tabline=%!MyTabLine()
set guitablabel=%!MyGuiTabLabel()
set guitabtooltip=%!MyGuiTabToolTip()
" Make own tab-headers <------------------------------------------------------------------------------------------------

" Make a menu for my maps ----------------------------------------------------------------------------------------------
if has('gui')
	:menutranslate clear
	if filereadable("$VIM/vimfiles/delmenu.vim")
		:so $VIM/vimfiles/delmenu.vim
		:so $VIM/vimfiles/menu.vim
	elseif filereadable("$VIMRUNTIME\delmenu.vim")
		:so $VIMRUNTIME/delmenu.vim
		:so $VIMRUNTIME/menu.vim
	endif

	an My\ Menu.Insert\ date<TAB>F2 a<C-R>=strftime("%c")<CR><Esc> 
	an My\ Menu.Toggle\ tabwidth<TAB>F11 :execute ToggleMyTabWidth()<CR>
	an My\ Menu.Toggle\ wrap<TAB>F3 :execute ToggleWrap()<CR>
	an My\ Menu.Toggle\ cursor\ column<TAB>F12 :set cursorcolumn!<CR>
	an My\ Menu.Toggle\ divider\ highlight<TAB>F4 mz:execute ToggleDividerHighlight()<CR>'z
	an My\ Menu.Clear\ search\ highlight<TAB>Space :silent noh<Bar>echo<CR>
	an My\ Menu.-SEP1- <Nop>
	an My\ Menu.Vimrc.Execute\ vimrc<TAB>,s :source $MYVIMRC<CR>
	an My\ Menu.Vimrc.Open\ vimrc\ in\ new\ tab<TAB>,vt :tabnew $MYVIMRC<CR>
	an My\ Menu.Vimrc.Open\ vimrc\ in\ new\ buffer<TAB>,v :new $MYVIMRC<CR>
	an My\ Menu.Tabs.Tab\ close<TAB>F5 :tabclose<CR>
	an My\ Menu.Tabs.Previous\ tab<TAB>F6 :tabprev<CR>
	an My\ Menu.Tabs.Next\ tab<TAB>F7 :tabnext<CR>
	an My\ Menu.Tabs.New\ tab<TAB>F8 :tabnew<CR>
	an My\ Menu.Plugins.NERD\ Tree.Show/Hide<TAB>C-F6 <ESC>:NERDTree<CR>
	an My\ Menu.Plugins.PHP\ Documentor.Add\ comment<TAB>C-P <ESC>:call PhpDocSingle()<CR>
endif

" Plugin settings ------------------------------------------------------------------------------------------------------
map <C-F5> <ESC>:BufExplorerVerticalSplit<CR>
map <C-F6> <ESC>:NERDTree<CR><CR>
map <C-F3> <ESC>:call PhpDocSingle()<CR>

let g:pdv_cfg_Author = 'Stanin Mike aka _rMX_'
let g:pdv_cfg_Copyright = '(c)'

let g:NERDMenuMode = 4
