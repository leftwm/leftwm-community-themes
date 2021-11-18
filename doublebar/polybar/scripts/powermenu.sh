#!/usr/bin/env bash

export SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

#Find all your wallpapers
DIR="/usr/share/backgrounds/*"
#Select wallpaper at random
SCREEN=$(ls $DIR/*.jpg | shuf -n1)


THEME="$SCRIPTPATH/rofi/powermenu.rasi"

rofi_command="rofi -no-config -theme $THEME"

# Options
shutdown="Shutdown"
reboot="Restart"
lock="Lock"
suspend="Suspend"
logout="Logout"

# Variable passed to rofi
options="$lock\n$suspend\n$logout\n$reboot\n$shutdown"

chosen="$(echo -e "$options" | $rofi_command -dmenu -selected-row 0)"
case $chosen in
    $shutdown)
        systemctl poweroff
        ;;
    $reboot)
		systemctl reboot
        ;;
    $lock)
		if [[ -f /usr/bin/i3lock ]]; then
			convert -resize $(xdpyinfo | grep dimensions | cut -d\  -f7 | cut -dx -f1) $SCREEN -blur 0x4 $SCRIPTPATH/blurlock.png
            i3lock -i $SCRIPTPATH/blurlock.png
		elif [[ -f /usr/bin/betterlockscreen ]]; then
			convert -resize $(xdpyinfo | grep dimensions | cut -d\  -f7 | cut -dx -f1) $SCREEN -blur 0x4 $SCRIPTPATH/blurlock.png
            betterlockscreen -l $SCRIPTPATH/blurlock.png
		fi
        ;;
    $suspend)
		systemctl suspend
        ;;
    $logout)
        loginctl kill-session $XDG_SESSION_ID
        ;;
esac

rm $SCRIPTPATH/blurlock.png