set nocompatible

if has("unix")
	" Disable fucking bell
	set visualbell
	set t_vb=
endif

" Vundle {{{

	" Required!
	filetype off

	" On windows add home .vim dir to runtime path
	if has("win32")
		set rtp+=~/.vim
	endif

	" Vundle path
	let s:vundle = expand("~/.vim/bundle/vundle")

	" Check vundle and try to install if not found
	if !isdirectory(s:vundle)
		echo "Vundle does not exists! Trying to get it..."
		echo system('git clone --recursive https://github.com/gmarik/vundle.git "' . s:vundle . '"')
		if v:shell_error
			echo "Error: Clone finished with error."
			finish
		endif
		:PluginInstall
	endif

	" Add Vundle to runtime path
	execute "set rtp+=" . s:vundle
	call vundle#rc()

	" Let Vundle manage Vundle
	" Required!
	Plugin 'gmarik/vundle'

	" Plugin {{{

		" Zencoding
		Plugin 'mattn/emmet-vim'
		" A tree explorer plugin
		Plugin 'scrooloose/nerdtree'
		" Syntax checker
		Plugin 'scrooloose/syntastic'
		" Matchit
		Plugin 'vim-scripts/matchit.zip'
		" Surround
		Plugin 'tpope/vim-surround'
		" Repeat
		Plugin 'tpope/vim-repeat'
		" Comment things out
		Plugin 'tpope/vim-commentary'

		" PHP + Html correct indentation
		Plugin 'captbaritone/better-indent-support-for-php-with-html'

		" Highlight colors in css files
		Plugin 'ap/vim-css-color'

		" Javascript documentor
		Plugin 'heavenshell/vim-jsdoc'

		" Status line extention
		Plugin 'vim-airline/vim-airline'
		Plugin 'vim-airline/vim-airline-themes'
		" Cool git browser
		Plugin 'tpope/vim-fugitive'

		" Replace with case save
		Plugin 'tpope/vim-abolish'

		" Solarized theme
		Plugin 'altercation/vim-colors-solarized'

		" CSV
		Plugin 'chrisbra/csv.vim'

		" Snippets
		Plugin 'MarcWeber/vim-addon-mw-utils'
		Plugin 'tomtom/tlib_vim'
		Plugin 'garbas/vim-snipmate'

		" Rust support
		Plugin 'rust-lang/rust.vim'


	" }}}

	" Required!
	filetype plugin indent on

" }}}

" Interface {{{

	" Enable DirectX on Windows
	if has('win32')
		set renderoptions=type:directx
	endif
	" Enable syntax highlight
	syntax on
	" Number lines
	set number
	" Width of number line
	set numberwidth=5
	" Split window vertically below current
	set splitbelow
	" Split window horizontally at right of current
	set splitright
	" Show the cursor position all the time
	set ruler
	" Display incomplete commands
	set showcmd
	" Tabwidth
"	set tabstop=2
	" Tabwidth to expand in spaces
"	set shiftwidth=2
	" Don't expand tabs to spaces
