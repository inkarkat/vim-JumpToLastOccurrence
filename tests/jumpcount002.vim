" Test jump with count involving the ends of the line. 

call vimtest#SkipAndQuitIf(! vimtest#features#SupportsNormalWithCount(), 'Need support for :normal with count')

source helpers/insertAndJump.vim

call VerifyModes('', '2,f>', 'forward to previous-before-last >')
call VerifyModes('', '2,t>', 'forward until previous-before-last >')
call VerifyModes('', '2,Fn', 'backward to previous-before-last n')
call VerifyModes('', '2,Tn', 'backward until previous-before-last n')

call vimtest#SaveOut()
call vimtest#Quit()
