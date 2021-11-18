#!/bin/bash
#Created by Peter Dauwe

#Rofi is needed for this script to run
#sudo pacman -S --needed --noconfirm rofi


filename='themelist.txt'

#Remove the list
rm -f $filename


#Add all themes to the list
leftwm-theme update | grep -o -P '(?<=/).*(?=:)' > $filename

#Add a quit line to the list
printf "quit" >> $filename

#Add the list as a choise
choice=$(rofi -dmenu -i -l 20 -p 'Leftwm Themes' $@ < $filename)

#Enter what theme you would like or quit
if [[ "$choice" == quit ]]; then
    echo "No Theme Chosen"
    rm -f $filename
    exit 1
else 
    leftwm-theme install "$choice"
    leftwm-theme apply "$choice"
    rm -f $filename
    exit 1
fi


