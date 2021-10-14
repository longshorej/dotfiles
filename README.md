# longshorej's dotfiles

This repository contains programs and configurations for my computers.

## Features

...

## Installation

### Step One

```sh
$ git clone https://github.com/longshorej/dotfiles ~/work/dotfiles
$ ~/work/dotfiles/src/base/.local/bin/jsl-install-dotfiles
```

### Step Two (macOS)

Manual installation, given new computers are acquired fairly rarely and thus
any automation likely to break during that timeframe.

Add this line to `.bash_profile`:

```sh
[ -f ~/.local/.bash_profile ] && source ~/.local/.bash_profile
```

Add this line to `.bashrc`:

```sh
[ -f ~/.local/.bashrc && source ~/.local/.bashrc ]
```

Add this line to `.zshrc`:
```sh
[ -f ~/.local/.zshrc && source ~/.local/.zshrc ]
```


### Step Two (Linux)

TODO - likely focus on home directory ssh, rather than wm in previous iterations
TODO - because WM outsourced to apple

## Configuration (Environment Variables)

###### JSL_WM_DPI

###### JSL_WM_HINTSTYLE

###### JSL_WM_FONT_SIZE

###### JSL_DOTFILES_MODULES
Contains space-separated paths to modules that are installed when jsl-install-dotfiles is run.

## License

[GNU GENERAL PUBLIC LICENSE Version 3](https://github.com/longshorej/dotfiles/blob/master/LICENSE) © Jason Longshore
