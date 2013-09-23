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

	" Add Vundle to runtime path
	set rtp+=~/.vim/bundle/vundle/
	call vundle#rc()

	" Let Vundle manage Vundle
	" Required!
	Bundle 'gmarik/vundle'

	" Bundle {{{

		" Zencoding
		Bundle 'git://github.com/mattn/zencoding-vim.git'
		" Provides easy code commenting
		Bundle 'git://github.com/scrooloose/nerdcommenter.git'
		" A tree explorer plugin
		Bundle 'git://github.com/scrooloose/nerdtree.git'
		" Syntax checker
		Bundle 'git://github.com/scrooloose/syntastic.git'
		" Matchit
		Bundle 'git://github.com/vim-scripts/matchit.zip.git'

		" HTML5 omnicomplete and syntax
		Bundle 'git://github.com/othree/html5.vim.git'
		Bundle 'git://github.com/hokaccha/vim-html5validator.git'
		Bundle 'git://github.com/gregsexton/MatchTag.git'

		" CSS3 syntax support
		Bundle 'git://github.com/hail2u/vim-css3-syntax.git'
		" Highlight colors in css files
		Bundle 'git://github.com/ap/vim-css-color.git'
		Bundle 'git://github.com/groenewege/vim-less.git'
		Bundle 'git://github.com/miripiruni/vim-better-css-indent.git'

		" Javascript
		" Vastly improved vim's javascript indentation
		Bundle 'git://github.com/pangloss/vim-javascript.git'
		" Syntax for jQuery keywords and css selectors
		Bundle 'git://github.com/itspriddle/vim-jquery.git'

		" JSON
		Bundle 'git://github.com/leshill/vim-json.git'

		" PIV - PHP Integration environment for Vim
		Bundle 'git://github.com/spf13/PIV.git'

		" PHP Syntax
"		Bundle 'git://github.com/vim-scripts/php.vim--Garvin.git'
		" PHP Indenting
"		Bundle 'git://github.com/2072/PHP-Indenting-for-VIm.git'

	" }}}

	" Required!
	filetype plugin indent on

" }}}

" Interface {{{

	" Enable syntax highlight
	syntax on
	" Set colorscheme to my modification of dark blue
	colorscheme darkblue_rmx
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
	" Use following characters to display service chars
	set list
	" Char for service characters
	set listchars=tab:\|-,trail:.
	" Show matching <> () [] {}
	set showmatch
	" Line hightlight
	set cursorline
	" Make a border right line
	set colorcolumn=120
	" Do smart indenting when starting a new line
	set smartindent
	" Copy indent from current line when starting a new line
	set autoindent
	" Codepage sequence and file formats for nix in win is diffedent
	if has('unix')
		" First use nix file format (CR)
		set fileformats=unix,dos
	else
		" First use dos file format (CRLF)
		set fileformats=dos,unix
	endif
	" File endcoding detection sequence - first try UTF-8, than Windows 1251, etc...
	set fileencodings=utf-8,cp1251,koi8-r,cp866
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
			if has('win32')
				set guifont=Consolas:h11:cRUSSIAN::
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
	set noswapfile
	" Keep 9999 lines of command line history
	set history=9999
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

	function! FileSize()
		let bytes = getfsize(expand("%:p"))
		if bytes <= 0
			return ""
		endif
		if bytes < 1024
			return bytes . "B"
		else
			return (bytes / 1024) . "K"
		endif
	endfunction

	function! CurDir()
		return expand('%:p:~')
	endfunction

	set laststatus=2 "always show status
	set statusline=\ 
	set statusline+=\ %{'#'}%n: 
	set statusline+=\ %y
	set statusline+=%<
	set statusline+=\ %{CurDir()}
	set statusline+=\ \[%{FileSize()}\]
	set statusline+=\ %m
	set statusline+=\ %{'Enc:\ '.&fileencoding}
	set statusline+=%#warningmsg#
	set statusline+=%{SyntasticStatuslineFlag()}
	set statusline+=%*
	set statusline+=%r%=
	set statusline+=\ %3.3(%c%)
	set statusline+=\ %3.9(%l/%L%)
	set statusline+=\ %2.3p%%\ \ 

" }}}

" Mappings {{{

	" Start of user maps
	let mapleader = ","

	" Execute .vimrc
	nmap <Leader>s :source $MYVIMRC<CR>
	" Edit .vimrc
	nmap <Leader>v :tabnew $MYVIMRC<CR>

	" Remove trailing spaces
	map <Leader>ts :%s/\s\+$//e<CR>

	" Mappings for tabs
	map <F5> :tabclose<CR>
	map <F6> :tabprev<CR>
	map <F7> :tabnext<CR>
	map <F8> :tabnew<CR>

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

	" Vertical split on go-to file
	nmap gf :vertical wincmd f<CR>

	" N и n
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

" }}}
