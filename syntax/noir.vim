" Vim syntax file
" Language:     Noir
" Maintainer:   Louis-Amas (Louis-Amas@gmail.com)
" URL:          https://github.com/Louis-Amas/noir-vim-support

if exists("b:current_syntax")
  finish
endif

" basic
" contract, library and event are defined at bottom of file
syn keyword noirKeyword           if for let mut in struct fn pub constrain as use global
syn keyword noirConstant          true false
syn keyword noirBuiltinType       u2 u4 u8 u16 u24 u32 u40 u48 u56 u64
syn keyword noirBuiltinType       Field

hi def link noirKeyword           Keyword
hi def link noirConstant          Constant
hi def link noirBuiltinType       Type

syn match   noirOperator          /\(!\||\|&\|+\|-\|<\|>\|=\|%\|\/\|*\|\~\|\^\)/
syn match   noirNumber            /\<-\=\d\+L\=\>\|\<0[xX]\x\+\>/

hi def link noirOperator          Operator
hi def link noirNumber            Number

" Function
syn match   noirFunction          /\<fn\>/ nextgroup=noirFuncName,noirFuncArgs skipwhite
syn match   noirFuncName          contained /\<[a-zA-Z_$][0-9a-zA-Z_$]*/ nextgroup=noirFuncArgs skipwhite

hi def link noirFunction          Type
hi def link noirFuncName          Function

" Comment
syn keyword noirCommentTodo       TODO FIXME XXX TBD contained
syn region  noirLineComment       start=+\/\/+ end=+$+ contains=noirCommentTodo,@Spell
syn region  noirLineComment       start=+^\s*\/\/+ skip=+\n\s*\/\/+ end=+$+ contains=noirCommentTodo,@Spell fold

hi def link noirCommentTodo       Comment
hi def link noirLineComment       Comment