"	set expandtab
	" Always show tab-header
	set showtabline=2
	" Don't wrap lines
	set nowrap
	" Codepage sequence and file formats for nix in win is diffedent
	if has('unix')
		" First use nix file format (CR)
		set fileformats=unix,dos
	else
		" First use dos file format (CRLF)
		set fileformats=dos,unix
	endif
	" Editor encoding - UTF-8
	set encoding=utf-8
	if has("gui")
		" Set messages to english
		language messages en
		" Reset menu
		source $VIMRUNTIME/delmenu.vim
		set langmenu=ru_RU.UTF-8
		source $VIMRUNTIME/menu.vim
	endif
	" File endcoding detection sequence - first try UTF-8, than Windows 1251, etc...
	set fileencodings=utf-8,cp1251,koi8-r,cp866
	" Use following characters to display service chars
	set list
	" Char for service characters
	set listchars=tab:\|-,trail:.
	" Buffer splitter, fold and diff fill chars
	set fillchars=stl:\ ,stlnc:\ ,vert:\ ,diff:—,fold:—
	" Show matching <> () [] {}
	set showmatch
	" Line hightlight
	set cursorline
	if v:version >= 703
		" Make a border right line
		set colorcolumn=120
	endif
	" Do smart indenting when starting a new line
	set smartindent
	" Copy indent from current line when starting a new line
	set autoindent
	" Use enhanced command line completion
	set wildmenu
	" Completion key to be used in commands
	set wildcharm=<TAB>
	" Ingnore files of version control
	set wildignore+=.git,.svn
	" Binary images
	set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg
	" Don't redraw while executing macros (good performance config)
	set lazyredraw
	" Vertical and horizontal scrolloff (count of rows and columns to be
	" wisible above and below cursor)
	set scrolloff=3
	set sidescrolloff=10

	" GUI options {{{

		if has('gui')
			" Place window in the top left corner
			winpos 0 0
			" Disable toolbar
			set guioptions-=T
			" Enable bottom scroll
			set guioptions+=b
			" Replace popup dialogs with console
			set guioptions+=c
			" Disable menu by default
			set guioptions-=m
			if has('win32')
				set guifont=Consolas\ for\ Powerline:h11:cRUSSIAN::
				" Maximize goes automatically on windows (with plugin 'maximize')
			elseif has('unix')
				set guifont=Droid\ Sans\ Mono\ 11
				" Maximization
				set lines=999 columns=999
			endif
		endif

	" }}}

	" Syntax highlight {{{

		" Highlight pas files with delphi syntax
		let g:pascal_delphi = 1

	" }}}

" }}}

" Environment {{{

	" Do not keep backup files
	set nobackup
	" Do not keep swap files
"	set noswapfile
	" Keep 9999 lines of command line history
	set history=500
	" Allow backspacing over everything in insert mode
	set backspace=indent,eol,start
	" Wrap cursor position
	set whichwrap+=<,>,[,]

	" Persistent Undo
	" Keep undo history across sessions, by storing in file.
	" Only works all the time.
	if has('persistent_undo')
		set undodir=~/.vim/backups
		set undofile
	endif

" }}}

" Folding {{{

	set nofoldenable
	set foldmethod=syntax
	set foldcolumn=2
	set foldlevel=1

" }}}

" Russian charcode {{{

	" Enable moving on russian words
	set iskeyword=@,a-z,A-Z,48-57,_,128-175,192-255
	" Russian keymap
	set keymap=russian-jcukenwin
	set iminsert=0
	set imsearch=0
	" Switch keymaps
	inoremap <C-Q> <C-^>

" }}}

" Search/replace and highlight search-results {{{

	set hlsearch
	set incsearch
	set ignorecase
	set smartcase
	set gdefault " Enable /g flag in substitution s/a/b/

" }}}

