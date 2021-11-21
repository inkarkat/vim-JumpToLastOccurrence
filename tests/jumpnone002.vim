" Test jump with count to character that does not exist that often. 

call vimtest#SkipAndQuitIf(! vimtest#features#SupportsNormalWithCount(), 'Need support for :normal with count')

source helpers/insertAndJump.vim

call VerifyModes('', '6,f<', 'forward to last <')
call VerifyModes('', '6,t<', 'forward until last <')
call VerifyModes('', '6,F<', 'backward to last <')
call VerifyModes('', '6,T<', 'backward until last <')


call vimtest#SaveOut()
call vimtest#Quit()
