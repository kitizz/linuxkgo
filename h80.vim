" author Helder Correia < helder (.) pereira (.) correia (@) gmail (.) com >
" version 1.0
" feel free to modify and/or redistribute this file

set background=dark

hi clear

if exists( "syntax_on" )
    syntax reset
endif

let g:colors_name="h80"

hi Normal	guifg=White		guibg=#000020

" highlight groups
hi Cursor	guifg=#e3e3e3		guibg=#D74141
hi VertSplit	guifg=#075554		guibg=#C0FFFF	gui=none
hi Folded	guifg=black  		guibg=#FFC0C0
hi FoldColumn	guifg=tan    		guibg=#800080
hi ModeMsg	guifg=#404040		guibg=#C0C0C0
hi MoreMsg	guifg=darkturquoise	guibg=#188F90
hi NonText	guifg=#9FADC5		guibg=#334C75
hi Question	guifg=#F4BB7E       ctermfg=208
hi Search	guifg=bg     		guibg=fg
hi SpecialKey	guifg=#BF9261
hi StatusLine	guifg=#c0ffff		guibg=#004443	gui=none
hi StatusLineNC	guifg=#004443		guibg=#067C7B	gui=none
hi Title	guifg=#8DB8C3
hi Visual	guifg=black  		guibg=#C0FFC0	gui=bold
hi WarningMsg	guifg=#F60000				gui=underline
hi LineNr ctermfg=208

" syntax highlighting groups
hi Comment	guifg=#666666                           gui=italic      ctermfg=245
hi Constant	guifg=#A9EE5A				gui=bold,italic             ctermfg=112 cterm=bold
hi Identifier	guifg=#555555                                       ctermfg=238
hi Function	guifg=#555555                                           ctermfg=238
hi Statement	guifg=#ff9742                           gui=bold,italic     ctermfg=214 cterm=bold
hi PreProc	guifg=#F9449A                                           ctermfg=197 cterm=bold
hi Type		guifg=#55AAFF                           gui=bold,italic ctermfg=38 cterm=bold
hi Special	guifg=#A9EE8A
hi Todo		guifg=#FFFFFF		guibg=#FF0000

