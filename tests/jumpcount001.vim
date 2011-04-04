" Test jump with count. 

source helpers/insertAndJump.vim

let g:count = 1
call VerifyModes('', '1,f0', 'forward to last 0')
call VerifyModes('', '1,t0', 'forward until last 0')
call VerifyModes('', '1,F>', 'backward to last >')
call VerifyModes('', '1,T>', 'backward until last >')

let g:count = 3
call VerifyModes('', '3,f0', 'forward to two-before-last 0')
call VerifyModes('', '3,t0', 'forward until two-before-last 0')
call VerifyModes('', '3,F>', 'backward to two-before-last >')
call VerifyModes('', '3,T>', 'backward until two-before-last >')

call vimtest#SaveOut()
call vimtest#Quit()
