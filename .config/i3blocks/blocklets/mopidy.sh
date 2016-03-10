#!/bin/bash
#
# Author: Raphael P. Ribeiro <raphaelpr01@gmail.com>
mpcstat=$(mpc | grep -v '^volume:')

play=""
pause=""
stop=""
next=""
prev=""

function open_ncmpcpp() {
        i3_conid=$(i3-msg -t get_tree | tr ',' '\n' | grep -n -B 28 "\"name\":\"ncmpcpp\"" | grep "\"id\"" | awk -F ':' '{printf $NF}')
        if [ -z $i3_conid ]; then
                urxvt -e ncmpcpp -s playlist
        else
                i3-msg "[con_id="$i3_conid"] focus"
        fi
}

if [ -z "${mpcstat}" ]; then # if not artist, exit
        if [ "$1" == '1' ]; then
                echo "<span color='#7a7a7a'>$stop</span>"
                case $BLOCK_BUTTON in
                1) mpc play ;;
                esac
        elif [ "$1" == '3' ]; then
                echo "<span color='#7a7a7a'>$prev</span>" || exit 1
        elif [ "$1" == '4' ]; then
                echo "<span color='#7a7a7a'>$next</span>" || exit 1
        else
                echo "<span color='#7a7a7a'>MPD NOT RUNNING?</span>"
                case $BLOCK_BUTTON in
                        1) open_ncmpcpp ;;
                esac
        fi
else
        if [ "$1" == '1' ]; then # if arg = 1, show music symbols
                mpcstat2=`echo "${mpcstat}" | sed 's,  *, ,g; 1h;1d;2G' | head -n1 | cut -d ']' -f 1 | tr -d [`
                [ "$mpcstat2" = "paused" ] && echo "<span color='#000000'>$play</span>"  || echo "<span color='#000000'>$pause</span>"
                case $BLOCK_BUTTON in
                        1) mpc toggle ;;
                        3) mpc stop ;;
                esac
        elif [ "$1" == '3' ]; then
                echo "<span color='#000000'>$prev</span>"
                case $BLOCK_BUTTON in
                        1) mpc prev ;;
                esac
        elif [ "$1" == '4' ]; then
                echo "<span color='#000000'>$next</span>"
                case $BLOCK_BUTTON in
                        1) mpc next ;;
                esac
        else # else, show what's artist
                current_artist=$(echo "${mpcstat}" | sed 's,  *, ,g; 1h;1d;2G' | paste -d' ' -s - | cut -d ')' -f2 | cut -d '-' -f1 | cut -d ' ' -f2-50)
                current_title=$(echo "${mpcstat}" | sed 's,  *, ,g; 1h;1d;2G' | paste -d' ' -s - | cut -d ')' -f2 | cut -d '-' -f2 | cut -d ' ' -f2-50)
                timeplayed=`echo "${mpcstat}" | sed 's,  *, ,g; 1h;1d;2G' | paste -d' ' -s - | head -n1 | cut -d ' ' -f3`
                echo "<b><span color='#309bda'>$current_artist</span></b><span color='#000000'>- $current_title </span> <span color='#a1a1a1'>($timeplayed)</span>"
                # case $BLOCK_BUTTON in
                #         1) open_ncmpcpp ;;
                # esac
        fi
fi
