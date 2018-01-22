#!/usr/bin/env sh
if ! pgrep spotify >/dev/null; then
    echo ""; exit
fi

if [ "$(playerctl status)" = "Playing" ]; then
  title=`exec playerctl metadata xesam:title`
  artist=`exec playerctl metadata xesam:artist`
  echo "$artist - $title"
else
  echo ""
fi