" Mappings {{{

	" Start of user maps
	let mapleader = ","

	" Function to get my vim rc or default if not found
	function! s:getVimrc()
		let vimrc_home = ''
		if has('win32')
			let vimrc_home = expand('~/.vim/_vimrc')
		elseif has('unix')
			let vimrc_home = expand('~/.vimrc')
		endif

		if filereadable(vimrc_home)
			return vimrc_home
		endif

		return $MYVIMRC
	endfunction

	" If current buffer is new and empty - open vimrc in it,
	" else open in new tab
	function! g:OpenVimrc()
		if bufname('%') == '' && line('$') == 1 && getline(1) == ''
			execute ":edit " . s:getVimrc()
		else
			execute ":tabnew " . s:getVimrc()
		endif
	endfunction

	" Edit .vimrc
	nmap <Leader>v :call g:OpenVimrc()<CR>
	" Substitute with \v
	nmap <Leader>s :%s/\v/<left>
	vmap <Leader>s :s/\v/<left>

	" Substitute highlighted text
	vmap <Leader>r "hy :%s/<C-r>h//g<left><left>

	" Remove trailing spaces
	map <Leader>ts :%s/\s\+$//e<CR>

	" Grep current word in current directory
	nnoremap <Leader>f :<C-u>execute "Ack " . expand("<cword>") <Bar> cw<CR>

	" Mappings for tabs
	map <F5> :tabclose<CR>
	map <F6> :tabprev<CR>
	map <F7> :tabnext<CR>
	map <F8> :tabnew<CR>

	" Enable/disable smart/auto indent
	function! g:ToggleAi()
		if &smartindent == 1
			:set nosmartindent
			:set noautoindent
			echo "Disabled smart indent"
		else
			:set smartindent
			:set autoindent
			echo "Enabled smart indent"
		endif
	endfunction
	map <F9> :call g:ToggleAi()<CR>

	" Toggle indent width
	let s:currWidth = ""
	let s:tabWidths = [ "2", "4", "4t", "8t" ]

	" Arguments:
	" a:width string - <tab stop count><tab flag>
	" a:1 boolean    - should echo the currently set tab stop
	function! s:setIndentWidth(width, ...)
		" Optional arguments
		let l:echo = get(a:, 1, v:true) " boolean argument

		" Parse required argement
		let l:width = substitute(a:width, '^\([0-9]\+\).*$', '\1', '')
		let l:tabs = substitute(a:width, '^[0-9]\+\(t\?\)$', '\1', '')

		execute 'set tabstop=' . l:width
		execute 'set shiftwidth=' . l:width
		if l:tabs == 't'
			set noexpandtab
		else
			set expandtab
		endif
		let s:currWidth = a:width
		if l:echo
			echo "Current tab-width: " . a:width
		endif
	endfunction

	" Set default tabstop = 2, with no expand tabs
	call s:setIndentWidth("2", 0)

	function! g:ToggleIndentWidth()
		let l:idx  = index(s:tabWidths, s:currWidth)
		let l:next = s:tabWidths[(l:idx + 1) % len(s:tabWidths)]
		call s:setIndentWidth(l:next)
	endfunction
	nmap <F11> :call g:ToggleIndentWidth()<CR>

	" Insert new line without entering insert mode
	nmap <S-Enter> O<Esc>
	nmap <CR> o<Esc>

	" Line highlight
	nmap <F12> :set cursorcolumn!<CR>
	vmap <F12> :set cursorcolumn!<CR>
	imap <F12> <Esc>:set cursorcolumn!<CR>a

	" Press space to clear search highlighting and any message already displayed.
	nnoremap <silent> <Space> :silent noh<Bar>echo<CR>
	" Don't use Ex mode, use Q for formatting
	map Q gq

	" Map subtract to CTRL-S
	vnoremap <C-S> <C-X>
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

	" Toggle paste mode
	set pastetoggle=<Leader>p

	" Use CTRL-Q to do what CTRL-V used to do
	noremap <C-Q>		<C-V>

	" For CTRL-V to work autoselect must be off.
	" On Unix we have two selections, autoselect can be used.
	if !has("unix")
		set guioptions-=a
	endif

	function! g:ToggleMenu()
		if &guioptions =~# "m"
			set guioptions-=m
		else
			set guioptions+=m
		endif
	endfunction
	nmap <Leader>m :call g:ToggleMenu()<CR>

	" Vertical split on go-to file
	nmap gf :vertical wincmd f<CR>

	" N Рё n
	" Search results centered on walkthough
	nmap n nzz
	nmap N Nzz
	nmap * *zz
	nmap # #zz
	nmap g* g*zz
	nmap g# g#zz

	" Map ctrl-movement keys to window switching
	map <C-k> <C-w><Up>
	map <C-j> <C-w><Down>
	map <C-l> <C-w><Right>
	map <C-h> <C-w><Left>

" }}}

