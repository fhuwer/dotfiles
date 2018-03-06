#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
   for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
      [ -x "$f" ] && . "$f"
   done
   unset f
fi

# Xresoures
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# Load display settings
[[ -f "$HOME/bin/setxrandr.sh" ]] && $HOME/bin/setxrandr.sh

# Basic settings
xset -b
setxkbmap us
synclient VertScrollDelta=-100 HorizScrollDelta=-100 TapButton1=1 TapButton2=0 TapButton3=0 HorizTwoFingerScroll=1
xset r rate 500 33

# Start desktop
exec i3
