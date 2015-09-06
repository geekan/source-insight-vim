git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
mv ~/.vimrc ~/.vimrc.bakup
cp .*vimrc ~/
vim +PluginInstall +qall
