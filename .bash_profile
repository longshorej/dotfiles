if [ -d "$HOME/bin" ] ; then
    export PATH="$HOME/bin:$PATH"
fi

export BROWSER=firefox
export EDITOR=vim

if [ -e "$HOME/.bash_profilelocal" ]; then
    source "$HOME/.bash_profilelocal"
fi

if [ "$DPI" == "" ]; then
  export DPI=96
fi

"$HOME/.Xresources.sh" > "$HOME/.Xresources"

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx -- -dpi $DPI
