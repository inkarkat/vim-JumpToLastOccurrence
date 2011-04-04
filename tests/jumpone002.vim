" Test single jump to ends of the line. 

source helpers/insertAndJump.vim

let g:count = 1
call VerifyModes('', ',f>', 'forward to last >')
call VerifyModes('', ',t>', 'forward until last >')
call VerifyModes('', ',Fn', 'backward to last n')
call VerifyModes('', ',Tn', 'backward until last n')

call vimtest#SaveOut()
call vimtest#Quit()
