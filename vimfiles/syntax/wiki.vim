" Vim syntax file
" Language: Redmine wiki
" Author:   Mike Stanin
" Created:  13.02.2013 3:53:25
" Modified: 13.02.2013 3:53:27

if version < 600
	syntax clear
elseif exists("b:current_syntax")
	finish
endif

let b:current_syntax="wiki"

syn region wikiBold start=/h[1-3]\./ end="\n"
syn region wikiBold start=/\*[^*]\+/ end=/[^*]\+\*/
syn region wikiItalic start=/_/ end=/_/
syn region wikiUnderlined start=/+[^\ ]/ end=/[^\ ]+/

if version >= 508 || !exists("did_mysql_syn_inits")
  if version < 508
    let did_mysql_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  highlight wikiBold term=bold cterm=bold gui=bold
  highlight wikiItalic term=italic cterm=italic gui=italic
  highlight wikiUnderlined term=underline cterm=underline gui=underline

  delcommand HiLink
endif

