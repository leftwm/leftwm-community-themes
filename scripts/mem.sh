#!/bin/sh
# Shamelessly borrowed from neofetch ¯\_(ツ)_/¯ https://github.com/dylanaraps/neofetch

mem_total="$(($(sysctl -n hw.physmem) / 1024 / 1024))"
mem_used="$(vmstat | awk 'END {printf $3}' | tr -d "M")"
mem_perc=$(($mem_used * 100 / $mem_total))

printf "$mem_perc%%\n"
