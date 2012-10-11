" Vim syntax file
" Language: JavaScript
" Original Creator: Spencer Tipping <spencer@spencertipping.com>
" Modified By: Josh Hoak<jrhoak@gmail.com>

if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'javascript'
endif

set cinoptions=JN,0{,0},0),J1,0#,!^F,o,O,e

syn case match
setlocal iskeyword=48-57,95,36,A-Z,a-z

"syn region    jsParenGroup              matchgroup=jsParen   start=/(/  end=/)/  contains=TOP
"syn region    jsBracketGroup            matchgroup=jsBracket start=/\[/ end=/\]/ contains=TOP
"syn region    jsBraceGroup              matchgroup=jsBrace   start=/{/  end=/}/  contains=TOP

syn match     jsModClass                /\(^\|new \)\@<=[A-Z]\w\+\(\.\| \|(\)\@=/ containedin=ALLBUT,jsBlockComment,jsLineComment
syn match     jsModEnum                 /\<[A-Z][A-Z_]\+\>/ containedin=ALLBUT,jsBlockComment,jsLineComment
syn match     jsBrackets                '[\[\](){}]' containedin=ALLBUT,jsBlockComment,jsLineComment
syn match     jsDot                     /\./ containedin=ALLBUT,jsBlockComment,jsLineComment

syn region    jsTernary                 matchgroup=jsTernaryOperator start=/?/ end=/:/ contains=TOP,jsColonLHS
syn match     jsOperator                /[-+*^%&\|!~;=><,]\{1,4\}/

syn keyword   jsReservedToplevel        if else switch while for do break continue return with case default try catch finally throw delete void
syn keyword   jsOperator                in instanceof typeof new
syn keyword   jsBuiltinType             Array Boolean Date Function Number Object String RegExp
syn keyword   jsBuiltinLiteral          true false null undefined

syn keyword   jsBuiltinValue            this arguments
syn keyword   jsPrototype               prototype constructor

syn match     jsAssignment              /\k\+\s*[-+*/^&|%<>]*=[^=]\@=/ contains=jsOperator

syn match     jsWordPrefix              /[-\/|,]\k\@=/

syn match     jsIdentifier              /[A-Za-z$_][A-Za-z0-9$_]*/
syn match     jsNumber                  /-\?0x[0-9A-Fa-f]\+\|-\?\(\d*\.\d\+\|\d\+\.\d*\|\d\+\)\([eE][+-]\?\d\{1,3\}\)\?\|-\?0[0-7]\+/
syn region    jsStringD                 matchgroup=jsQuote start=/"/ skip=/\\\\\|\\"/ end=/"/ oneline keepend contains=jsStringEscape
syn region    jsStringS                 matchgroup=jsQuote start=/'/ skip=/\\\\\|\\'/ end=/'/ oneline keepend contains=jsStringEscape
syn region    jsRegexp                  matchgroup=jsQuote start=+/[^/ ]+rs=e-1 skip=+\\\\\|\\/+ end=+/[gims]*[^A-Za-z0-9 #(\[{]\@=+ oneline contains=jsStringEscape

  syn match   jsStringEscape            /\\\d\{3\}\|\\u[0-9A-Za-z]\{4\}\|\\[a-z"'\\]/ contained

syn match     jsColonLHS                /\k\+\s*:/
syn region    jsVarBinding              matchgroup=jsVarBindingConstruct start=/\<var\>\|\<const\>/ end=/;/ contains=TOP
syn match     jsVarInBinding            /var\s\+\k\+\s\+in/ contains=jsVarBindingKeyword,jsOperator
syn region    jsParamBinding            matchgroup=jsBindingConstruct start=/\(function\|catch\)\s*(/ end=/)/ contains=jsOperator

  syn keyword jsVarBindingKeyword       const var contained
  syn keyword jsBindingKeyword          function catch contained
  syn match   jsBindingAssignment       /\k\+\s*=\([^=]\|$\)\@=/ contains=jsOperator contained containedin=jsVarBinding
  syn match   jsExtraBindingAssignment  /[A-Za-z0-9$_ ]\+\(([A-Za-z0-9$_,= ]*)\)*\s*=\([^=]\|$\)\@=/ contains=jsOperator,jsParens contained containedin=jsBindingGroup
  syn match   jsCpsBindingAssignment    /[A-Za-z0-9$_ ]\+\s*<-/                                      contains=jsOperator,jsParens contained containedin=jsCaterwaulLetCps

syn keyword   jsBindingMacro            bind where   nextgroup=jsBindingGroup
syn keyword   jsFunctionMacro           given bgiven nextgroup=jsFunctionGroup
syn keyword   jsQuotationMacro          qs qse       nextgroup=jsQuotationGroup
syn keyword   jsFunctionMacro           delay lazy
syn keyword   jsOtherMacro              se effect re returning then when unless until over over_keys over_values wobbly chuck raise safely failover rescue seq object pairs keys values overload
syn keyword   jsOtherMacro              noexpand reexpand

syn cluster   jsMacro                   add=jsBindingMacro,jsFunctionMacro,jsQuotationMacro,jsOtherMacro

syn match     jsBindingGroup            /\.\k\+/ contained
syn match     jsFunctionGroup           /\.\k\+/ contained

syn match     jsParens                  /[()]/ contained
syn match     jsClosers                 /[\]})]/

syn region    jsBlockComment            start=+/\*+ end=+\*/+ contains=@Spell,jsCommentTags
syn region    jsLineComment             start=+//+  end=+$+   contains=@Spell,jsCommentTags

  syn keyword jsCommentTags             TODO FIXME XXX TBD contained

syn sync fromstart

if main_syntax == "javascript"
  syn sync ccomment javaScriptComment
endif


hi def link jsBrackets                  Special
hi def link jsWordPrefix                Special

hi def link jsBindingMacro              Special
hi def link jsFunctionMacro             Special
hi def link jsOtherMacro                Special
hi def link jsQuotationMacro            Keyword

hi def link jsFunctionGroup             Identifier

hi def link jsQuotationGroup            String

hi def link jsLineComment               Comment
hi def link jsBlockComment              Comment
hi def link jsCommentTags               Todo

hi def link jsQuote                     Special
hi def link jsNumber                    Number
hi def link jsStringS                   String
hi def link jsStringD                   String
hi def link jsRegexp                    String
hi def link jsStringEscape              Special
hi def link jsColonLHS                  Type

hi def link jsAssignment                Type
hi def link jsModClass                  Type
hi def link jsModEnum                   Number

hi def link jsParen                     Special
hi def link jsParens                    Special
hi def link jsBracket                   Special
hi def link jsBrace                     Special

hi def link jsTernaryOperator           Special

hi def link jsVarInBinding              Type

hi def link jsVarBindingKeyword         Keyword
hi def link jsVarBindingConstruct       Keyword
hi def link jsBindingConstruct          Special
hi def link jsBindingKeyword            Keyword
hi def link jsBindingAssignment         Type
hi def link jsExtraBindingAssignment    Identifier
hi def link jsParamBinding              Identifier

hi def link jsReservedToplevel          Keyword
hi def link jsOperator                  Keyword
hi def link jsDot                       Special
hi def link jsBuiltinType               Type
hi def link jsBuiltinLiteral            Special
hi def link jsBuiltinValue              Special
hi def link jsPrototype                 Special

let b:current_syntax = "javascript"
if main_syntax == 'javascript'
  unlet main_syntax
endif

