#!/bin/bash
if pgrep -x "picom" > /dev/null
then
	killall picom
else
	picom -b --config ~/.config/leftwm/themes/current/picom.conf
fi
