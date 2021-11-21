call vimtest#AddDependency('vim-ingo-library')
if g:runVimTest =~# 'repeat'
    call vimtest#AddDependency('vim-repeat')
endif

runtime plugin/JumpToLastOccurrence.vim
