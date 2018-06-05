#!/bin/bash
feh --bg-fill ~/.wallpaper.jpg
dropbox start
nm-applet &!
blueman-applet &!
[[ -f "/opt/urserver/urserver-start" ]] && /opt/urserver/urserver-start --no-manager
[[ -f "$HOME/bin/autostart_local.sh" ]] && $HOME/bin/autostart_local.sh
