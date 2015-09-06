#!/bin/bash

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
mv ~/.vimrc ~/.vimrc.bakup.`date "+%Y%m%d.%T"`
cp .*vimrc ~/
vim +PluginInstall +qall
