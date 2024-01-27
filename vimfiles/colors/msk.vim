hi clear
if exists("syntax_on")
  syntax reset
endif

let colors_name="msk"
set background=dark

"hi Normal ctermbg=232 ctermfg=248 guifg=#CDC7BE guibg=#080808
hi Normal ctermbg=black ctermfg=white guifg=#c3c3c3 guibg=#101010

hi ErrorMsg term=standout ctermbg=DarkRed ctermfg=White guibg=#080808 guifg=Red
hi ModeMsg term=bold cterm=bold gui=bold
hi MoreMsg term=bold ctermfg=LightGreen gui=bold guifg=SeaGreen
hi WarningMsg term=standout ctermfg=LightRed guifg=White guibg=#080808
hi Question term=standout ctermfg=LightGreen gui=bold guifg=Green

"hi User1 guibg=Black guifg=#00ffff
hi User2        ctermbg=235 ctermfg=160 cterm=bold guibg=#222222 guifg=Red     gui=bold 
"hi User3 guibg=Black guifg=#777777
hi StatusLine   ctermbg=235 ctermfg=14  cterm=none guifg=#00e3e3 guibg=#222222 gui=none 
hi StatusLineNC ctermbg=235 ctermfg=244 cterm=none guifg=#787878 guibg=#222222 gui=none

" hi VertSplit term=reverse cterm=reverse gui=reverse
hi VertSplit guibg=#222222 guifg=#222222 ctermfg=235 ctermbg=235
hi Visual term=reverse ctermbg=4 guibg=#074444 guifg=White
hi VisualNOS term=underline,bold cterm=underline,bold gui=underline,bold
hi DiffText term=reverse cterm=bold ctermbg=Red gui=bold guibg=Red
hi Cursor   term=reverse guifg=Black  guibg=White ctermfg=Black ctermbg=White
hi CursorIM	guifg=Magenta guibg=Brown
"hi ColorColumn guibg=Magenta guifg=Brown
"hi CursorColumn guibg=Black
"hi CursorLine guibg=Black

"hi iCursor guibg=Cyan guifg=Black
"hi vCursor guibg=Cyan guifg=Black
"hi lCursor guibg=Cyan guifg=Black

hi Directory term=bold ctermfg=LightCyan guifg=Brown
hi NonText guifg=darkgray ctermfg=darkgray

"hi Search ctermfg=white ctermbg=24 guibg=DarkCyan guifg=White
"hi Search ctermfg=white ctermbg=24 guibg=#114444 guifg=White
hi Search ctermfg=white ctermbg=24 guifg=yellow guibg=#6d2222
hi IncSearch term=reverse cterm=reverse gui=reverse
"hi IncSearch term=reverse cterm=reverse gui=reverse
hi MatchParen guibg=#226666 guifg=white ctermfg=lightcyan ctermbg=black

hi Pmenu      guifg=white   guibg=#222222 ctermfg=white ctermbg=235
hi PmenuSel   guifg=#00e3e3 guibg=#333333 ctermfg=14    ctermbg=234
hi PmenuSbar  guibg=#333333 ctermbg=234
hi PmenuThumb guibg=#00e3e3 ctermbg=14

"hi Pmenu    guifg=white   guibg=#222222 ctermfg=14 ctermfg=235
"hi PmenuSel guifg=#00e3e3 guibg=#222222 ctermfg=14 ctermfg=235


hi SpecialKey guibg=black guifg=#ff2121

"hi Title term=bold ctermfg=LightMagenta gui=bold guifg=#00ffff
hi Terminal guifg=Magenta
hi WildMenu term=standout ctermbg=Yellow ctermfg=Green guibg=Yellow guifg=Blue
"hi Folded term=standout ctermbg=LightGrey ctermfg=DarkBlue guibg=LightGrey guifg=DarkBlue
"hi FoldColumn term=standout ctermbg=LightGrey ctermfg=DarkBlue guibg=Grey guifg=DarkBlue
"hi DiffAdd term=bold ctermbg=DarkBlue guibg=DarkBlue
"hi DiffChange term=bold ctermbg=DarkMagenta guibg=DarkMagenta
"hi DiffDelete term=bold ctermfg=Blue ctermbg=DarkCyan gui=bold guifg=Blue guibg=DarkCyan


" Groups for syntax highlighting
"
hi Comment ctermfg=238 gui=NONE guifg=#777777
"hi Constant guifg=#00ffff
hi Constant guifg=#f38080 ctermfg=45
hi String  guifg=#00e3e3 guibg=#1c1c1c ctermfg=45 ctermbg=black
" String		a string constant: "this is a string"
" Character	a character constant: 'c', '\n'
" Number		a number constant: 234, 0xff
" Boolean	a boolean constant: TRUE, false
" Float		a floating point constant: 2.3e10

hi Identifier guifg=#fff000 ctermfg=184
" hi Identifier guifg=#88FF88
hi Function guifg=#cde4ff

hi Statement gui=bold guifg=#ffffff ctermfg=white cterm=bold
"hi Statement gui=NONE guifg=#ffffff ctermfg=white cterm=bold
" hi Conditional gui=bold guifg=Orange
" hi Repeat guifg=Orange gui=bold
" hi Label guifg=Orange
" hi Operator guifg=Orange gui=bold
" hi Keyword guifg=Orange
" hi Exception guifg=Orange gui=bold


hi PreProc gui=NONE guifg=#e3e350 ctermfg=184
"hi Include gui=NONE guifg=#ffff50  ctermfg=184
"hi Define  gui=NONE guifg=#000050  ctermfg=184
"Include	preprocessor #include
"Define		preprocessor #define
"Macro		same as Define
"PreCondit	preprocessor #if, #else, #endif, etc.

