" Vim syntax file
" Language:     ADIF Files
" Maintainer:   Tom Swartz  <tom@tswartz.net>
" Last Change:  18 Oct 2024
" Version:      0.1
" URL:		http://github.com/tomswartz07/vim-ham-syntax

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

setlocal iskeyword+=:
syn case ignore

" Treat these keywords specially as they mark the end of the header and
" individual records respectively.
syntax keyword adifKeywords eoh eor

" In an ADIF header lines that don't begin with '<' are ignored by parsers and
" can be considered as comments.  Apprently, lines with leading space before
" the first '<' are valid, so try to avoid marking them as comments.  Ugh.
syntax match adifComment /\v^[^ <]\p+$/

" A record element has the form of <CALL:4:S>N0NB
" Which are:
" Field Name	Letters and underscore	Mandatory
" Data Length	Unsigned decimal digits	Mandatory
" Data Type	Letter			Optional

" Match the Field Name inside the left arrow bracket up to the colon:
syntax match adifIdentifier	/\v<\zs\w+\ze:/

" Match the Data Length value between the first colon and optional second
" colon or right angle bracket.
syntax match adifNumber		/\v:\zs\d+\ze(:|>)/

" Match the Data Type value between the second colon and the right angle
" bracket.
syntax match adifDefine		/\v:\zs\a\ze>/

"Match the string between > and <.
syntax match adifString		/\v\>\zs[^<]+/

" Highlighting links
highlight default link adifKeywords	Keyword
highlight default link adifIdentifier	Label
highlight default link adifComment	Comment
highlight default link adifNumber	Number
highlight default link adifDefine	Define
highlight default link adifString	String

let b:current_syntax = "adif"
