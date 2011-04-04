" Test single jump to non-existing character. 

source helpers/insertAndJump.vim

let g:count = 1
call VerifyModes('', ',fZ', 'forward to last Z')
call VerifyModes('', ',tZ', 'forward until last Z')
call VerifyModes('', ',FZ', 'backward to last Z')
call VerifyModes('', ',TZ', 'backward until last Z')


call vimtest#SaveOut()
call vimtest#Quit()
