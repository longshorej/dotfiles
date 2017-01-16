#!/bin/bash

cat <<EOT
Xft.dpi: $JSL_WM_DPI
Xft.autohint: 0
Xft.lcdfilter:  lcddefault
Xft.hintstyle: $JSL_WM_HINTSTYLE
Xft.hinting: 1
Xft.antialias: 1
Xft.rgba: rgb

Xcursor.theme: Adwaita

URxvt*scrollTtyOutput: false
URxvt*scrollWithBuffer: true
!URxvt.color12: rgb:5c/5c/ff
URxvt*scrollTtyKeypress: true
URxvt.font: xft:Share\\\\-TechMonoTrue:size=$JSL_WM_FONT_SIZE:antialias=true
URxvt.boldFont: xft:Share\\\\-TechMonoTrue:bold:size=$JSL_WM_FONT_SIZE:antialias=true
URxvt*scrollBar: false
!URxvt*background: Black
!URxvt*foreground: White
URxvt.letterSpace: 0
URxvt.cursorBlink: 1
URxvt.urgentOnBell: true
URxvt*visualBell: false

rofi.dpi: $JSL_WM_DPI
rofi.color-enabled: true
rofi.separator-style: solid
rofi.color-window: #151515,#f5f5f5
rofi.color-active: #151515,#f5f5f5,#151515,#666666,#ffffff
rofi.color-normal: #151515,#f5f5f5,#151515,#11749c,#ffffff
rofi.color-urgent: #151515,#f5f5f5,#151515,#ac4142,#ffffff

URxvt*background: #000000
URxvt*foreground: #ffffff
! black
URxvt.color0  : #000000
URxvt.color8  : #555555
! red
URxvt.color1  : #AA0000
URxvt.color9  : #FF5555
! green
URxvt.color2  : #00AA00
URxvt.color10 : #55FF55
! yellow
URxvt.color3  : #AA5500
URxvt.color11 : #FFFF55
! blue
URxvt.color4  : #0000AA
URxvt.color12 : #5555FF
! magenta
URxvt.color5  : #AA00AA
URxvt.color13 : #FF55FF
! cyan
URxvt.color6  : #00AAAA
URxvt.color14 : #55FFFF
! white
URxvt.color7  : #AAAAAA
URxvt.color15 : #FFFFFF
EOT
