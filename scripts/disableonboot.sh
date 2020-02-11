#!/bin/bash
#
#Disables all DTM services and Enables NetworkManager

systemctl disable kismet
systemctl disable probequest
systemctl disable airodump
systemctl enable NetworkManager

zenity --info --text "The DSRT's Digital Terrain Mapping services has been turned off"

