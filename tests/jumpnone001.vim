" Test single jump to non-existing character. 

call vimtest#SkipAndQuitIf(! vimtest#features#SupportsNormalWithCount(), 'Need support for :normal with count')

source helpers/insertAndJump.vim

call VerifyModes('', ',fZ', 'forward to last Z')
call VerifyModes('', ',tZ', 'forward until last Z')
call VerifyModes('', ',FZ', 'backward to last Z')
call VerifyModes('', ',TZ', 'backward until last Z')


call vimtest#SaveOut()
call vimtest#Quit()
