let g:verifyText = 'nnoremap <silent> ,f :<C-u>call <SID>JumpToLastOccurrence(<SID>Jumper(''x'', 0, "foo"), ''n'', 0, 0)<CR>'
let g:verifyDefaultPositionCmd = '0fO'

function! InsertAndJump( positionCmd, testCmd)
    call append(line('$'), g:verifyText)
    normal! G0
    execute 'normal!' (empty(a:positionCmd) ? g:verifyDefaultPositionCmd : a:positionCmd)
    execute 'normal' a:testCmd
endfunction
function! VerifyModes( positionCmd, testCmd, description )
    call append(line('$'), "")
    call append(line('$'), '> ' . a:description)
    for [l:pre, l:post] in [['', 'r|'], ['c', "INSERTED\<Esc>"], ['v', 'rX']]
	call InsertAndJump(a:positionCmd, l:pre . a:testCmd . l:post)
    endfor
endfunction
function! VerifyJump( positionCmd, testCmd, description)
    call append(line('$'), "")
    call append(line('$'), '> ' . a:description)
    call InsertAndJump(a:positionCmd, a:testCmd . 'r|')
endfunction
