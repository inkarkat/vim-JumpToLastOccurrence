" Test repeat single jump with count.

call vimtest#SkipAndQuitIf(! vimtest#features#SupportsNormalWithCount(), 'Need support for :normal with count')

source helpers/insertAndJump.vim

call VerifyModes('', ',f0', 'forward to last 0', 3)
call VerifyModes('', ',t0', 'forward until last 0', 3)
call VerifyModes('', ',Fn', 'backward to last n', 2)
call VerifyModes('', ',Tn', 'backward until last n', 2)

call vimtest#SaveOut()
call vimtest#Quit()
