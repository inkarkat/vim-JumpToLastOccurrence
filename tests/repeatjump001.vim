" Test repetition of jump. 

source helpers/insertAndJump.vim

let g:count = 1
call VerifyJump('', ',f0;', 'repeat f0')
call VerifyJump('', ',t0;', 'repeat t0')
call VerifyJump('', ',Ft;', 'repeat Ft')
call VerifyJump('', ',Tt;', 'repeat Tt')

call vimtest#SaveOut()
call vimtest#Quit()
