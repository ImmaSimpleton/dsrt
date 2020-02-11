#!/bin/bash
#
# This script will stop DTM services
systemctl stop kismet
systemctl stop probequest
systemctl stop airodump
systemctl start NetworkManager

zenity --info --text "The DSRT's Digital Terrain Mapping services have been disabled."