hi Type gui=none guifg=#81fa81 ctermfg=green cterm=bold
" StorageClass	static, register, volatile, etc.
" Structure	struct, union, enum, etc.
" Typedef	A typedef
hi Structure    gui=bold guifg=#ffffff ctermfg=white cterm=bold
hi StorageClass gui=bold guifg=#f78888 ctermfg=lightred cterm=bold
hi Typedef      gui=bold guifg=#ff0000 ctermfg=lightred cterm=bold


hi Special term=NONE ctermfg=LightRed guifg=#99f3f3 guibg=black
"SpecialChar	special character in a constant
"Tag		you can use CTRL-] on this
"Delimiter	character that needs attention
"SpecialComment	special things inside a comment
hi Debug guifg=SeaGreen

hi Underlined ctermfg=DarkGrey guifg=#080808 guibg=White
hi Ignore ctermfg=DarkGrey guifg=#080808 guibg=White
hi Error guibg=#080808 guifg=DarkRed ctermfg=124
hi Todo guifg=red guibg=#080808  gui=bold ctermfg=160 ctermbg=232 cterm=bold

"hi QuickFixLine ctermbg=Yellow guibg=Yellow
" TODO NOTE IMPORTANT QUESTIONS
hi myImportant guifg=Yellow    guibg=#080808 gui=bold cterm=bold ctermfg=yellow
hi myNote      guifg=darkgreen guibg=#080808 gui=bold cterm=bold ctermfg=darkgreen
hi myQuestions guifg=#82bdbd   guibg=#080808 gui=bold cterm=bold ctermfg=LightBlue

" hi Statement term=bold cterm=bold ctermfg=Yellow guifg=#ffff60 gui=bold


" Highlight custom keywords
augroup HiglightCustomKeywords
    autocmd!
    autocmd WinEnter,VimEnter * :silent! call matchadd('myNote', 'NOTE', 10)
    autocmd WinEnter,VimEnter * :silent! call matchadd('myImportant', 'IMPORTANT', 10)
    autocmd WinEnter,VimEnter * :silent! call matchadd('myQuestions', 'QUESTIONS', 10)
"    autocmd WinEnter,VimEnter * :silent! call matchadd('myType', 'b32\|s8\|u8\|s16\|u16\|u32\|s32\|s64\|u64\|f32\|f64\|umm\|smm\|mem\|rect2\|rect3\|m4\|m4_inv\|v2\|v3\|v4', 10)
augroup END
"hi myType gui=bold guifg=Green







" ColorColumn	used for the columns set with 'colorcolumn'
" Conceal		placeholder characters substituted for concealed text (see 'conceallevel')
" Cursor		the character under the cursor *hl-CursorIM*
" CursorIM	like Cursor, but used when in IME mode |CursorIM| 
" CursorColumn	the screen column that the cursor is in when 'cursorcolumn' is set 
" CursorLine	the screen line that the cursor is in when 'cursorline' is set 
" Directory	directory names (and other special names in listings) 
" DiffAdd		diff mode: Added line |diff.txt|
" DiffChange	diff mode: Changed line |diff.txt| 
" DiffDelete	diff mode: Deleted line |diff.txt|
" DiffText	diff mode: Changed text within a changed line |diff.txt| 
" EndOfBuffer	filler lines (~) after the last line in the buffer.  By default, this is highlighted like |hl-NonText|. 
" ErrorMsg	error messages on the command line
" VertSplit	the column separating vertically split windows
" Folded		line used for closed folds
" FoldColumn	'foldcolumn'
" SignColumn	column where |signs| are displayed
" IncSearch	'incsearch' highlighting; also used for the text replaced with ":s///c"
" LineNr		Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
" CursorLineNr	Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
" MatchParen	The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
" ModeMsg		'showmode' message (e.g., "-- INSERT --")
" MoreMsg		|more-prompt| *hl-NonText*
" NonText		'@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text
"             (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). 
" Normal		normal text
" Pmenu		Popup menu: normal item.
" PmenuSel	Popup menu: selected item.
" PmenuSbar	Popup menu: scrollbar
" PmenuThumb	Popup menu: Thumb of the scrollbar.
" Question	|hit-enter| prompt and yes/no questions
" QuickFixLine	Current |quickfix| item in the quickfix window.
" Search		Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
" SpecialKey	Meta and special keys listed with ":map", also for text used to show unprintable characters in the text, 'listchars'.
" 	     	Generally: text that is displayed differently from what it really is. 
" SpellBad	Word that is not recognized by the spellchecker. |spell| This will be combined with the highlighting used otherwise. 
" SpellCap	Word that should start with a capital. |spell| This will be combined with the highlighting used otherwise.
" SpellLocal	Word that is recognized by the spellchecker as one that is used in another region. |spell| This will be combined with
"             the highlighting used otherwise.
" SpellRare	Word that is recognized by the spellchecker as one that is hardly ever used. |spell|
" 	        This will be combined with the highlighting used otherwise.
" StatusLine	status line of current window 
" StatusLineNC	status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in
" 	          	the status line of the current window.
" StatusLineTerm	status line of current window, if it is a |terminal| window.
" StatusLineTermNC   status lines of not-current windows that is a |terminal| window.
" TabLine		tab pages line, not active tab page label
" TabLineFill	tab pages line, where there are no labels
" TabLineSel	tab pages line, active tab page label
" Terminal	|terminal| window (see |terminal-size-color|)
" Title		titles for output from ":set all", ":autocmd" etc.
" Visual		Visual mode selection *hl-VisualNOS*
" VisualNOS	Visual mode selection when vim is "Not Owning the Selection".  Only X11 Gui's |gui-x11| and |xterm-clipboard| supports this.
" WarningMsg	warning messages

