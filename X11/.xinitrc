#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
   for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
      [ -x "$f" ] && . "$f"
   done
   unset f
fi

# Xresoures
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

if [ -f "$HOME/.Xmodmap" ]; then
  xmodmap "$HOME/.Xmodmap"
fi

# Load display settings
[[ -f "$HOME/bin/setxrandr.sh" ]] && $HOME/bin/setxrandr.sh

# Basic settings
xset -b
setxkbmap 'de(us)'
if `hash synclient 2>/dev/null`; then
  synclient VertScrollDelta=-100 HorizScrollDelta=-100 TapButton1=1 TapButton2=0 TapButton3=0 HorizTwoFingerScroll=1
fi
xset r rate 500 33

$HOME/.screenlayout/normal.sh

setxkbmap -option "caps:escape" -option "compose:menu"
export GTK_IM_MODULE=xim
# export XMODIFIERS=@im=ibus
export QT_IM_MODULE=xim

# Make VA-API use NVIDIA NVDEC
if [[ "$(hostnamectl hostname)" == "sagarmatha" ]]; then
  export LIBVA_DRIVER_NAME=nvidia
fi

# Gnome Keyring
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

# Start desktop
exec i3
