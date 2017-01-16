if [ -d "$HOME/bin" ] ; then
    export PATH="$HOME/bin:$PATH"
fi

export BROWSER=firefox
export EDITOR=vim

if [ -e "$HOME/.bash_profilelocal" ]; then
    source "$HOME/.bash_profilelocal"
fi

if [ "$JSL_WM_DPI" == "" ]; then
  export JSL_WM_DPI=96
fi

if [ "$JSL_WM_HINTSTYLE" == "" ]; then
  export JSL_WM_HINTSTYLE=hintfull
fi

if [ "$JSL_WM_FONT_SIZE" == "" ]; then
  export JSL_WM_FONT_SIZE=10
fi

"$HOME/.Xresources.sh" > "$HOME/.Xresources"
"$HOME/.config/gtk-3.0/settings.ini.sh" > "$HOME/.config/gtk-3.0/settings.ini"
"$HOME/.gtkrc-2.0.sh" > "$HOME/.gtkrc-2.0"
"$HOME/.i3/config.sh" > "$HOME/.i3/config"

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx -- -dpi $JSL_WM_DPI
