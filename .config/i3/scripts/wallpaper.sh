#!/bin/bash
find $HOME/.config/wallpapers/current -type l -name '*.jpg' -o -name '*.png' | shuf -n 1 | xargs feh --bg-tile
