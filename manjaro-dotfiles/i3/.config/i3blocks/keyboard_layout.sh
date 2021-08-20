#!/bin/sh

VAR=$(xset -q|grep LED| awk '{ print $10 }')

case "$(xset -q|grep LED| awk '{ print $10 }')" in
  "00000000") KBD="Eng" ;;
  "00001000") KBD="Ru" ;;
  *) KBD="unknown" ;;
esac

echo $KBD
