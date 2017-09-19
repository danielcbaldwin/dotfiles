#!/usr/bin/env sh

  # Terminate already running bar instances
  killall -q polybar

  # Wait until the processes have been shut down
  while pgrep -x polybar >/dev/null; do sleep 1; done

  # Launch bar
  #MONITOR=eDP1 polybar -r $@ &
  #MONITOR=HDMI1 polybar -r $@ &
  #MONITOR=DP2 polybar -r $@ &

  for monitor in $(xrandr -q | grep -e "\sconnected\s" | cut -d ' ' -f1); do
    if [ "$(xrandr -q | grep -e "\sconnected\s" | grep $monitor | grep -c primary)" == "1" ]; then
      MONITOR=$monitor polybar mainwithtray &
    else
      MONITOR=$monitor polybar main &
    fi
  done

  echo "Bar launched..."
