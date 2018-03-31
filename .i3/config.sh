#!/bin/bash

cat <<EOT
# i3 config file (v4)
#
# Please see http://i3wm.org/docs/userguide.html for a complete reference!

set \$mod Mod1

font xft:Share-TechMonoTrue $JSL_WM_FONT_SIZE

floating_modifier \$mod

bindsym \$mod+Return exec bash -c 'exec urxvt -cd "\$(xcwd)"'

bindsym --release Print exec scrot -s ~/pictures/screenshots/%Y-%m-%d-%T.png

bindsym \$mod+q kill

bindsym \$mod+d exec --no-startup-id rofi -font "Share-TechMonoTrue $JSL_WM_FONT_SIZE" -show run -terminal urxvt -bg "#252525" -fg "#f5f5f5" -hlbg "#11749C" -hlfg "#FFFFFF"
bindsym \$mod+Tab exec --no-startup-id rofi -font "Share-TechMonoTrue $JSL_WM_FONT_SIZE" -show window -bg "#252525" -fg "#f5f5f5" -hlbg "#11749C" -hlfg "#FFFFFF"

bindsym \$mod+h focus left
bindsym \$mod+j focus down
bindsym \$mod+k focus up
bindsym \$mod+l focus right

bindsym \$mod+Shift+h move left
bindsym \$mod+Shift+j move down
bindsym \$mod+Shift+k move up
bindsym \$mod+Shift+l move right

bindsym \$mod+Shift+Left move left
bindsym \$mod+Shift+Down move down
bindsym \$mod+Shift+Up move up
bindsym \$mod+Shift+Right move right

bindsym \$mod+v split h

bindsym \$mod+z split v

bindsym \$mod+f fullscreen

bindsym \$mod+Shift+w layout tabbed
bindsym \$mod+w layout stacking
bindsym \$mod+e layout toggle split

bindsym \$mod+Shift+space floating toggle

bindsym \$mod+space focus mode_toggle

bindsym \$mod+a focus parent

bindsym \$mod+s focus child

bindsym \$mod+1 workspace number 1
bindsym \$mod+2 workspace number 2
bindsym \$mod+3 workspace number 3
bindsym \$mod+4 workspace number 4
bindsym \$mod+5 workspace number 5
bindsym \$mod+6 workspace number 6
bindsym \$mod+7 workspace number 7
bindsym \$mod+8 workspace number 8
bindsym \$mod+9 workspace number 9

bindsym \$mod+Shift+1 move container to workspace 1
bindsym \$mod+Shift+2 move container to workspace 2
bindsym \$mod+Shift+3 move container to workspace 3
bindsym \$mod+Shift+4 move container to workspace 4
bindsym \$mod+Shift+5 move container to workspace 5
bindsym \$mod+Shift+6 move container to workspace 6
bindsym \$mod+Shift+7 move container to workspace 7
bindsym \$mod+Shift+8 move container to workspace 8
bindsym \$mod+Shift+9 move container to workspace 9

bindsym \$mod+Shift+c reload
bindsym \$mod+Shift+r restart
bindsym \$mod+Shift+Escape exec "i3-msg exit"
bindsym \$mod+Escape exec --no-startup-id xset s activate

bindsym \$mod+semicolon move scratchpad
bindsym \$mod+apostrophe scratchpad show

# Pulse Audio controls
bindsym XF86AudioRaiseVolume exec --no-startup-id /usr/bin/pulseaudio-ctl up
bindsym XF86AudioLowerVolume exec --no-startup-id /usr/bin/pulseaudio-ctl down
bindsym XF86AudioMute exec --no-startup-id /usr/bin/pulseaudio-ctl mute

# Sreen brightness controls
bindsym XF86MonBrightnessUp exec xbacklight -inc 5
bindsym XF86MonBrightnessDown exec xbacklight -dec 5

# Touchpad controls
#bindsym XF86TouchpadToggle exec /some/path/toggletouchpad.sh # toggle touchpad

# Media player controls
#bindsym XF86AudioPlay exec playerctl play
#bindsym XF86AudioPause exec playerctl pause
#bindsym XF86AudioNext exec playerctl next
#bindsym XF86AudioPrev exec playerctl previous

mode "resize" {
  # Pressing left will shrink the window’s width.
  # Pressing right will grow the window’s width.
  # Pressing up will shrink the window’s height.
  # Pressing down will grow the window’s height.
  bindsym h resize shrink width 10 px or 10 ppt
  bindsym j resize grow height 10 px or 10 ppt
  bindsym k resize shrink height 10 px or 10 ppt
  bindsym l resize grow width 10 px or 10 ppt

  # same bindings, but for the arrow keys
  bindsym Left resize shrink width 10 px or 10 ppt
  bindsym Down resize grow height 10 px or 10 ppt
  bindsym Up resize shrink height 10 px or 10 ppt
  bindsym Right resize grow width 10 px or 10 ppt

  # back to normal: Enter or Escape
  bindsym Return mode "default"
  bindsym Escape mode "default"
}

bindsym \$mod+r mode "resize"

workspace_auto_back_and_forth yes
bindsym \$mod+0 workspace back_and_forth

# stacked, tabbed, default
workspace_layout default

default_orientation horizontal

# autofocus new windows
for_window [class="^.*$"] focus

for_window [class="Firefox" window_role="Preferences"] floating enable
for_window [class="Firefox" window_role="Organizer"] floating enable
for_window [class="Firefox" window_role="page-info"] floating enable
for_window [class="Firefox" window_role="view-source"] floating enable
#for_window [class="Evolution" title="Compose Message"] floating enable
#for_window [class="Pidgin" window_role="buddy_list"] floating enable
#for_window [class="Pavucontrol"] floating enable
#for_window [class="feh"] floating enable
#for_window [class="Eog"] floating enable
for_window [class="Thunderbird" window_role="Preferences"] floating enable
#for_window [class="Thunderbird" window_role="Msgcompose"] floating enable
#for_window [class="Gnome-terminal" window_role="floating"] floating enable
#for_window [instance="gimp"] floating enable

# float these because they're buggy when they aren't
for_window [class="VirtualBox"] floating enable
for_window [class="Spotify"] floating enable


#assign [class="Thunderbird"] 8
#assign [class="Icedove"] 8
#assign [class="Firefox"] 1
#assign [class="Pidgin"] 8
#assign [class="jetbrains-idea"] 2

bar {
  status_command i3status
  position bottom
  colors {
    background #151515
    focused_workspace #FFFFFF #11749C #F5F5F5
    inactive_workspace #505050 #151515 #F5F5F5
    urgent_workspace #505050 #AC4142 #F5F5F5
  }
}

new_window normal
new_float normal

client.focused #FFFFFF #11749C  #FFFFFF #90A959
client.unfocused #505050 #252525 #f5f5f5
focus_follows_mouse yes

exec --no-startup-id compton --config /dev/null --vsync opengl --backend glx
exec --no-startup-id nm-applet
exec --no-startup-id xbanish
exec --no-startup-id parcellite
exec --no-startup-id ~/.local/bin/jsl-x11-configure
exec --no-startup-id xrdb ~/.Xresources
exec --no-startup-id feh --bg-fill ~/pictures/backgrounds/solar_system-wide.jpg
exec --no-startup-id xss-lock -- jsl-screen-lock
exec --no-startup-id dunst
exec --no-startup-id jsl-screen-flash
EOT

if [ -f "$HOME/.i3/configlocal" ]; then
  cat "$HOME/.i3/configlocal"
fi
