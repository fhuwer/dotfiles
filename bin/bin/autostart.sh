#!/bin/bash
feh --bg-fill ~/.wallpaper.jpg
i3-msg "workspace 1; append_layout ~/.config/i3/workspace-1.json"
thunderbird &!
dropbox start
nm-applet &!
blueman-applet &!
[[ -f "/opt/urserver/urserver-start" ]] && /opt/urserver/urserver-start --no-manager
