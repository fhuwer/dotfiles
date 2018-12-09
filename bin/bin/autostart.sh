#!/bin/bash
feh --bg-fill ~/.wallpaper.jpg
nm-applet &!
[ -x "$(command -v nextcloud)" ] && nextcloud &!
[[ -f "/opt/urserver/urserver-start" ]] && /opt/urserver/urserver-start --no-manager
[[ -f "$HOME/bin/autostart_local.sh" ]] && $HOME/bin/autostart_local.sh
