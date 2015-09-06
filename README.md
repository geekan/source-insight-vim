# source-insight-vim
It's a source insight like vim.

Screen capture:

![example](https://github.com/geekan/source-insight-vim/blob/master/example.png?raw=true)

##Hotkeys

####Windows:

    :noremap <F1> <c-w><c-p>
    :noremap <F2> <c-w><c-w>
    :noremap <F3> :TlistToggle<CR>:NERDTreeToggle<CR>:SrcExplToggle<CR><c-w><c-l>
    :noremap <F4> :set nu!<CR>:set paste!<CR>
    nnoremap <C-J> <C-W><C-J>
    nnoremap <C-K> <C-W><C-K>
    nnoremap <C-L> <C-W><C-L>
    nnoremap <C-H> <C-W><C-H>

####Buffers:

    :noremap <F6> :bp<cr>
    :noremap <F7> :bn<cr
    nnoremap <S-F6> :bd#<CR>

####Others: 

    map <C-F12> :!/usr/local/bin/ctags -R --exclude=.git --exclude=log --exclude=wutils --c++-kinds=+p --fields=+iaS --extra=+q *<CR>
    map f <Plug>(easymotion-prefix)