" Commands {{{

	" Resize splits when the window is resized
	autocmd VimResized * exe "normal! \<c-w>="

	" Automaticaly execute vimrc on save
	if has("win32")
		autocmd! bufwritepost _vimrc source $MYVIMRC
	else
		autocmd! bufwritepost .vimrc source $MYVIMRC
	endif

	" Auto change the directory to the current file I'm working on
	autocmd BufEnter * lcd %:p:h

	" Bind quit and write commands to its upper case analogs
	command! Q q
	command! W w
	command! Wa wa
	command! WA wa

" }}}

" Custom tabs {{{

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
			let tt .= "\n"
			let name = bufname(bufnr)
			if name == ''
				if getbufvar(bufnr, "&quickfix")
					let name = "[Quick Fix]"
				else
					let name = "[No Name]"
				endif
			endif
			let tt .= "    " . name
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

" }}}

" Plugins {{{

	" NerdTree {{{

		nmap <BS> :NERDTreeToggle<CR>
		nmap <C-\> :NERDTreeFind<CR>
		let NERDTreeShowBookmarks=1
		let NERDTreeChDirMode=2
		let NERDTreeQuitOnOpen=1
		let NERDTreeKeepTreeInNewTab=0
		let NERDTreeBookmarksFile= '~/.vim/.NERDTreeBookmarks'

	" }}}

	" Emmet.vim (Zencoding) {{{

		let g:user_emmet_leader_key = '<C-z>'

		let g:user_emmet_settings = {
		\  'php' : {
		\    'extends' : 'html',
		\  },
		\  'xml' : {
		\    'extends' : 'html',
		\  },
		\  'haml' : {
		\    'extends' : 'html',
		\  },
		\}

	" }}}

	" Solarized.vim {{{

		set t_Co=16
		let g:solarized_termcolors=16
		let g:solarized_visibility="low"
		let g:solarized_hitrail=1
		if has("gui")
			let g:solarized_contrast="normal"
			let g:solarized_menu=1
		else
			let g:solarized_termtrans=1
		endif

		try
			call togglebg#map("<F10>")
		catch /^Vim\%((\a\+)\)\=:E117/
			" :(
		endtry

		set background=dark
		try
			colorscheme solarized
		catch /^Vim\%((\a\+)\)\=:E185/
			echo "Solarized theme not found. Run :PluginInstall"
		endtry

	" }}}

	" SnipMate {{{
		let g:snipMate = { 'snippet_version' : 1 }
	" }}}

" }}}

" Status line {{{

	set laststatus=2 "always show status

	" Airline {{{

		if !exists('g:airline_symbols')
			let g:airline_symbols = {}
		endif

		if has('gui') && &guifont =~ "^Consolas for Powerline.*$"
			let g:airline_left_sep = ''
			let g:airline_left_alt_sep = ''
			let g:airline_right_sep = ''
			let g:airline_right_alt_sep = ''
			let g:airline_symbols.branch = ''
			let g:airline_symbols.readonly = ''
			let g:airline_symbols.linenr = ''
			let g:airline_detect_iminsert=1
		else
			let g:airline_left_sep = '>'
			let g:airline_left_alt_sep = '>'
			let g:airline_right_sep = '<'
			let g:airline_right_alt_sep = '<'
			let g:airline_symbols.branch = '$'
			let g:airline_symbols.readonly = '*'
			let g:airline_symbols.linenr = '#'
			let g:airline_detect_iminsert=1
		endif

		let g:airline#extensions#keymap#enabled = 0

	" }}}

	" Syntastic {{{

		let g:syntastic_check_on_open = 0
		let g:syntastic_check_on_wq = 0
		let g:syntastic_mode_map = { "mode": "passive" }

	" }}}

" }}}

" PL/SQL {{{

	let g:sql_type_default = 'plsql'
	let plsql_legacy_sql_keywords = 1

" }}}

" vim:ts=4:sw=4:noet
