let g:verifyText = 'nnoremap <silent> ,f :<C-u>call <SID>JumpToLastOccurrence(<SID>Jumper(''x'', 0, "foo"), ''n'', 0, 0)<CR>'
let g:verifyDefaultPositionCmd = '0fO'

function! InsertAndJump( positionCmd, testCmd, markCmd, isTestRepeat )
    call append(line('$'), g:verifyText)
    if a:isTestRepeat | call append(line('$'), g:verifyText) | endif

    " Do not use the very last line for testing, this is a special case.
    call append(line('$'), '*** temporary last line')
    if a:isTestRepeat
	execute '$-2normal!' (empty(a:positionCmd) ? g:verifyDefaultPositionCmd : a:positionCmd)
	execute 'normal' a:testCmd
	execute '$-1normal!' (empty(a:positionCmd) ? g:verifyDefaultPositionCmd : a:positionCmd)
	doautocmd CursorMoved | " From repeat.vim; needs to be explicitly triggered in a test.
	execute 'normal' (a:isTestRepeat > 1 ? a:isTestRepeat : '') . '.' . a:markCmd
	$-2delete _
    else
	execute '$-1normal!' (empty(a:positionCmd) ? g:verifyDefaultPositionCmd : a:positionCmd)
	execute 'normal' a:testCmd . a:markCmd
    endif
    $delete _
endfunction
function! VerifyModes( positionCmd, testCmd, description, ... )
    let l:isTestRepeat = (a:0 ? a:1 : 0)
    call append(line('$'), "")
    call append(line('$'), '> ' . a:description)

    " (modes: normal, operator, visual/inclusive, visual/exclusive)
    for [l:pre, l:post, l:mark] in (l:isTestRepeat ? [['d', '', ''], ['c', "INSERTED\<Esc>", '']] : [['', '', 'r|'], ['c', "INSERTED\<Esc>", ''], ['v', '', 'rX']])
	" Test both selection settings in visual mode.
	if l:pre ==# 'v'
	    let l:save_selection = &selection
	    set selection=inclusive
	    call InsertAndJump(a:positionCmd, l:pre . a:testCmd . l:post, l:mark, l:isTestRepeat)
	    set selection=exclusive
	    call InsertAndJump(a:positionCmd, l:pre . a:testCmd . l:post, l:mark, l:isTestRepeat)
	    let &selection = l:save_selection
	else
	    call InsertAndJump(a:positionCmd, l:pre . a:testCmd . l:post, l:mark, l:isTestRepeat)
	endif
    endfor
endfunction
function! VerifyJump( positionCmd, testCmd, description)
    call append(line('$'), "")
    call append(line('$'), '> ' . a:description)
    call InsertAndJump(a:positionCmd, a:testCmd, 'r|', 0)
endfunction
