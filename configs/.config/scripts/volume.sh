#!/bin/bash

# You can call this script like this:
# $./volume.sh up
# $./volume.sh down
# $./volume.sh mute

# Arbitrary but unique message tag
# msgTag="myvolume"

#Icon settings
icon_volume_high="${BASH_SOURCE%/*}/icons/notification-audio-volume-high.svg"
icon_volume_medium="${BASH_SOURCE%/*}/icons/notification-audio-volume-medium.svg"
icon_volume_low="${BASH_SOURCE%/*}/icons/notification-audio-volume-low.svg"
icon_volume_muted="${BASH_SOURCE%/*}/icons/notification-audio-volume-muted.svg"

function get_volume {
    wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{ print $2 * 100 }'
}

function is_mute {
    wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{ print $3 }'
}

function send_notification {
    volume="$(get_volume)"
    if [  "$volume" -lt "30" ]; then
        icon=$icon_volume_low
    elif [  "$volume" -lt "70" ]; then
        icon=$icon_volume_medium
    else
        icon=$icon_volume_high
    fi
    dunstify -a "changeVolume" \
    -t 1000 \
    -u normal \
    -I $icon\
    -r 3452\
    -h int:value:"$volume" "${volume}%"
    # -h string:x-dunst-stack-tag:$msgTag \
}

case $1 in
    up)
        wpctl set-mute @DEFAULT_AUDIO_SINK@ 0 > /dev/null
        wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+ > /dev/null
        send_notification
	;;
    down)
        wpctl set-mute @DEFAULT_AUDIO_SINK@ 0 > /dev/null
        wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%- > /dev/null
        send_notification
	;;
    mute)
        wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle > /dev/null
        if [[ "$(is_mute)" == "[MUTED]" ]] ; then
            dunstify -a "changeVolume" \
            -t 1000 \
            -u normal \
            -I $icon_volume_muted \
            -r 3452 \
            "Volume muted" 
            # -h string:x-dunst-stack-tag:$msgTag \
        else
            send_notification
        fi
	;;
esac
