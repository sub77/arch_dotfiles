#!/bin/bash
sleep 1
scrot /tmp/screen.png
convert /tmp/screen.png -scale 20% -scale 500% /tmp/screen.png
[[ -f $1 ]] && convert /tmp/screen.png $1 -gravity center -composite -matte /tmp/screen.png
#dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Stop
i3lock-color -u -i /tmp/screen.png
rm /tmp/screen.png
