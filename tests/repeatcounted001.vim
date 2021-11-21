" Test repeat count jump.

call vimtest#SkipAndQuitIf(! vimtest#features#SupportsNormalWithCount(), 'Need support for :normal with count')

source helpers/insertAndJump.vim

call VerifyModes('', '3,f0', 'forward to last 0', 1)
call VerifyModes('', '3,t0', 'forward until last 0', 1)
call VerifyModes('', '2,Fn', 'backward to last n', 1)
call VerifyModes('', '2,Tn', 'backward until last n', 1)

call vimtest#SaveOut()
call vimtest#Quit()
