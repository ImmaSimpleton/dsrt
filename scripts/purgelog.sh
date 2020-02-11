#!/bin/bash
#
# This script will delete all the logs on the DSRT
cd /root/Desktop/DSRT/
cd Kismet
rm ./* 2> /dev/null
rm /csv/* 2> /dev/null
rm /kml/* 2> /dev/null
cd ../Probequest
rm ./* 2> /dev/null
cd ../Airodump
rm ./* 2> /dev/null
rm -rf ~/.local/share/Trash/* 2> /dev/null
