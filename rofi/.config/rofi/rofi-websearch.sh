#!/usr/bin/env bash

query="$(rofi -dmenu -p ' ' -l 0)"
[ -n "$query" ] && xdg-open "https://www.google.com/search?q=$(echo "$query" | sed 's/ /+/g')"
