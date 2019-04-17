#!/bin/bash

if [ "$EUID" -eq 0 ]
  then echo "Don't run this as root. It's not worth it."
  exit
fi

# Install the bashrc file
echo -n "Installing bashrc: "
cp -a bashrc $HOME/.bashrc && echo "Done" || { echo 'Installing bashrc in ~/.bashrc failed... Quitting.' ; exit 1; }

# Install directory colors
echo -n "Installing dircolors: "
cp -a dircolors $HOME/.dircolors && echo "Done" || { echo 'Installing dircolors in ~/.dircolors failed... Quitting.' ; exit 1; } 

# Clone and install python utilities
echo -n "Installing pyutils: "
mkdir -p $HOME/.local/
git clone https://github.com/davidmchan/pyutils $HOME/.local/pyutils > /dev/null 2>&1 && echo "Done" || { echo 'Installing pyutils in ~/.local/ failed... Quitting.' ; exit 1; }

# Install bashmarks
echo -n "Installing bashmarks: "
mkdir -p $HOME/.local/bin/
wget https://raw.githubusercontent.com/huyng/bashmarks/master/bashmarks.sh -O $HOME/.local/bin/bashmarks.sh > /dev/null 2>&1  && echo "Done" || { echo 'Installing bashmarks in ~/.local/bin/ failed... Quitting.' ; exit 1; }


# Enable colors in tmux
echo -n "Setting up TMUX colors: "
echo "set -g default-terminal \"screen-256color\"" >> ~/.tmux.conf && echo "Done" || { echo 'Installing TMUX colors failed... Quitting.' ; exit 1; }

# Configure GIT
echo -n "Configuring git: "
git config --global credential.helper store && \
git config --global user.name "DavidMChan" && \
git config --global user.email "david@iridescent.io" && \
git config --global core.editor vim && \
git config --global merge.tool vimdiff && \
echo "Done" || { echo 'Configuring git failed... Quitting.' ; exit 1; }


# Install VIM

if [[ ! -d ${HOME}/.vim/bundle/Vundle.vim ]]; then
    # Install Vundle and vim plugins
    echo -n "Installing Vundle: "
    git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim > /dev/null 2>&1 && echo "Done" || { echo 'Installing Vundle failed... Quitting.' ; exit 1; }
fi

echo -n "Installing VIM syntax: "
cp -a vim ${HOME}/.vim && echo "Done" || { echo 'Installing VIM syntax failed... Quitting.' ; exit 1; }

echo -n "Installing vimrc: "
cp -a vimrc $HOME/.vimrc && echo "Done" || { echo 'Installing vimrc failed... Quitting.' ; exit 1; }

echo -n "Installing VIM plugins: "
vim +PluginInstall +qall && echo "Done" || { echo 'Installing VIM plugins failed... Quitting.' ; exit 1; }

# Install YouCompleteMe
echo -n "Installing YCM (This can take a while...): "
python $HOME/.vim/bundle/YouCompleteMe/install.py --clang-completer --quiet > /dev/null 2>&1 && echo "Done" || { echo 'Installing YCM failed... Quitting.' ; exit 1; }

echo "Installation Completed"

