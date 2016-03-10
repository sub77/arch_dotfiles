#!/bin/bash
function thunderbird_status() {
    i3_conid=$(i3-msg -t get_tree | tr ',' '\n' | grep -B 40 "\"class\":\"Thunderbird\"" | grep "\"id\":" | awk -F ':' '{printf $NF}')
    if [ -z $i3_conid ]; then
            /usr/bin/thunderbird &
    else
            i3-msg "[con_id="$i3_conid"] focus" &>/dev/null
    fi
}

function open_mail() {
    thunderbird_status &>/dev/null
    $HOME/.config/i3blocks/blocklets/mail.py get-unseen
    pkill -RTMIN+1 i3blocks
}

function read_mail() {
    $HOME/.config/i3blocks/blocklets/mail.py set-seen
    pkill -RTMIN+1 i3blocks
}

case $BLOCK_BUTTON in
    1)
    open_mail
    ;;
    3)
    read_mail
    ;;
esac

$HOME/.config/i3blocks/blocklets/mail.py get-unseen
