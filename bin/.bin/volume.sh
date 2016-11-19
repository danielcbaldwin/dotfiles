#!/bin/bash

step=5

if [[ $# -eq 1 ]]; then
    case $1 in
        "up")
            #amixer set Master $step+ unmute;;
            sh -c "pactl set-sink-mute @DEFAULT_SINK@ false ; pactl set-sink-volume @DEFAULT_SINK@ +${step}%"
            ;;
        "down")
            #amixer set Master $step- unmute;;
            sh -c "pactl set-sink-mute @DEFAULT_SINK@ false ; pactl set-sink-volume @DEFAULT_SINK@ -${step}%"
            ;;
        "toggle")
            amixer set Master toggle
            #pactl set-sink-mute @DEFAULT_SINK@ toggle
            ;;
        *)
            echo "Invalid option";;
    esac
fi

#muted=`amixer get Master -M | grep -oE "\[(on|off)+\]" | tr -d "[]"`
#volume=`amixer get Master -M | grep -oE "[[:digit:]]*%" | tr -d "%"`

#if [[ $muted == "off" ]]; then
#    notify-send "Muted" -t 1000 -a volume-notify -i audio-volume-muted -h int:value:$volume
#else
#    notify-send "Volume" -t 500 -a volume-notify -i audio-volume-medium -h int:value:$volume
#fi
