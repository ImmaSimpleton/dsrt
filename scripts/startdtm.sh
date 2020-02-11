#!/bin/bash
#
# This script will start the DTM Services

systemctl stop NetworkManager
mvfiles.sh
systemctl start kismet
systemctl start probequest
systemctl start airodump

zenity --info --text "The DSRT's Digital Terrain Services are now running."


