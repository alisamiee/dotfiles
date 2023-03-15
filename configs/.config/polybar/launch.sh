#!/bin/bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload mainbar &
  done
else
  polybar --reload mainbar &
fi
# Launch Polybar, using default config location ~/.config/polybar/config.ini
# polybar example 2>&1 | tee -a /tmp/polybar.log & disown

echo "Polybar launched..."
