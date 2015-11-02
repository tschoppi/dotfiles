# Copy the dotfiles to their appropriate location

if [ ! -d $HOME ]; then
    echo "No home variable set."
    exit 1
fi

cp tmux.conf $HOME/.tmux.conf
cp vimrc $HOME/.vimrc

exit 0
