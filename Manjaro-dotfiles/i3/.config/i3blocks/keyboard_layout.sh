#!/bin/sh

VAR=$(xset -q|grep LED| awk '{ print $10 }')

case "$(xset -q|grep LED| awk '{ print $10 }')" in
  "00000000") KBD="eng" ;;
  "00000001") KBD="ENG" ;;
  "00001000") KBD="rus" ;;
  "00001001") KBD="RUS" ;;
  *) KBD="unknown" ;;
esac

echo $KBD
