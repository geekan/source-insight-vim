syntax enable
" set viminfo='25,\"50,n~/.viminfo'
set undodir=~/.vimundo/
set hidden
set mouse=a
set history=50
set nobackup

filetype plugin indent on
"set cindent
set tabstop=4
set shiftwidth=4
"set softtabstop=4
set expandtab
set number
set showcmd
set showmatch
set smartcase
set incsearch
set hlsearch
:hi Search ctermbg=7
set autowrite
"set foldmethod=syntax
set fileencoding=UTF-8
set fileencodings=ucs-bom,utf-8,default,gb2312

let g:mapleader=','
let g:solarized_termcolors=256

:nnoremap <leader>ev :vsplit ~/.a.vimrc<cr>
:nnoremap <leader>sv :source $MYVIMRC<cr>
:nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
:nnoremap <leader>( viw<esc>a)<esc>hbi(<esc>lel
:nnoremap W w
:nnoremap w W
:nnoremap B b
:nnoremap b B
:vnoremap <leader>' <esc>`>a'<esc>`<i'<esc>`>
:inoremap jk <esc>
" :inoremap <Up> <esc>ka
" :inoremap <Down> <esc>ji
" :inoremap <Right> <esc>li
" :inoremap <Left> <esc>hi
:onoremap p i(
:onoremap r /return<cr>
" :onoremap i( :<c-u>normal! f(vi(<cr>

:noremap <F6> :bp<cr>
:noremap <F7> :bn<cr>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <S-F6> :bd#<CR>

" nnoremap <Down> <C-W><C-J>
" nnoremap <Up> <C-W><C-K>
" nnoremap <Right> <C-W><C-L>
" nnoremap <Left> <C-W><C-H>

" resize current buffer by +/- 5 
" nnoremap <D-left> :vertical resize -5<cr>
" nnoremap <D-down> :resize +5<cr>
" nnoremap <D-up> :resize -5<cr>
" nnoremap <D-right> :vertical resize +5<cr>

" inoremap <Down> <esc><C-W><C-J>
" inoremap <Up> <esc><C-W><C-K>
" inoremap <Right> <esc><C-W><C-L>
" inoremap <Left> <esc><C-W><C-H>

map f <Plug>(easymotion-prefix)

" :nnoremap <c-s> <esc>:wi<cr>
" :nnoremap <c-q> <esc>:wq<cr>
" :inoremap <c-s> <esc>:wi<cr>
" :inoremap <c-q> <esc>:wq<cr>

source $VIMRUNTIME/vimrc_example.vim

let g:pydiction_location = '~/.vim/bundle/pydiction/complete-dict'

set nobackup
set nowritebackup
set wildmenu

"""""""""" wesleyche/SrcExpl
source ~/.se.vimrc


"""""""""" ctags

map <C-F12> :!/usr/local/bin/ctags -R --exclude=.git --exclude=log --exclude=wutils --c++-kinds=+p --fields=+iaS --extra=+q *<CR>
" nnoremap <C-[> <C-T>

"""""""""" TagList
" taglist configuration
let Tlist_Ctags_Cmd ='/usr/local/bin/ctags'
" Taglist plugin mapping
" noremap <silent> <Leader>t :TlistToggle<CR>
:noremap <F1> <c-w><c-p>
:noremap <F2> <c-w><c-w>
:noremap <F3> :TlistToggle<CR>:NERDTreeToggle<CR>:SrcExplToggle<CR><c-w><c-l>
:noremap <F4> :set nu!<CR>:set paste!<CR>
" Taglist plugin config
let Tlist_Use_Right_Window = 1
let Tlist_Inc_Winwidth = 0
let Tlist_WinWidth = 30
" let Tlist_GainFocus_On_ToggleOpen= 1
" let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_SingleClick = 1
" let Tlist_Auto_Open = 1
" let Tlist_File_Fold_Auto_Close = 1
autocmd BufWritePost *.cpp :TlistUpdate
autocmd BufWritePost *.h :TlistUpdate
autocmd BufWritePost *.jce :TlistUpdate

"""""""""" NerdTree (and vimenter events)
" nnoremap <C-n> :NERDTreeToggle<CR>
autocmd vimenter *.cpp NERDTree
autocmd vimenter *.cpp Tlist
autocmd vimenter *.cpp SrcExpl
autocmd VimEnter *.cpp wincmd w

"autocmd BufNew   * wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"""""""""" Function for NerdTree + Taglist (auto close when 2 windows)

function! CheckLeftBuffers()
  if tabpagenr('$') == 1
    let i = 1
    while i <= winnr('$')
      " echom getbufvar(winbufnr(i), '&buftype')
      if getbufvar(winbufnr(i), '&buftype') == 'help' ||
          \ getbufvar(winbufnr(i), '&buftype') == 'quickfix' ||
          \ exists('t:NERDTreeBufName') &&
          \   bufname(winbufnr(i)) == t:NERDTreeBufName ||
          \ bufname(winbufnr(i)) == '__Tag_List__' ||
          \ bufname(winbufnr(i)) == 'Source_Explorer' ||
          \ getwinvar(i, 'SrcExpl') == 1
        let i += 1
      else
        break
      endif
    endwhile
    if i == winnr('$') + 1
      qall
    endif
    unlet i
  endif
endfunction
autocmd BufEnter * call CheckLeftBuffers()

" autocmd vimenter * :SrcExplToggle
" autocmd VimEnter * wincmd p

" nnoremap <CR> <c-w><c-j><CR>
" nnoremap <C-N> :FufTag<CR>
" inoremap <C-N> <esc>:FufTag<CR>



"""""""""" tabline

hi TabLine      ctermfg=Black  ctermbg=Green     cterm=NONE
hi TabLineFill  ctermfg=Black  ctermbg=Green     cterm=NONE
hi TabLineSel   ctermfg=White  ctermbg=DarkBlue  cterm=NONE


"""""""""" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1



set clipboard=unnamed

