" Test jump with count involving the ends of the line. 

source helpers/insertAndJump.vim

let g:count = 2
call VerifyModes('', '2,f>', 'forward to previous-before-last >')
call VerifyModes('', '2,t>', 'forward until previous-before-last >')
call VerifyModes('', '2,Fn', 'backward to previous-before-last n')
call VerifyModes('', '2,Tn', 'backward until previous-before-last n')

call vimtest#SaveOut()
call vimtest#Quit()
