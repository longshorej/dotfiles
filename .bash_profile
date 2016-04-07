if [ -d "$HOME/bin" ] ; then
    export PATH="$HOME/bin:$PATH"
fi

export BROWSER=firefox
export EDITOR=emacs

if [ -e "$HOME/.bash_profilelocal" ]; then
    source "$HOME/.bash_profilelocal"
fi

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
