" JumpToLastOccurrence.vim: summary
"
" DEPENDENCIES:
"
" Copyright: (C) 2010 Ingo Karkat
"   The VIM LICENSE applies to this script; see ':help copyright'. 
"
" Maintainer:	Ingo Karkat <ingo@karkat.de>
"
" REVISION	DATE		REMARKS 
"	001	11-Dec-2010	file creation

" Avoid installing twice or when in unsupported Vim version. 
if exists('g:loaded_JumpToLastOccurrence') || (v:version < 700)
    finish
endif
let g:loaded_JumpToLastOccurrence = 1

function! s:FindLastOccurrence( char, isBackward )
    " TODO: v:count
    let l:initialPosition = getpos('.')
    execute 'normal! f' . a:char
    if getpos('.') == l:initialPosition
	" No more occurrence of the char in this line. 
	return 0
    endif

    execute 'normal! $h'
    let l:beforeLastInLinePosition = getpos('.')
    execute 'silent! normal! f' . a:char
    if getpos('.') != l:beforeLastInLinePosition
	" Found last occurrence at the end of the line. 

	" Revert jump direction and go back to last occurrence. 
	execute 'silent! normal! F' . a:char . '$'
	return 1
    endif

    execute 'normal! $F' . a:char
    return 1
endfunction
function! s:JumpToLastOccurrence( mode, isBefore, isBackward )
    let l:char = nr2char(getchar())
    " TODO: Handle digraphs via <C-K>. 
    if l:char ==# "\<Esc>"
	return 
    endif

    if a:mode ==# 'v'
	normal! gv
    endif
    if s:FindLastOccurrence(l:char, a:isBackward)
	if a:mode ==# 'n' || (a:mode ==# 'v' && &selection !=# 'exclusive')
	    if a:isBefore
		normal! h
	    endif
	else
	    if ! a:isBefore
		normal! l
	    endif
	endif
    endif

endfunction

nnoremap <silent> ,f :<C-u>call <SID>JumpToLastOccurrence('n', 0, 0)<CR>
nnoremap <silent> ,F :<C-u>call <SID>JumpToLastOccurrence('n', 0, 1)<CR>
onoremap <silent> ,f :<C-u>call <SID>JumpToLastOccurrence('o', 0, 0)<CR>
onoremap <silent> ,F :<C-u>call <SID>JumpToLastOccurrence('o', 0, 1)<CR>
xnoremap <silent> ,f :<C-u>call <SID>JumpToLastOccurrence('v', 0, 0)<CR>
xnoremap <silent> ,F :<C-u>call <SID>JumpToLastOccurrence('v', 0, 1)<CR>
nnoremap <silent> ,t :<C-u>call <SID>JumpToLastOccurrence('n', 1, 0)<CR>
nnoremap <silent> ,T :<C-u>call <SID>JumpToLastOccurrence('n', 1, 1)<CR>
onoremap <silent> ,t :<C-u>call <SID>JumpToLastOccurrence('o', 1, 0)<CR>
onoremap <silent> ,T :<C-u>call <SID>JumpToLastOccurrence('o', 1, 1)<CR>
xnoremap <silent> ,t :<C-u>call <SID>JumpToLastOccurrence('v', 1, 0)<CR>
xnoremap <silent> ,T :<C-u>call <SID>JumpToLastOccurrence('v', 1, 1)<CR>

" vim: set sts=4 sw=4 noexpandtab ff=unix fdm=syntax :
