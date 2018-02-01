#!/bin/bash


touch .screenrc
touch .tmux.conf
touch .vimrc
mkdir .vim
mkdir .zsh
rm ~/.screenrc  && ln -s dotfiles/.screenrc  ~/.screenrc
rm ~/.tmux.conf && ln -s dotfiles/.tmux.conf ~/.tmux.conf

cd dotfiles/.tmux/plugins/tpm
git pull
cd -
#git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

cd dotfiles/.tmux/plugins/tmux-continuum
git pull 
cd -

cd dotfiles/.tmux/plugins/tmux-resurrect
git pull 
cd -


rm ~/.tmux -rf && ln -s dotfiles/.tmux   ~/.tmux

rm ~/.vimrc   && ln -s dotfiles/.vimrc ~/.vimrc
rm ~/.vim -rf && ln -s dotfiles/.vim   ~/.vim

rm ~/.zshrc   && ln -s dotfiles/.zshrc ~/.zshrc
rm ~/.zsh -rf && ln -s dotfiles/.zsh   ~/.zsh

