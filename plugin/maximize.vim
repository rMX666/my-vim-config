" Vim plugin file
" Maintainer: kAtremer <katremer@yandex.ru>
" Last changed: 2026 June 21
" Added support for Win64.
" Rewritten the C++ code for DLL.
"
" maximize.vim
" maximize gVim's window on startup on Win32 or Win64
"
" to install, put the script and maximize.dll
" in $VIM\vimfiles\plugin

" Execute only once {{{
if exists("g:loaded_maximize")
	finish
endif
let g:loaded_maximize=1
" }}}
" Set the default compatibility options {{{
" (don't know if they do any difference, in such a small script...)
let s:save_cpoptions=&cpoptions
set cpoptions&vim
" }}}

if has('win64')
	let s:dllfile=expand('<sfile>:p:h').'/maximize_x64.dll'
elseif has('win32')
	let s:dllfile=expand('<sfile>:p:h').'/maximize_x86.dll'
endif

function g:Maximize(param)
	call libcallnr(s:dllfile, 'Maximize', a:param)
endfunction

autocmd GUIEnter * call Maximize(1)

" Restore the saved compatibility options {{{
let &cpoptions=s:save_cpoptions
" }}}

" vim:fdm=marker:fmr={{{,}}}
