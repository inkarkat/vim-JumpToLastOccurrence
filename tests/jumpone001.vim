" Test single jump. 

call vimtest#SkipAndQuitIf(! vimtest#features#SupportsNormalWithCount(), 'Need support for :normal with count')

source helpers/insertAndJump.vim

call VerifyModes('', ',f0', 'forward to last 0')
call VerifyModes('', ',t0', 'forward until last 0')
call VerifyModes('', ',Ft', 'backward to last t')
call VerifyModes('', ',Tt', 'backward until last t')

call vimtest#SaveOut()
call vimtest#Quit()
