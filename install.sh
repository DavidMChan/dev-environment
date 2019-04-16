#!/bin/bash

set -e

# Install the bashrc file
cp -a bashrc "${HOME}/.bashrc"

# Configure GIT
git config --global credential.helper store
git config --global user.name "DavidMChan"
git config --global user.email "david@iridescent.io"
git config --global core.editor vim
git config --global merge.tool vimdiff
