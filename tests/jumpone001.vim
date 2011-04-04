" Test single jump. 

source helpers/insertAndJump.vim

let g:count = 1
call VerifyModes('', ',f0', 'forward to last 0')
call VerifyModes('', ',t0', 'forward until last 0')
call VerifyModes('', ',Ft', 'backward to last t')
call VerifyModes('', ',Tt', 'backward until last t')

call vimtest#SaveOut()
call vimtest#Quit()
