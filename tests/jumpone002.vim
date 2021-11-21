" Test single jump to ends of the line. 

call vimtest#SkipAndQuitIf(! vimtest#features#SupportsNormalWithCount(), 'Need support for :normal with count')

source helpers/insertAndJump.vim

call VerifyModes('', ',f>', 'forward to last >')
call VerifyModes('', ',t>', 'forward until last >')
call VerifyModes('', ',Fn', 'backward to last n')
call VerifyModes('', ',Tn', 'backward until last n')

call vimtest#SaveOut()
call vimtest#Quit()
