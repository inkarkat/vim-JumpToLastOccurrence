" Test repetition of jump. 

call vimtest#SkipAndQuitIf(! vimtest#features#SupportsNormalWithCount(), 'Need support for :normal with count')

source helpers/insertAndJump.vim

call VerifyJump('', ',f0;', 'repeat f0')
call VerifyJump('', ',t0;', 'repeat t0')
call VerifyJump('', ',Ft;', 'repeat Ft')
call VerifyJump('', ',Tt;', 'repeat Tt')

call vimtest#SaveOut()
call vimtest#Quit()
