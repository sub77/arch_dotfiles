#!/bin/bash

sudo pacman -Sy >> /dev/null

list=($(pacaur -Quq))
size=${#list[@]}

if [ "$size" -ge '1' ]; then
        echo "<span color='#42accf'></span>   <span color='#707070'>$size</span>"
        case $BLOCK_BUTTON in
                1 ) termite -t SysUPDATE -e "bash -c ~/.config/i3blocks/blocklets/pacupdate.sh" &>/dev/null
        esac
else
        echo "<span color='#b3b3b3'></span>   <span color='#b3b3b3'>$size</span>"
fi
#echo $size #full_text
#echo $size #short_text
#if [ "$size" != "0" ]; then
#    echo "#52FF46"
#fi
