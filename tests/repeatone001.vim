" Test repeat single jump.

call vimtest#SkipAndQuitIf(! vimtest#features#SupportsNormalWithCount(), 'Need support for :normal with count')

source helpers/insertAndJump.vim

call VerifyModes('', ',f0', 'forward to last 0', 1)
call VerifyModes('', ',t0', 'forward until last 0', 1)
call VerifyModes('', ',Ft', 'backward to last t', 1)
call VerifyModes('', ',Tt', 'backward until last t', 1)

call vimtest#SaveOut()
call vimtest#Quit()
