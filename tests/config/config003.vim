" Test visual vs. select mode mapping with default comma. 

call vimtest#SkipAndQuitIf(! vimtest#features#SupportsNormalWithCount(), 'Need support for :normal with count')

source ../helpers/insertAndJump.vim

runtime plugin/JumpToLastOccurrence.vim

call VerifyJump('', 'v,f0rX', 'mapping in visual mode')
call VerifyJump('', 'gh,f0rX', 'mapping in select mode')

call vimtest#SaveOut()
call vimtest#Quit()
