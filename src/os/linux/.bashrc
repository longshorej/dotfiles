# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls -N --color=auto'
    alias ll='ls -N -lh --color=auto'
    alias la='ls -N -a --color=auto'
    alias lla='ls -lh -N -a --color=auto'
    alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

. ~/.config/scripts/base16-default-dark.sh

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'
# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

alias ag="ag --hidden"
alias diff="diff --color"

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# gnome configuration
#gsettings set org.gnome.nm-applet disable-connected-notifications true
#gsettings set org.gnome.Terminal.Legacy.Settings confirm-close false
#gsettings set org.gnome.desktop.interface gtk-key-theme "Emacs"
#gsettings set org.gnome.settings-daemon.plugins.xsettings hinting "full"
#gsettings set org.gnome.desktop.wm.preferences titlebar-font "Bitstream Vera Sans 10"
#gsettings set org.gnome.desktop.interface font-name "Bitstream Vera Sans 10"
#gsettings set org.gnome.desktop.interface document-font-name "Bitstream Vera Sans 10"
#gsettings set org.gnome.settings-daemon.plugins.xsettings rgba-order 'rgb'
#gsettings set org.gnome.settings-daemon.plugins.xsettings antialiasing 'rgba'
#gsettings set org.gnome.desktop.background picture-uri "file:///$HOME/pictures/backgrounds/solar_system-wide.jpg"
#gsettings set org.gnome.desktop.wm.preferences button-layout "appmenu:minimize,maximize,close"
#gconftool-2 --type=string --set /desktop/gnome/interface/gtk_key_theme Emacs

export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%Y-%m-%d %T] "
# Change the file location because certain bash sessions truncate .bash_history file upon close.
# http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
export HISTFILE=~/.bash_eternal_history

readonly BG_RED="\[$(tput setab 1)\]"
readonly BG_GREEN="\[$(tput setab 2)\]"
readonly BG_PINK="\[$(tput setab 13)\]"
readonly FG_RED="\[$(tput setaf 1)\]"
readonly FG_BLUE="\[$(tput setaf 4)\]"
readonly FG_GREEN="\[$(tput setaf 2)\]"
readonly FG_PINK="\[$(tput setaf 13)\]"
readonly DIM="\[$(tput dim)\]"
readonly REVERSE="\[$(tput rev)\]"
readonly RESET="\[$(tput sgr0)\]"
readonly BOLD="\[$(tput bold)\]"

PS1_STARTED=0
PS1_COMMAND=""

settitle() {
  printf "\e]0;$@\a"
}

updatetitle() {
  if [ "$BASH_COMMAND" == "ps1" ]; then
    settitle "$PWD - bash"
  else
    settitle "$BASH_COMMAND - $PWD - bash"
  fi
}


if hash ag 2>/dev/null; then
  tag() { command tag "$@"; source ${TAG_ALIAS_FILE:-/tmp/tag_aliases} 2>/dev/null; }
  alias ag="tag --hidden"
fi

GIT_BRANCH=""

find_git_branch() {
  # Based on: http://stackoverflow.com/a/13003854/170413
  local branch

  if branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null); then
    if [[ "$branch" == "HEAD" ]]; then
      branch='detached*'
    fi

    GIT_BRANCH="#$branch"
  else
    GIT_BRANCH=""
  fi
}

ps1() {
  local CMD=$?

  find_git_branch

  history -a
  history -r

  PS1=""

  if [[ $PS1_STARTED -ne 0 ]]; then
    if [ $CMD -eq 0 ]; then
      PS1="$FG_GREEN-> $CMD$RESET\n\n"
    else
      PS1="$FG_RED-> $CMD$RESET\n\n"
    fi
  else
    PS1_STARTED=1
    #PS1="\n¯\_(ツ)_/¯\n\n"
    PS1=""
  fi

  PS1="$PS1$FG_PINK\w$FG_BLUE$GIT_BRANCH$FG_PINK \$$RESET "
  PS1_COMMAND=""
  #settitle "$BASH_COMMAND - $PWD - bash"
}
trap "updatetitle" DEBUG
PROMPT_COMMAND=ps1
 #PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
