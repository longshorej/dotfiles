#!/bin/bash

cat <<EOT
gtk-theme-name="Adwaita"
gtk-icon-theme-name="Adwaita"
gtk-font-name="Sans $JSL_WM_FONT_SIZE"
gtk-key-theme-name="Emacs"
gtk-cursor-theme-name="Adwaita"
gtk-cursor-theme-size=0
gtk-toolbar-style=GTK_TOOLBAR_BOTH
gtk-toolbar-icon-size=GTK_ICON_SIZE_LARGE_TOOLBAR
gtk-button-images=1
gtk-menu-images=1
gtk-enable-event-sounds=1
gtk-enable-input-feedback-sounds=1
gtk-xft-antialias=1
gtk-xft-hinting=1
gtk-xft-hintstyle="$JSL_WM_HINTSTYLE"
gtk-xft-rgba="rgb"
EOT
