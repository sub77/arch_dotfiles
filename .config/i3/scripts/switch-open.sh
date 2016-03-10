#!/bin/bash
case $1 in
        commandline)
                i3_conid=$(i3-msg -t get_tree | tr ',' '\n' | grep -B 40 "\"title\":\"CommandLine\"" | grep "\"id\"" | awk -F ':' '{printf $NF}')
                if [ -z $i3_conid ]; then
                        termite -t 'CommandLine' &
                else
                        i3-msg "[con_id="$i3_conid"] focus" &>/dev/null
                fi
        ;;
        pcmanfm)
                i3_conid=$(i3-msg -t get_tree | tr '[:upper:]' '[:lower:]'| tr ',' '\n' | grep -B 40 "\"class\":\"pcmanfm\"" | grep "\"id\"" | awk -F ':' '{printf $NF}')
                if [ -z $i3_conid ]; then
                        pcmanfm &
                else
                        i3-msg "[con_id="$i3_conid"] focus" &>/dev/null
                fi
        ;;
        thunar)
                i3_conid=$(i3-msg -t get_tree | tr ',' '\n' | grep -B 40 "\"class\":\"Thunar\"" | grep "\"id\"" | awk -F ':' '{printf $NF}')
                if [ -z $i3_conid ]; then
                        thunar &
                else
                        i3-msg "[con_id="$i3_conid"] focus" &>/dev/null
                fi
        ;;
        ncmpcpp)
                i3_conid=$(i3-msg -t get_tree | tr ',' '\n' | grep -n -B 28 "\"name\":\"ncmpcpp\"" | grep "\"id\"" | awk -F ':' '{printf $NF}')
                if [ -z $i3_conid ]; then
                        urxvt -e ncmpcpp -s playlist &
                else
                        i3-msg "[con_id="$i3_conid"] focus" &>/dev/null
                fi
        ;;
        mail)
                i3_conid=$(i3-msg -t get_tree | tr ',' '\n' | grep -B 40 "\"class\":\"Thunderbird\"" | grep "\"id\"" | awk -F ':' '{printf $NF}')
                if [ -z $i3_conid ]; then
                        /usr/bin/thunderbird &
                else
                        i3-msg "[con_id="$i3_conid"] focus" &>/dev/null
                fi
        ;;
        smuxi)
                i3_conid=$(i3-msg -t get_tree | tr ',' '\n' | grep -B 40 "\"class\":\"Smuxi-frontend-gnome\"" | grep "\"id\"" | awk -F ':' '{printf $NF}')
                if [ -z $i3_conid ]; then
                        /usr/bin/smuxi-frontend-gnome &
                else
                        i3-msg "[con_id="$i3_conid"] focus" &>/dev/null
                fi
        ;;
esac
