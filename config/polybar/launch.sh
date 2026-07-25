#!/usr/bin/env sh

pkill polybar 2>/dev/null

while pgrep -x polybar >/dev/null; do
    sleep 0.5
done

polybar main &
