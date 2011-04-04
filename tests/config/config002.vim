" Test overriding of Plug mappings. 

source ../helpers/insertAndJump.vim

map <F5> <Plug>JumpToLastOccurrence_F
map <F6> <Plug>JumpToLastOccurrence_T
map <F7> <Plug>JumpToLastOccurrence_t
map <F8> <Plug>JumpToLastOccurrence_f
runtime plugin/JumpToLastOccurrence.vim

let g:count = 1
call VerifyModes('', "\<F8>0", 'forward to last 0')
call VerifyModes('', "\<F7>0", 'forward until last 0')
call VerifyModes('', "\<F5>t", 'backward to last t')
call VerifyModes('', "\<F6>t", 'backward until last t')

call VerifyJump('', ',f0', 'no mapping with comma')

call vimtest#SaveOut()
call vimtest#Quit()
