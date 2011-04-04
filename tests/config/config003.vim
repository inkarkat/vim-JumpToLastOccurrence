" Test visual vs. select mode mapping with default comma. 

source ../helpers/insertAndJump.vim

runtime plugin/JumpToLastOccurrence.vim

let g:count = 1
call VerifyJump('', 'v,f0rX', 'mapping in visual mode')
call VerifyJump('', 'gh,f0rX', 'mapping in select mode')

call vimtest#SaveOut()
call vimtest#Quit()
