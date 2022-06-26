#!/bin/sh
# Print out specified sensor's temperature reading from sysctl (OpenBSD only!)

sysctl hw.sensors.ksmn$1.temp$2 | sed -E 's/^.*=([0-9]+\.[0-9]+).*$/\1/' | xargs printf '%.1f °C\n'
