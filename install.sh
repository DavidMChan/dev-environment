#!/bin/bash

if [ "$EUID" -eq 0 ]
  then echo "Don't run this as root. It's not worth it."
  exit
fi

# Install the bashrc file
cp -a bashrc $HOME/.bashrc

# Install directory colors
cp -a dircolors $HOME/.dircolors

# Clone and install python utilities
git clone https://github.com/davidmchan/pyutils $HOME/pyutils

# Install bashmarks
mkdir -p $HOME/.local/bin/
wget https://raw.githubusercontent.com/huyng/bashmarks/master/bashmarks.sh -O $HOME/.local/bin/bashmarks.sh

# Enable colors in tmux
echo "set -g default-terminal \"screen-256color\"" >> ~/.tmux.conf

# Configure GIT
git config --global credential.helper store
git config --global user.name "DavidMChan"
git config --global user.email "david@iridescent.io"
git config --global core.editor vim
git config --global merge.tool vimdiff

# Install VIM
cp -a vim ${HOME}/.vim
if [[ ! -d ${HOME}/.vim/bundle/Vundle.vim ]]; then
    # Install Vundle and vim plugins
    git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
fi

set -e
cp -a vimrc $HOME/.vimrc
vim +PluginInstall +qall
chown -R $USER:$USER $HOME/.vim

# Install YouCompleteMe
python $HOME/.vim/bundle/YouCompleteMe/install.py --clang-completer --quiet
