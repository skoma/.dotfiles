command -bar -nargs=1 OpenURL :!open <args>
command -bang -nargs=? FixQWin call QFixToggle(<bang>0)
command! -nargs=* Nf set nowrap tw=0 nolinebreak formatoptions= " disable foramting

" add tab number in tab name
function! MyTabLabel()
	" buffer_number[+] buffer_name [(number_windows)]

	" Add buffer number
	let label = v:lnum

	" Add '+' if one of the buffers in the tab page is modified
	let bufnrlist = tabpagebuflist(v:lnum)
	for bufnr in bufnrlist
		if getbufvar(bufnr, "&modified")
			let label .= '+'
			break
		endif
	endfor

	" Append the buffer name
"     let label .= ' ' . bufname(bufnrlist[tabpagewinnr(v:lnum) - 1])
	let label .= ' ' . fnamemodify(bufname(bufnrlist[tabpagewinnr(v:lnum) - 1]), ':t')

	" Append the number of windows in the tab page if more than one
	let wincount = tabpagewinnr(v:lnum, '$')
	if wincount > 1
		let label .= ' (' . wincount . ')'
	endif

	return label
endfunction

" Open URL
function! OpenURL()
	let s:uri = matchstr(getline("."), '\(\(https\=:\/\/\)\|\(www\.\)\)[^ >,;:]*')
	if s:uri != ""
"         echo s:uri
		exec "!firefox \"" . s:uri . "\""
	else
		echo "No URI found in line."
	endif
endfunction

" toggles the quickfix window.
function! QFixToggle(forced)
  if exists("g:qfix_win") && a:forced == 0
    cclose
  else
    execute "copen " . 10
  endif
endfunction

" used to track the quickfix window
augroup QFixToggle
 autocmd!
 autocmd BufWinEnter quickfix let g:qfix_win = bufnr("$")
 autocmd BufWinLeave * if exists("g:qfix_win") && expand("<abuf>") == g:qfix_win | unlet! g:qfix_win | endif
augroup END

