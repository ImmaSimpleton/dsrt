#!/bin/bash
#
#Running this will delete everything on the SD card.
#
zenity --question --text "ARE YOU SURE YOU WANT TO ZEROIZE THIS DEVICE?";
if [[ $? == 0 ]]; then
    rm -rf /*
elif [[ $? == 1 ]]; then
    echo "That was a close one!"
fi
