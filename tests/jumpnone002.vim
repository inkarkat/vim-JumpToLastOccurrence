" Test jump with count to character that does not exist that often. 

source helpers/insertAndJump.vim

let g:count = 6
call VerifyModes('', '6,f<', 'forward to last <')
call VerifyModes('', '6,t<', 'forward until last <')
call VerifyModes('', '6,F<', 'backward to last <')
call VerifyModes('', '6,T<', 'backward until last <')


call vimtest#SaveOut()
call vimtest#Quit()
