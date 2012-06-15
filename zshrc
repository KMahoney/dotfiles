unsetopt correctall

PATH=$PATH:$HOME/.rvm/bin

ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh

for SRC in $HOME/dotfiles/shell/*
do
    source $SRC
done

source /etc/bash_completion.d/virtualenvwrapper
source $HOME/.nvm/nvm.sh
source $HOME/.rvm/scripts/rvm
