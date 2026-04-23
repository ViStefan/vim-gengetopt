" syntax highlighting for gengetops .ggo files

if exists("b:current_syntax")
  finish
endif

" top-level declarations
syn keyword ggoKeyword package version purpose usage description versiontext
syn keyword ggoKeyword args option defgroup groupoption section text

" option attributes
syn keyword ggoAttribute details typestr values default dependon
syn keyword ggoAttribute required optional argoptional multiple hidden
syn keyword ggoAttribute sectiondesc group groupdesc

" argument types
syn keyword ggoType string int short long float double longdouble longlong
syn keyword ggoType flag enum no

" boolean literals
syn keyword ggoBoolean on off yes no

" long option name (quoted string after 'option')
syn match ggoLongOption /option\s\+\zs"[^"]*"/ contains=ggoKeyword

" short option character
syn match ggoShortOption /\s\zs[a-zA-Z0-9?]\ze\s/
syn match ggoShortOption /\s\zs[a-zA-Z0-9?]\ze$/
syn match ggoShortOption /\s\zs-\ze\s/
syn match ggoShortOption /\s\zs-\ze$/

" default="..."
syn match ggoDefault /default="[^"]*"/ contains=ggoString
syn match ggoDefault /default="[^"]*"/hs=s+8,he=e-1 contains=ggoDefaultString
syn region ggoDefaultString start=/"/ end=/"/ contained

" values="..."
syn match ggoValues /values="[^"]*"/ contains=ggoString
syn region ggoValuesString start=/"/ end=/"/ contained

" group="...", groupdesc="...", sectiondesc="..."
syn match ggoGroup /group="[^"]*"/ contains=ggoString
syn match ggoGroupDesc /groupdesc="[^"]*"/ contains=ggoString
syn match ggoSectionDesc /sectiondesc="[^"]*"/ contains=ggoString

" generic double-quoted strings
syn region ggoString start=/"/ end=/"/ contains=ggoEscapedChar
syn match ggoEscapedChar /\\[\\"ntr]/ contained

" comments
syn match ggoComment /#.*$/ contains=ggoTodo
syn keyword ggoTodo TODO FIXME NOTE contained

" numbers
syn match ggoNumber /\<\d\+\>/

" assignment operator
syn match ggoOperator /=/

" highlight links
hi def link ggoKeyword Keyword
hi def link ggoAttribute PreProc
hi def link ggoLongOption Identifier
hi def link ggoShortOption Identifier
hi def link ggoType Type
hi def link ggoBoolean Boolean
hi def link ggoString String
hi def link ggoDefaultString String
hi def link ggoValuesString String
hi def link ggoGroup String
hi def link ggoGroupDesc String
hi def link ggoSectionDesc String
hi def link ggoNumber Number
hi def link ggoOperator Operator
hi def link ggoComment Comment
hi def link ggoTodo Todo
hi def link ggoEscapedChar SpecialChar

let b:current_syntax = "ggo"
