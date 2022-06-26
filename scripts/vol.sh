#!/bin/sh
# Read volume output level from sndio

mute=$(sndioctl output.mute | cut -d "=" -f2)
if [[ $mute -eq 1 ]]; then 
  echo "muted"
else
  level=$(sndioctl output.level | cut -d "=" -f2)
  printf "%.0f%%\n" $(echo "$level * 100" | bc)
fi
