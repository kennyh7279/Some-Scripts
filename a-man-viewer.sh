#!/bin/sh

GETLIST=$(man -k . | awk '{print $1;}')

SELECTION=$(kdialog --menu "Select Page" $GETLIST \
    --title "A Man Viewer" --geometry 600x600)
if [ "$?" = 0 ]; then
    man "$SELECTION" | col -bx | tee /tmp/man.txt | kdialog --textbox /tmp/man.txt /dev/stdin --geometry 800x800
elif [ "$?" = 1 ]; then
    exit 0
else
    kdialog --error "An error occured"
fi
