# Copy the dotfiles to their appropriate location

if [ ! -d $HOME ]; then
    echo "No home variable set."
    exit 1
fi

if [ $# != 1 ]; then
    echo "Did you edit fehbg?"
fi

cp tmux.conf $HOME/.tmux.conf
cp vimrc $HOME/.vimrc
cp Xresources $HOME/.Xresources
cp i3_config $HOME/.config/i3/config
cp fehbg $HOME/.fehbg

exit 0
