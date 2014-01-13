" JumpToLastOccurrence.vim: f{char} motions that count from the end of the line.
"
" DEPENDENCIES:
"   - ingo/motion/helper.vim autoload script
"   - ingo/query/get.vim autoload script
"
" Copyright: (C) 2010-2014 Ingo Karkat
"   The VIM LICENSE applies to this script; see ':help copyright'.
"
" Maintainer:	Ingo Karkat <ingo@karkat.de>
"
" REVISION	DATE		REMARKS
"   1.12.004	11-Jan-2014	Factor out special treatment for visual and
"				operator-pending motions to
"				ingo#motion#helper#AdditionalMovement().
"   1.12.003	02-Jan-2014	Use ingo#query#get#Char().
"   1.11.002	15-Sep-2012	Also handle move to the buffer's very last
"				character in operator-pending mode by
"				temporarily setting 'virtualedit' to "onemore".
"   1.10.001	30-Dec-2010	Split off autoload functions.
"				file creation.

function! s:GoToOccurrenceFromEnd( count, char, isBackward, initialPosition )
    let l:lastInLinePosition = getpos('.')
    execute 'silent! normal!' a:count . (a:isBackward ? 'f' : 'F') . a:char
    if getpos('.') == l:lastInLinePosition
	" There are no <count> occurrences.
	call setpos('.', a:initialPosition)
	return 0
    else
	return 1
    endif
endfunction
function! s:FindLastOccurrence( count, char, isBackward )
    let l:initialPosition = getpos('.')
    execute 'normal!' (a:isBackward ? 'F' : 'f') . a:char
    if getpos('.') == l:initialPosition
	" No more occurrence of the char in this line.
	return 0
    endif

    execute 'normal!' (a:isBackward ? '0l' : '$h')
    let l:beforeLastInLinePosition = getpos('.')
    execute 'silent! normal!' (a:isBackward ? 'F' : 'f') . a:char
    if getpos('.') != l:beforeLastInLinePosition
	" Found last occurrence at the end of the line.

	if a:count == 1
	    " Revert jump direction and go back to last occurrence.
	    execute 'silent! normal!' (a:isBackward ? 'f' : 'F') . a:char . (a:isBackward ? '0' : '$')
	    return 1
	else
	    " Revert jump direction and try to reach (<count> - 1)'th occurrence.
	    return s:GoToOccurrenceFromEnd(a:count - 1, a:char, a:isBackward, l:initialPosition)
	endif
    endif

    if a:count == 1
	execute 'normal!' (a:isBackward ? '0'.a:count.'f' : '$'.a:count.'F') . a:char
    else
	" Go to end and try to reach <count>'th occurrence.
	execute 'normal!' (a:isBackward ? '0' : '$')
	return s:GoToOccurrenceFromEnd(a:count, a:char, a:isBackward, l:initialPosition)
    endif
    return 1
endfunction
function! JumpToLastOccurrence#Jump( mode, isBefore, isBackward )
    let l:count = v:count1

    let l:char = ingo#query#get#Char()
    if empty(l:char) | return | endif

    if a:mode ==# 'v'
	normal! gv
    endif
    if s:FindLastOccurrence(l:count, l:char, a:isBackward)
	if a:isBackward
	    if a:isBefore
		normal! l
	    endif
	else
	    if a:mode ==# 'n' || (a:mode ==# 'v' && &selection !=# 'exclusive')
		if a:isBefore
		    normal! h
		endif
	    else
		if ! a:isBefore
		    call ingo#motion#helper#AdditionalMovement()
		endif
	    endif
	endif
    endif
    " XXX: omap isn't canceled.
endfunction

" vim: set ts=8 sts=4 sw=4 noexpandtab ff=unix fdm=syntax :
