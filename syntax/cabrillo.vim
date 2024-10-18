" Vim syntax file
" Language:     Cabrillo Files
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

" Define syntax for Start and End of Log
syntax keyword cabrilloStartEnd START-OF-LOG: END-OF-LOG:
" Define syntax groups for keywords (e.g., QSO, COMMENT, etc.)
syntax keyword cabrilloKeyword QSO: COMMENT: CREATOR: CALLSIGN: EXCHANGE: CONTEST: CREATED-BY: NAME: CLAIMED-SCORE: EMAIL: OPERATORS:
syntax match cabrilloKeyword "^CATEGORY.*:"
syntax match cabrilloKeyword "^ADDRESS.*:"

" Define match patterns for double-quoted strings (similar to `string.quoted.double`)
syntax match cabrilloString /"\([^"\\]\|\\.\)*"/

" Define match patterns for numeric constants (e.g., 1234)
syntax match cabrilloNumber /\v\d+/
syntax match cabrilloDate /\v\d{4}-\d{2}-\d{2}/

" Define match patterns for soapbox comments
syntax match cabrilloComment /\vSOAPBOX.*$/

" Link to colors (adjust colors according to your preferences or color scheme)
highlight default link cabrilloKeyword Keyword
highlight default link cabrilloCategory Keyword
highlight default link cabrilloString String
highlight default link cabrilloNumber Number
highlight default link cabrilloDate String
highlight default link cabrilloComment Comment
highlight default link cabrilloStartEnd Comment

let b:current_syntax = "cabrillo"
