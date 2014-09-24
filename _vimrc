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
	endif

	" Add Vundle to runtime path
	execute "set rtp+=" . s:vundle
	call vundle#rc()

	" Let Vundle manage Vundle
	" Required!
	Bundle 'gmarik/vundle'

	" Bundle {{{

		" Zencoding
		Bundle 'mattn/emmet-vim'
		" A tree explorer plugin
		Bundle 'scrooloose/nerdtree'
		" Syntax checker
		Bundle 'scrooloose/syntastic'
		" Matchit
		Bundle 'vim-scripts/matchit.zip'

		" PHP + Html correct indentation
		Bundle 'captbaritone/better-indent-support-for-php-with-html'

		" Highlight colors in css files
		Bundle 'ap/vim-css-color'

		" Javascript documentor
		Bundle 'heavenshell/vim-jsdoc'

		" Status line extention
		Bundle 'bling/vim-airline'
		" Cool git browser
		Bundle 'tpope/vim-fugitive'

		" Solarized theme
		Bundle 'altercation/vim-colors-solarized'

		" Ruby
		if has('ruby')
			Bundle 'tpope/vim-rails'
			Bundle 'tpope/vim-rake'
			Bundle 'tpope/vim-bundler'
		endif

	" }}}

	" Required!
	filetype plugin indent on

" }}}

" Interface {{{

	" Enable syntax highlight
	syntax on
	" Set colorscheme to my modification of dark blue
"	colorscheme darkblue_rmx
	" Background is dark
	set background=dark
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
	set tabstop=4
	" Tabwidth to expand in spaces
	set shiftwidth=4
	" Don't expand tabs to spaces
	set noexpandtab
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

" }}}

" Folding {{{

	set foldenable
	set foldmethod=syntax
	set foldcolumn=2
	set nofoldenable
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

" Status line {{{

	set laststatus=2 "always show status

	" Airline {{{

		if !exists('g:airline_symbols')
			let g:airline_symbols = {}
		endif

		let g:airline_left_sep = ''
		let g:airline_left_alt_sep = ''
		let g:airline_right_sep = ''
		let g:airline_right_alt_sep = ''
		let g:airline_symbols.branch = ''
		let g:airline_symbols.readonly = ''
		let g:airline_symbols.linenr = ''
		let g:airline_detect_iminsert=1
		let g:airline_theme='dark'

	" }}}

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
	let s:currWidth = "4t"
	function! g:SetIndentWidth(w)
		let l:width = substitute(a:w, '^\([0-9]\+\).*$', '\1', '')
		let l:tabs = substitute(a:w, '^[0-9]\+\(t\?\)$', '\1', '')

		execute 'set tabstop=' . l:width
		execute 'set shiftwidth=' . l:width
		if l:tabs == 't'
			set noexpandtab
		else
			set expandtab
		endif
		let s:currWidth = a:w
		echo "Current tab-width: " . a:w
	endfunction

	function! g:ToggleIndentWidth()
		if s:currWidth == "4t"
			call g:SetIndentWidth("8t")
		elseif s:currWidth == "8t"
			call g:SetIndentWidth("2")
		elseif s:currWidth == "2"
			call g:SetIndentWidth("4t")
		endif
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

" }}}

" Plugins {{{

	" PIV {{{

		" Disable php folding
		let g:DisableAutoPHPFolding = 1
		let php_folding = 0

	" }}}

	" NerdTree {{{

		nmap <BS> :NERDTreeToggle<CR>
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
		\    'filters' : 'c',
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

		let g:solarized_termcolors=16
		let g:solarized_visibility="low"
		if has("gui")
			let g:solarized_contrast="high"
			let g:solarized_menu=1
		else
			let g:solarized_termtrans=1
			let g:solarized_hitrail=1
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
			echo "Solarized theme not found. Run :BundleInstall"
		endtry

	" }}}

" }}}
