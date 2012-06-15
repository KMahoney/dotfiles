for F in zshrc screenrc gitconfig xsession
do
    ln -s ~/dotfiles/$F ~/.$F
done
