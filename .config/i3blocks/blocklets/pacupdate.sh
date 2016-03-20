#!/bin/bash
msg(){
    echo "$(tput bold)$(tput setaf 5)> ${@}$(tput sgr0)"
}
msgp(){
    read -p "$(tput bold)$(tput setaf 14)> ${@}$(tput sgr0)"
}
msg "Processing pacman packages ..."
pacupg
sleep 1
msg "Processing AUR packages ..."
sleep 1
pacupg -a
notify-send -u normal -c SYSTEM "All system updates are done."
pkill -RTMIN+1 i3blocks
msgp "Updates are done. Please exit this terminal with [ENTER]."
msg "Exiting ..."
exit
